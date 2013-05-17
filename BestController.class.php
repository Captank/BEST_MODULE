<?php

namespace Budabot\User\Modules;

/**
 * Authors: 
 *  - comes later
 *
 * @Instance
 *
 * @DefineCommand(
 *	command     = 'best',
 *	accessLevel = 'all',
 *	description = 'Finds the highest ql you can wear',
 *	help        = 'best.txt'
 * )
 * @DefineCommand(
 *	command     = 'bestgroup',
 *	accessLevel = 'all',
 *	description = 'Finds the highest ql you can wear',
 *	help        = 'best.txt'
 * )
 *
 */
class BestController {

	public $moduleName;
	
	/** @Inject */
	public $db;
	
	/** @Inject */
	public $settingManager;
	
	/** @Inject */
	public $text;
		
	/**
	 * @Setting("show_no_skills")
	 * @Description("List gear with no matching skills")
	 * @Visibility("edit")
	 * @Type("options")
	 * @Options("true;false")
	 * @Intoptions("1;0")
	 * @AccessLevel("mod")
	 */
	public $showNoSkills = "1";	
	
	/**
	 * @Setup
	 */
	public function setup() {
		$this->db->loadSQLFile($this->moduleName, "best");
	}

	/**
	 * Handler to get list of available skills/gear.
	 *
	 * @HandlesCommand("best")
	 * @Matches("/^best (skills|gear)$/i")
	 */
	public function listCommand($message, $channel, $sender, $sendto, $args) {
		$groups = Array();
		$args[1] = strtolower($args[1]);
		if($args[1]=="gear") {
			$gtoken = "";
			$itoken = "<br>";
			$data = $this->getItemList();
			foreach($data as $d) {
				$tmp = "<tab><highlight>".strtoupper($d->name)."<end>: ".implode(", ", $d->skills);
				if(isset($groups[$d->group])) {
					$groups[$d->group][] = $tmp;
				}
				else {
					$groups[$d->group] = Array($tmp);
				}
			}
		}
		else {
			$gtoken = "<tab>";
			$itoken = ", ";
			$data = $this->getSkillList();
			foreach($data as $d) {
				$tmp = ucfirst($d->name);
				if(isset($groups[$d->group])) {
					$groups[$d->group][] = $tmp;
				}
				else {
					$groups[$d->group] = Array($tmp);
				}
			}
		}
		$msg = Array();
		foreach($groups as $name => $group) {
			$msg[] = $gtoken."[<header2>".ucfirst($name)."<end>]<br>".implode($itoken, $group);
		}
		$sendto->reply($this->text->make_blob(ucfirst($args[1])." (".count($data).")", implode("<br><br>", $msg)));
	}
	/**
	 * Handler to calculate gear QLs
	 *
	 * @HandlesCommand("best")
	 * @Matches("/^best (.+?) (\d+ [a-z12]+.*)$/i")
	 * @Matches("/^best '([^']+)' (\d+ [a-z12]+.*)$/i")
	 * @Matches('/^best "([^']+)" (\d+ [a-z12]+.*)$/i')
	 */
	public function bestCommand($message, $channel, $sender, $sendto, $args) {
		$name = $args[1];
		$params = null;
		if(!$this->parseSkills($args[2], $params)) {
			if($params) {
				$msg = "Error! ".$params;
			}
			else {
				return false;
			}
		}
		else {
			$items = $this->getItems($name);
			if(!count($items)) {
				$items = $this->getItems($name, true);
			}
			$c = count($items);
			if($c == 0) {
				$msg = "Error! Gear <highlight>$name<end> not available.";
			}
			else {
				$results = $this->interpolate($params, $items);
				$count = 0;
				$msg = $this->formatResults($results, $count);
				if($count == 1) {
					$msg = str_replace("<br>"," ", $msg);
					$msg = str_replace("<tab>"," ", $msg);
					$msg = preg_replace('~^\s+~', '', $msg);
					$msg = preg_replace('~\s+~', ' ', $msg);
				}
				else {
					$msg = $this->text->make_blob("Best ($count)", $msg);
				}
			}
		}
		$sendto->reply($msg);
	}         
	
	/**
	 * Handler to calculate gear QLs
	 *
	 * @HandlesCommand("bestgroup")
	 * @Matches("/^bestgroup (.+?) (\d+ [a-z12]+.*)$/i")
	 * @Matches("/^bestgroup '([^']+)' (\d+ [a-z12]+.*)$/i")
	 * @Matches('/^bestgroup "([^']+)" (\d+ [a-z12]+.*)$/i')
	 */
	public function bestGroupCommand($message, $channel, $sender, $sendto, $args) {
		$name = $args[1];
		$params = null;
		if(!$this->parseSkills($args[2], $params)) {
			if($params) {
				$msg = "Error! ".$params;
			}
			else {
				return false;
			}
		}
		else {
			$items = $this->getItemsByGroup($name);
			if(!count($items)) {
				$items = $this->getItemsByGroup($name, true);
			}
			$c = count($items);
			if($c == 0) {
				$msg = "Error! Gear <highlight>$name<end> not available.";
			}
			else {
				$results = $this->interpolate($params, $items);
				$count = 0;
				$msg = $this->formatResults($results, $count);
				if($count == 1) {
					$msg = str_replace("<br>"," ", $msg);
					$msg = str_replace("<tab>"," ", $msg);
					$msg = preg_replace('~^\s+~', '', $msg);
					$msg = preg_replace('~\s+~', ' ', $msg);
				}
				else {
					$msg = $this->text->make_blob("Best ($count)", $msg);
				}
			}
		}
		$sendto->reply($msg);
	}
	
