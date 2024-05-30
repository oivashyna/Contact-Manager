<?php
$inData = getRequestInfo();

$servername = "localhost"; 
$serverUser = "TheBeast"; 
$serverPass = "WeLoveCOP4331"; 
$dbname = "ContactManager";

$phoneNumber = $inData["phoneNumber"];
$emailAddress = $inData["emailAddress"];
$newFirstName = $inData["newFirstName"];
$newLastName = $inData["newLastName"];
$userID = $inData["userID"];

$conn = new mysqli($servername, $serverUser, $serverPass, $dbname);

if ($conn->connect_error)
	{
			returnWithError( $conn->connect_error );
	}
	else
	{
			$stmt = $conn->prepare("INSERT into Contacts (newFirstName,newLastName,newPhoneNumber,EmailAddress, UserID) VALUES(?,?,?,?,?)");
			$stmt->bind_param("ssssi", $newFirstName, $newLastName, $phoneNumber, $emailAddress, $userID);
			$stmt->execute();
			$stmt->close();
			$conn->close();
			returnWithError("");
		}

	function getRequestInfo()
	{
		return json_decode(file_get_contents('php://input'), true);
	}

	function sendResultInfoAsJson( $obj )
	{
		header('Content-type: application/json');
		echo $obj;
	}

	function returnWithError( $err )
	{
		$retValue = '{"error":"' . $err . '"}';
		sendResultInfoAsJson( $retValue );
	}

?>
