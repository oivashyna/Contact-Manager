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

$login = $inData["login"];
$password = $inData["password"];
logData("Parsed login: $login, password: $password");

$conn = new mysqli($servername, $serverUser, $serverPass, $dbname);

if ($conn->connect_error) 
{
    returnWithError("Connection failed: " . $conn->connect_error);
} 
else 
{
    $stmt = $conn->prepare("SELECT ID, FirstName, LastName FROM Users WHERE Login=? AND Password=?");
    if (!$stmt) {
        returnWithError("Prepare failed: " . $conn->error);
    } else {
        $stmt->bind_param("ss", $login, $password);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($row = $result->fetch_assoc())
        {
            logData("Found user: " . json_encode($row));
            returnWithInfo($row['FirstName'], $row['LastName'], $row['ID']);
        }
        else
        {
            returnWithError("No Records Found");
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
    $retValue = ["id" => 0, "firstName" => "", "lastName" => "", "error" => $err];
    sendResultInfoAsJson($retValue);
}

function returnWithInfo($firstName, $lastName, $id)
{
    $retValue = ["id" => $id, "firstName" => $firstName, "lastName" => $lastName, "error" => ""];
    sendResultInfoAsJson($retValue);
}

function logData($data) {
    error_log($data);
}
?>