	/**
	 * Get items with a specific name.
	 *
	 * @params string $name - name of item (or sql pattern)
	 * @params boolean $like - default false, defines if its searched by LIKE '%$name%' instead of = '$name'
	 * @return array - all found items
	 */
	public function getItems($name, $like = false) {
		$name = strtolower($name);
		if($like){
			$name = "%$name%";
			$sql = <<<EOD
SELECT
	`id`,`name`,`reqs`, `group`, `qllimits`
FROM
	`best_items`
WHERE
	`name` LIKE ?
ORDER BY
	`group` ASC, `name` ASC
EOD;
		}
		else {
			$sql = <<<EOD
SELECT
	`id`,`name`,`reqs`, `group`, `qllimits`
FROM
	`best_items`
WHERE
	`name` = ?
ORDER BY
	`group` ASC, `name` ASC
EOD;
		}
		$results = $this->db->query($sql, $name);
		foreach($results as &$result) {
			$result->reqs = $this->swapArray(explode(";", $result->reqs));
			if($result->qllimits) {
				$result->qllimits = explode(";", $result->qllimits);
			}
		}
		return $results;
	}
	
	/**
	 * Get items by group name.
	 *
	 * @params string $group - name of item group
	 * @params boolean $like - default false, defines if its searched by LIKE '%$group%' instead of = 'group'
	 * @return array - all found items
	 */
	public function getItemsByGroup($group, $like = false) {
		$group = strtolower($group);
		if($like){
			$group = "%$group%";
			$sql = <<<EOD
SELECT
	`id`,`name`,`reqs`, `group`, `qllimits`
FROM
	`best_items`
WHERE
	`group` LIKE ?
ORDER BY
	`group` ASC, `name` ASC
EOD;
		}
		else {
			$sql = <<<EOD
SELECT
	`id`,`name`,`reqs`, `group`, `qllimits`
FROM
	`best_items`
WHERE
	`group` = ?
ORDER BY
	`group` ASC, `name` ASC
EOD;
		}
		$results = $this->db->query($sql, $group);
		foreach($results as &$result) {
			$result->reqs = $this->swapArray(explode(";", $result->reqs));
			if($result->qllimits) {
				$result->qllimits = explode(";", $result->qllimits);
			}
		}
		return $results;
	}
	
	/**
	 * Get item requirement sets.
	 *
	 * @param int $id - item id
	 * @return array - requirement sets.
	 */
	public function getItemRequirements($id) {
		$sql = <<<EOD
SELECT
	`ql`, `ref_low`, `ref_high`, `reqs`
FROM
	`best_requirements`
WHERE
	`item_id` = ?
ORDER BY
	`ql` ASC
EOD;
		$results = $this->db->query($sql, $id);
		foreach($results as &$result) {
			$result->reqs = explode(";", $result->reqs);
		}
		return $results;
	}
	
	/**
	 * Get the full name of the skill pattern.
	 *
	 * @param string $name skill pattern
	 * @return string, full name of skill, false if invalid pattern
	 */
	public function getSkill($name) {
		$sql = <<<EOD
SELECT
	`name`
FROM
	`best_skills`
WHERE
	`name` LIKE ?
EOD;
		$name = strtolower($name);
		$skills = $this->db->query($sql, $name.'%');
		$c = count($skills);
		if($c == 0) {
			return false;
		}
		elseif($c == 1) {
			return $skills[0]->name;
		}
		else {
			foreach($skills as $skill) {
				if($skill->name == $name) {
					return $name;
				}
			}
		}
		return false;
	}
	
	/**
	 * Interpolate all items.
	 *
	 * @param array $skills - the skills array
	 * @param array $items - all items
	 * @return array - interpolation results
	 */
	public function interpolate($skills, $items) {
		foreach($items as &$item) {
			$item->interpolation = $this->interpolateItem($skills, $item);
		}
		return $items;
	}
	
	/**
	 * Get interpolated QL for an item by given skills.
	 *
	 * @param array $skills - the skills array
	 * @param DBRow $item - the item
	 * @return int interpolated QL and item reference, null if skills are too low, false if skills match.
	 */
	public function interpolateItem($skills, $item) {
		$reqsets = $this->getItemRequirements($item->id);
		$ii = Array("ql" => 9999);
		$skillMatched = false;
		foreach($skills as $skill => $value) {
			if(isset($item->reqs[$skill])) {
				$skillMatched = true;
				$tmp = $this->interpolateAllReqSets($reqsets, $item->reqs[$skill], $value);
				if($tmp && $tmp["ql"] < $ii["ql"]) {
					$ii = $tmp;
				}
			}
		}
		if($ii["ql"] == 9999) {
			return $skillMatched ? null : false;
		}
		elseif($item->qllimits) {
			if($item->qllimits[0] > $ii["ql"]) {
				return null;
			}
			for($i = count($item->qllimits)-1; $i >= 0 && $ii["ql"] < $item->qllimits[$i]; $i--);
			$ii["ql"] = $item->qllimits[$i];
		}
		return $ii;
	}
	
