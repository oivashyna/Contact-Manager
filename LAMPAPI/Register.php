<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
    $inData = getRequestInfo();

    $servername = "localhost"; 
    $serverUser = "TheBeast"; 
    $serverPass = "WeLoveCOP4331"; 
    $dbname = "ContactManager";
    
    $firstName = $inData["firstName"];
    $lastName = $inData["lastName"];
    $login = $inData["login"];
    $password = $inData["password"]; // Assuming password is already hashed

    $conn = new mysqli($servername, $serverUser, $serverPass, $dbname);
    if ($conn->connect_error) 
    {
        returnWithError($conn->connect_error);
    } 
    else
    {
        $stmt = $conn->prepare("INSERT INTO Users (FirstName,LastName,Login,Password) VALUES(?,?,?,?)");
        $stmt->bind_param("ssss", $firstName, $lastName, $login, $password);
        $stmt->execute();
        $stmt->close();
        $conn->close();
        returnWithError("");
    }

    function getRequestInfo()
    {
        return json_decode(file_get_contents('php://input'), true);
    }

    function sendResultInfoAsJson($obj)
    {
        header('Content-type: application/json');
        echo $obj;
    }

    function returnWithError($err)
    {
        $retValue = '{"error":"' . $err . '"}';
        sendResultInfoAsJson($retValue);
    }
?>
