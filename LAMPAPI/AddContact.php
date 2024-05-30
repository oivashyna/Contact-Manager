<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$inData = getRequestInfo();

$servername = "localhost"; 
$serverUser = "TheBeast"; 
$serverPass = "WeLoveCOP4331"; 
$dbname = "ContactManager";

// Map incoming JSON data to PHP variables
$newFirstName = $inData["newFirstName"];
$newLastName = $inData["newLastName"];
$phoneNumber = $inData["phoneNumber"];
$emailAddress = $inData["emailAddress"];
$userID = $inData["userID"];

$conn = new mysqli($servername, $serverUser, $serverPass, $dbname);

if ($conn->connect_error) 
{
    returnWithError("Connection failed: " . $conn->connect_error);
} 
else 
{
    // SQL Statement with accurate database column names
    $stmt = $conn->prepare("INSERT INTO Contacts (FirstName, LastName, Phone, Email, UserID) VALUES (?, ?, ?, ?, ?)");
    if ($stmt)
    {
        // Bind PHP variables to SQL statement
        $stmt->bind_param("ssssi", $newFirstName, $newLastName, $phoneNumber, $emailAddress, $userID);
        if ($stmt->execute())
        {
            returnWithMessage("Contact added successfully");
        }
        else
        {
            returnWithError("Execute failed: " . $stmt->error);
        }
        $stmt->close();
    }
    else
    {
        returnWithError("Prepare failed: " . $conn->error);
    }
    $conn->close();
}

function getRequestInfo()
{
    return json_decode(file_get_contents('php://input'), true);
}

function sendResultInfoAsJson($obj)
{
    header('Content-type: application/json');
    echo json_encode($obj);
}

function returnWithError($err)
{
    $retValue = ["error" => $err];
    error_log(json_encode($retValue)); // Log the error
    sendResultInfoAsJson($retValue);
}

function returnWithMessage($msg)
{
    $retValue = ["message" => $msg];
    error_log(json_encode($retValue)); // Log the message
    sendResultInfoAsJson($retValue);
}
?>