	/**
	 * Calculates the interpolated QL for all given requirement sets.
	 *
	 * @param array $reqsets - all requirement sets, must by ordered by QL asc
	 * @param int $sIdx - index for correct skill
	 * @param int $sValue - skill value for interpolation
	 * @return array - interpolated QL and item reference, false if interpolation is invalid
	 */
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
					"ref_low" => $reqsets[$lowId]->ref_low, "ref_high" => $reqsets[$lowId]->ref_high);
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
	 * @return array - interpolated QL and item reference, if $sValue is even lower than $low->reqs[$sIdx] then false
	 */
	public function interpolateFromReqSets($low, $high, $sIdx, $sValue) {
		return $low->reqs[$sIdx] > $sValue ? false : 
			Array(	"ql" => $this->interpolateSkill($low->ql, $low->reqs[$sIdx], $high->ql, $high->reqs[$sIdx], $sValue),
				"ref_low" => $low->ref_low, "ref_high" => $high->ref_high);
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
		return floor($lowQL+(($highQL-$lowQL)/($highSkill-$lowSkill))*($skill-$lowSkill));
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
	/**
	 * Get gear list
	 *
	 * @return array - gear list
	 */
	public function getItemList() {
		$sql = <<<EOD
SELECT
	`name`, `reqs`, `group`
FROM
	`best_items`
ORDER BY
	`group` ASC, `name` ASC;
EOD;
		$results = $this->db->query($sql);
		foreach($results as &$result) {
			$result->skills = explode(";", $result->reqs);
			unset($result->reqs);
		}
		return $results;
	}

	/**
	 * Get skill list
	 *
	 * @return array - skill list
	 */
	public function getSkillList() {
		$sql = <<<EOD
SELECT
	`name`, `group`
FROM
	`best_skills`
ORDER BY
	`group` ASC, `name` ASC;
EOD;
		return $this->db->query($sql);
	}
	
	/**
	 * Parses skills.
	 *
	 * @param string $args - skill list argument
	 * @param mixed &$out - either the argument list or an error message, false if syntax error
	 * @return boolean - true if argument list is valid
	 */
	public function parseSkills($args, &$out) {
		$args = preg_split("~[^a-z0-9]+~i",$args,-1,PREG_SPLIT_NO_EMPTY);
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
				$out = false;
				return false;
			}
		}
		$c = count($n);
		if($c != count($v)) {
			$out = false;
			return false;
		}
		$out = Array();
	 	$msg = Array();
 		for($i = 0; $i < $c; $i++) {
			if($skill = $this->getSkill($n[$i])) {
				$out[$skill] = $v[$i];
			}
			else {
				$msg[] = $n[$i];
			}
		}
		if(count($msg) > 0) {
			$out = "Invalid skills: ".implode(", ", $msg);
			return false;
		}
		return true;
	}
  	
	/**
	 * Formats interpolation results.
	 *
	 * @param array $items - interpolation results
	 * @return string - formatted output.
	 */
	public function formatResults($items, &$count) {
		$sorted = Array("ok" => Array(), "tolow" => Array(), "noskills" => Array());
		$c = Array("ok" => 0, "tolow" => 0, "noskills" => 0);
		foreach($items as $item) {
			if($item->interpolation) {
			$tmp = sprintf("<br><tab><highlight>%s<end>: %s",
					strtoupper($item->name), $this->text->make_item($item->interpolation["ref_low"], $item->interpolation["ref_high"], $item->interpolation["ql"], "QL".$item->interpolation["ql"]));
				$c["ok"]++;
				if(isset($sorted["ok"][$item->group])) {
					$sorted["ok"][$item->group][] = $tmp;
				}
				else {
					$sorted["ok"][$item->group] = Array($tmp);
				}
			}
			else {
				$key = $item->interpolation === null ? "tolow" : "noskills";
				$c[$key]++;
				$sorted[$key][] = strtoupper($item->name);
			}
		}
		$msg = Array();
		foreach($sorted["ok"] as $name => $group) {
			$msg[] = "[<header2>".ucfirst($name)."<end>]".implode("", $group);
		}
		if(count($sorted["tolow"])) {
			$msg[] = "<tab><header2>You can't even equipp lowest QL<end>:<br>".implode(",<tab>", $sorted["tolow"]);
		}
		if(($this->settingManager->get("show_no_skills") || !count($msg)) && count($sorted["noskills"])) {
			$msg[] = "<tab><header2>Given skills don't match requirements<end>:<br>".implode(",<tab>", $sorted["noskills"]);
		}
		$count = $c["ok"]+$c["tolow"];
		if($this->settingManager->get("show_no_skills") || !$count) {
			$count += $c["noskills"];
		}
		return implode("<br><br>", $msg);
	}
}
