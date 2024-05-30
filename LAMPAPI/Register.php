<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$inData = getRequestInfo();
logData("Received input data: " . json_encode($inData));

$servername = "localhost"; 
$serverUser = "TheBeast"; 
$serverPass = "WeLoveCOP4331"; 
$dbname = "ContactManager";

$firstName = $inData["firstName"];
$lastName = $inData["lastName"];
$login = $inData["login"];
$password = $inData["password"];
logData("Parsed firstName: $firstName, lastName: $lastName, login: $login, password: $password");

$conn = new mysqli($servername, $serverUser, $serverPass, $dbname);

if ($conn->connect_error) 
{
    returnWithError("Connection failed: " . $conn->connect_error);
} 
else 
{
    $stmt = $conn->prepare("INSERT INTO Users (FirstName, LastName, Login, Password) VALUES (?, ?, ?, ?)");
    if (!$stmt) {
        returnWithError("Prepare failed: " . $conn->error);
    } else {
        $stmt->bind_param("ssss", $firstName, $lastName, $login, $password);
        if ($stmt->execute())
        {
            logData("User registered successfully");
            returnWithMessage("User registered successfully");
        }
        else
        {
            returnWithError("Execute failed: " . $stmt->error);
        }
        $stmt->close();
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
    logData("Sending response: " . json_encode($obj));
}

function returnWithError($err)
{
    logData("Error: " . $err);
    $retValue = ["error" => $err];
    sendResultInfoAsJson($retValue);
}

function returnWithMessage($msg)
{
    $retValue = ["message" => $msg];
    sendResultInfoAsJson($retValue);
}

function logData($data) {
    error_log($data);
}
?>

