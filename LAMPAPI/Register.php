<?php
	// Will be expecting the following fields: 
    // "firstName" : "string",
    // "lastName" : "string",
	// "login" : "string",
	// "password" : "string"

	$inData = getRequestInfo();
	
	$firstName = $inData["firstName"];
  	$lastName = $inData["lastName"];
  	$login = $inData["login"];
  	$password = $inData["password"];

	$conn = new mysqli("localhost", "Manager", "COP4331", "ContactManager"); 	
	if( $conn->connect_error )
	{
		returnWithError( $conn->connect_error );
	}
	else
	{
		$stmt = $conn->prepare("SELECT * FROM Users WHERE Login=?");
		$stmt->bind_param("s", $login);
		$stmt->execute();
		$result = $stmt->get_result();
		$rows = mysqli_num_rows($result);
		if ($rows == 0)
		{
			$stmt = $conn->prepare("INSERT into Users (FirstName, LastName, Login, Password) VALUES(?,?,?,?)");
			$stmt->bind_param("ssss", $firstName, $lastName, $login, $password);
			$stmt->execute();
			$id = $conn->insert_id;
			$stmt->close();
			$conn->close();
			http_response_code(200);
			$searchResults .= '{'.'"id": "'.$id.''.'"}';

			returnWithInfo($searchResults);
		} 
        else 
        {
			http_response_code(409);
			returnWithError("Username taken");
		}
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
	function returnWithInfo( $searchResults )
	{
		$retValue = '{"results":[' . $searchResults . '],"error":""}';
		sendResultInfoAsJson( $retValue );
	}
	
?>