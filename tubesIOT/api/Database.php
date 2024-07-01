<?php 
class Database{

	public $conn;

	function __construct($host, $username, $pass, $dbname){
		$this->conn = mysqli_connect($host, $username, $pass, $dbname);
	}

	function getAllMoistures(){
		$sql = "SELECT * FROM moisture_sensor";
		$query = mysqli_query($this->conn, $sql);
		echo json_encode(mysqli_fetch_all($query, MYSQLI_ASSOC));
	}

	function getRealTime(){
		$sql = "SELECT * FROM realtime";
		$query = mysqli_query($this->conn, $sql);
		echo json_encode(mysqli_fetch_all($query, MYSQLI_ASSOC));
	}

	function inputRealTimeData($moisture, $humidity, $temperature){
		date_default_timezone_set("Asia/Jakarta");
		$waktu = date("Y/m/d H:i:s");
		$sql = "UPDATE realtime
		SET moisture = '$moisture',
		humidity = '$humidity',
		temperature = '$temperature',
		waktu = '$waktu'
		WHERE id = 1";
		mysqli_query($this->conn, $sql);
	}

	function inputPeriodikData($moisture, $humidity, $temperature){
		date_default_timezone_set("Asia/Jakarta");
		$waktu = date("Y/m/d H:i:s");
		if($moisture >= 30){
			$pump_status = "ON";
		}else{
			$pump_status = "OFF";
		}
		$sql = "INSERT INTO moisture_sensor (moisture, humidity, temperature, pump_status, waktu)
		VALUES('$moisture', '$humidity', '$temperature', '$pump_status', '$waktu')";
		mysqli_query($this->conn, $sql);
	}
}

 ?>