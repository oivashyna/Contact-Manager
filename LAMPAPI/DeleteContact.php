<?php
    $inData = getRequestInfo();

    $servername = "localhost"; 
    $username = "username"; // TODO Needs to be changed
    $password = "password"; // TODO Needs to be changed
    $dbname = "ContactManager";

    $userId = $inData["userId"];
    $firstName = $inData["firstName"];
    $lastName = $inData["lastName"];

    $conn = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error) 
	{
		returnWithError( $conn->connect_error );
	} 
	else 
    {
        $stmt = $conn->prepare("DELETE FROM Contacts (FirstName, LastName, UserID) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $firstName, $lastName, $userId);
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
		$retValue = '{"error":"' . $err . '"}';
		sendResultInfoAsJson( $retValue );
	}

?>