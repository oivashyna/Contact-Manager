<?php
	$inData = getRequestInfo();

    $servername = "localhost"; 
    $username = "username"; // TODO Needs to be changed
    $password = "password"; // TODO Needs to be changed
    $dbname = "ContactManager";

	$phoneNumber = $inData["phoneNumber"];
	$emailAddress = $inData["emailAddress"];
	$newFirst = $inData["newFirstName"];
	$newLast = $inData["newLastName"];
	$id = $inData["id"];


    $conn = new mysqli($servername, $username, $password, $dbname);
		if ($conn->connect_error)
		{
			returnWithError( $conn->connect_error );
		}
		else
		{
			$stmt = $conn->prepare("UPDATE Contacts SET FirstName = ?, LastName=?, PhoneNumber= ?, EmailAddress= ? WHERE ID= ?");
			$stmt->bind_param("sssss", $newFirst, $newLast, $phoneNumber, $emailAddress, $id);
			$stmt->execute();
			$stmt->close();
			$conn->close();
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