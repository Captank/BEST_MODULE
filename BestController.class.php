<?php

namespace Budabot\User\Modules;

/**
 * Authors: 
 *  - comes later
 *
 * @Instance
 *
 *	@DefineCommand(
 *		command     = 'best',
 *		accessLevel = 'all',
 *		description = 'Finds the highest ql you can wear',
 *		help        = 'best.txt'
 *	)
 *
 */
class BestController {
	/**
	 * Name of the module.
	 * Set automatically by module loader.
	 */
	public $moduleName;
	
	/** @Inject */
	public $db;
	
	/** @Inject */
	public $text;
	
	/** @Inject */
	public $util;
	
	private $skills = Array("strength"=>0, "stamina"=>0, "sense"=>0, "agility"=>0, "intelligence"=>0, "psychic"=>0);
	
	/**
	 * @Setup
	 */
	public function setup() {
		$this->db->loadSQLFile($this->moduleName, "best");
	}
	
	/**
	 * Handler to calculate gear QLs
	 *
	 * @HandlesCommand("best")
	 * @Matches("/^best ([a-z]+) (.+)$/i")
	 * @Matches("/^best '([^']+)' (.+)$/i")
	 * @Matches('/^best "([^']+)" (.+)$/i')
	 */
	public function bestCommand($message, $channel, $sender, $sendto, $args) {
		$name = $args[1];
		$args = preg_split("~[^a-z0-9]+~i",$args[2],-1,PREG_SPLIT_NO_EMPTY);
		$expect = "v";
		$n = Array();
		$v = Array();
		foreach($args as $arg) {
			if($expect == "v" && preg_match("~^[0-9]+$~", $arg)) {
				$v[] = $arg;
				$expect = "n";
			}
			elseif($expect == "n" && preg_match("~^[a-z]+$~i", $arg)) {
				$n[] = $arg;
				$expect = "v";
			}
			else {
				return false;
			}
		}
		$c = count($n);
		if($c != count($v)) {
			return false;
		}
		$args = Array();
		$msg = Array();
		for($i = 0; $i < $c; $i++) {
			if($skill = $this->getSkill($n[$i])) {
				$args[$skill] = $v[$i];
			}
			else {
				$msg[] = $n[$i];
			}
		}
		if(count($msg) > 0) {
			$msg = "Error! Invalid skills: ".implode(", ", $msg);
		}
		else {
			$items = $this->getItems($name);
			if(!count($items)) {
				$items = $this->getItems($name);
			}
			$c = count($items);
			if($c == 0) {
				$msg = "Error! Gear <highlight>$name<end> not available.";
			}
			else{
				$qls = Array();
				foreach($items as $item) {
					var_dump($this->interpolate($args, $item));
				}
			}
		}
		$sendto->reply($msg);
	}
	
	/**
	 * Get items with a specific name.
	 * @params string $name - name of item (or sql pattern)
	 * @params boolean $like - default false, defines if its searched by LIKE '%$name%' instead of = '$name'
	 * @return returns array of DBRow
	 */
	public function getItems($name, $like = false) {
		$name = strtolower($name);
		if($like){
			$name = "%$name%";
			$sql = <<<EOD
SELECT
	`id`,`name`,`reqs`
FROM
	`best_items`
WHERE
	`name` LIKE ?
ORDER BY
	`name` ASC
EOD;
		}
		else {
			$sql = <<<EOD
SELECT
	`id`,`name`,`reqs`
FROM
	`best_items`
WHERE
	`name` = ?
EOD;
		}
		return $this->db->query($sql, $name);
	}
	
	/**
	 * Get item requirement sets.
	 *
	 * @param int $id - item id
	 * @return array of DBRow - requirement sets.
	 */
	public function getItemRequirements($id) {
		$sql = <<<EOD
SELECT
	`ql`, `item_ref`, `reqs`
FROM
	`best_requirements`
WHERE
	`item_id` = ?
ORDER BY
	`ql` ASC
EOD;
		return $this->db->query($sql, $id);
	}
	
