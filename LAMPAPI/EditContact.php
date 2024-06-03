<?php
	// Will be expecting the following fields: 
	// "firstName" : "string",
	// "lastName" : "string",
	// "phoneNumber" : "string",
	// "emailAddress" : "string",
	// "ID" : int

	$inData = getRequestInfo();

	$firstName = $inData["firstName"];
	$lastName = $inData["lastName"];
	$phoneNumber = $inData["phoneNumber"];
	$emailAddress = $inData["emailAddress"];
	$ID = $inData["ID"];


	$conn = new mysqli("localhost", "Manager", "COP4331", "ContactManager");
		if ($conn->connect_error)
		{
			returnWithError( $conn->connect_error );
		}
		else
		{
			$stmt = $conn->prepare("UPDATE Contacts SET FirstName = ?, LastName=?, PhoneNumber= ?, EmailAddress= ? WHERE ID= ?");
			$stmt->bind_param("ssssi", $firstName, $lastName, $phoneNumber, $emailAddress, $ID);
			$stmt->execute();

			$stmt->close();
			$conn->close();
			returnWithError("None");
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
		$retValue = '{"id":0,"firstName":"","lastName":"","error":"' . $err . '"}';
		sendResultInfoAsJson( $retValue );
	}


?>