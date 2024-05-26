<?php
	$inData = getRequestInfo();

    $servername = "localhost"; 
    $serverUser = "TheBeast"; 
    $serverPass = "WeLoveCOP4331"; 
    $dbname = "ContactManager";
	
	$contact = $inData["contact"];
	$userId = $inData["userId"];

	$phoneNumber = $inData["phoneNumber"];
	$emailAddress = $inData["emailAddress"];
	$newFirst = $inData["newFirstName"];
	$newLast = $inData["newLastName"];
	$userId = $inData["userId"];

    $conn = new mysqli($servername, $serverUser, $serverPass, $dbname);
	if ($conn->connect_error) 
	{
		returnWithError( $conn->connect_error );
	} 
	else
	{
		$stmt = $conn->prepare("INSERT INTO Contacts (FirstName, LastName, Phone, Email, UserID) VALUES(?,?,?,?,?)");
		$stmt->bind_param("sssss", $newFirst, $newLast, $phoneNumber, $emailAddress, $userId);
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