	/**
	 *	Get the full name of the skill pattern.
	 *
	 * @param string $name skill pattern
	 * @return string, full name of skill, false if invalid pattern
	 */
	public function getSkill($name) {
		$name = strtolower($name);
		if(isset($this->skills[$name])) {
			return $name;
		}
			
		$result = false;
		foreach($this->skills as $skill => $u) {
			if($this->util->startsWith($skill, $name)) {
				if($result) {
					return false;
				}
				$result = $skill;
			}
		}
		return $result;
	}
	
	/**
	 * Get interpolated QL for an item by given skills.
	 *
	 * @param array $skills - the skills array
	 * @param DBRow $item - the item
	 * @return int interpolated QL, false if not possible to calculate.
	 */
	public function interpolate($skills, $item) {
		$reqsets = $this->getItemRequirements($item->id);
		$item->reqs = $this->swapArray(explode(";", $item->reqs));
		foreach($reqsets as &$set) {
			$set->reqs = explode(";", $set->reqs);
		}
		$ii = Array("ql" => 9999);
		foreach($skills as $skill => $value) {
			if(isset($item->reqs[$skill])) {
				$tmp = $this->interpolateAllReqSets($reqsets, $item->reqs[$skill], $value);
				if($tmp && $tmp["ql"] < $ii["ql"]) {
					$ii = $tmp;
				}
			}
		}
		return $ii["ql"] == 9999 ? false : $ii;
	}
	
	public function interpolateAllReqSets($reqsets, $sIdx, $sValue) {
		$lowId = -1;
		foreach($reqsets as $req) {
			if($req->reqs[$sIdx] > $sValue) {
				break;
			}
			$lowId++;
		}
		if($lowId<0) {
			return false;
		}
		elseif($lowId == count($reqsets)-1) {
			return Array(	"ql" => $reqsets[$lowId]->ql,
					"itemref" => $reqsets[$lowId]->item_ref.'/'.$reqsets[$lowId]->item_ref);
		}
		else {
			return $this->interpolateFromReqSets($reqsets[$lowId], $reqsets[$lowId+1], $sIdx, $sValue);
		}
	}

	/**
	 * Interpolate the QL by given requirement sets.
	 *
	 * @param DBRow $low - lower requirement set
	 * @param DBRow $high - higher requirement set
	 * @param int $sIdx - skill representing index of req. set -> reqs[$sIdx]
	 * @param int $sValue - the skill value to calculate the interpolated QL
	 * @return int - interpolated QL, if $sValue is even lower than $low->reqs[$sIdx] then false
	 */
	public function interpolateFromReqSets($low, $high, $sIdx, $sValue) {
		return $low->reqs[$sIdx] > $sValue ? false : 
			Array(	"ql" => $this->interpolateSkill($low->ql, $low->reqs[$sIdx], $high->ql, $high->reqs[$sIdx], $sValue),
				"itemref" => $low->item_ref.'/'.$high->item_ref);
	}
	/**
	 * Interpolate the QL by given skill
	 *
	 * @param int $lowQL - low ql
	 * @param int $lowSkill - skill required by low ql
	 * @param int $highQL - high ql
	 * @param int $highSkill - skill required by high ql
	 * @param int $skill - the given skill
	 * @return int - the interpolated QL
	 */
	public function interpolateSkill($lowQL, $lowSkill, $highQL, $highSkill, $skill) {
		return round($lowQL+(($highQL-$lowQL)/($highSkill-$lowSkill))*($skill-$lowSkill));
	} 

	/**
	 * Swaps index and keys of an array.
	 *
	 * @param array $array - the array
	 * @return array - array with keys as values and values as keys
	 */
	public function swapArray($array) {
		$tmp = Array();
		foreach($array as $key => $value) {
			$tmp[$value] = $key;
		}
		return $tmp;
	}
}
