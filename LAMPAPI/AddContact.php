<?php
	// Will be expecting the following fields: 
	// "firstName" : "string",
	// "lastName" : "string",
	// "phoneNumber" : "string",
	// "emailAddress" : "string",
	// "userID" : int

	$inData = getRequestInfo();
	
	$firstName = $inData["firstName"];
  	$lastName = $inData["lastName"];
	$phoneNumber = $inData["phoneNumber"];
  	$emailAddress = $inData["emailAddress"];
  	$userID = $inData["userID"];


	$conn = new mysqli("localhost", "Manager", "COP4331", "ContactManager"); 	
	if ($conn->connect_error)
	{
			returnWithError( $conn->connect_error );
	}
	else
	{
			$stmt = $conn->prepare("INSERT into Contacts (FirstName,LastName,PhoneNumber,EmailAddress, UserID) VALUES(?,?,?,?,?)");
			$stmt->bind_param("ssssi", $firstName, $lastName, $phoneNumber, $emailAddress, $userID);
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