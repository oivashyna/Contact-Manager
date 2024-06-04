<?php
	// Will be expecting the following fields: 
	// "ID" : int

	$inData = getRequestInfo();

	$ID = $inData["ID"];

	$conn = new mysqli("localhost", "Manager", "COP4331", "ContactManager"); 	
    if($conn->connect_error)
    {
        returnWithError( $conn->connect_error );
    }
    else
    {
        $stmt = $conn->prepare("DELETE FROM Contacts WHERE ID = ?");
        $stmt->bind_param("i", $ID);
  	    $stmt->execute();
  	    returnWithError("No errors", $ID);
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

	function returnWithError( $err, $ID )
	{
		$retValue = '{"error":"' . $err . '", "deletedID":"' . $ID . '"}';
		sendResultInfoAsJson( $retValue );
	}

?>