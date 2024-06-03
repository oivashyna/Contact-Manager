<?php
	// Will be expecting the following fields: 
	// "firstName" : "string",
	// "lastName" : "string",
	// "userID" : int

	$inData = getRequestInfo();

    $firstName = $inData["firstName"];
  	$lastName = $inData["lastName"];
  	$userID = $inData["userID"];

	$conn = new mysqli("localhost", "Manager", "COP4331", "ContactManager"); 	
    if($conn->connect_error)
    {
        returnWithError( $conn->connect_error );
    }
    else
    {
        $stmt = $conn->prepare("DELETE FROM Contacts WHERE FirstName = ? AND LastName = ? AND UserID = ?");
        $stmt->bind_param("ssi", $firstName, $lastName, $userID);
  	    $stmt->execute();
  	    $stmt->close();
  	    $conn->close();
  	    returnWithError("None", $firstName, $lastName);
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

	function returnWithError( $err, $firstName, $lastName )
	{
		$retValue = '{"error":"' . $err . '", "nameDeleted":"' . $firstName . " " . $lastName . '"}';
		sendResultInfoAsJson( $retValue );
	}

?>