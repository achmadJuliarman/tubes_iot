<?php 

include_once "Database.php";

$db = new Database("localhost", "root", "", "tubes_iot");
$url = explode("/", $_GET["url"]);


if(strtolower($url[0]) == "realtime"){

	$db->getRealTime();

}else if(strtolower($url[0]) == "getall"){

	echo 'string';

}else if(strtolower($url[0]) == "post"){

	$data = json_decode(file_get_contents('php://input'), true);
	$mois = $data["moisture"];
	$db->inputRealTimeMoisture($mois);
	$db->inputPeriodikMoisture($mois);
	echo 'Data Yang anda posting';
	var_dump($data);

}

