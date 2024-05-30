<?php
$inData = getRequestInfo();

$servername = "localhost"; 
$serverUser = "TheBeast"; 
$serverPass = "WeLoveCOP4331"; 
$dbname = "ContactManager";

$phoneNumber = $inData["phoneNumber"];
$emailAddress = $inData["emailAddress"];
$newFirstName = $inData["newFirstName"];
$newLastName = $inData["newLastName"];
$userID = $inData["userID"];

$conn = new mysqli($servername, $serverUser, $serverPass, $dbname);

if ($conn->connect_error) {
    returnWithError("Connection failed: " . $conn->connect_error);
} else {
    $stmt = $conn->prepare("INSERT INTO Contacts (newFirstName, newLastName, phoneNumber, emailAddress, UserID) VALUES(?,?,?,?,?)");
    if (!$stmt) {
        returnWithError("Prepare failed: " . $conn->error);
    } else {
        $stmt->bind_param("ssssi", $newFirstName, $newLastName, $phoneNumber, $emailAddress, $userID);
        if (!$stmt->execute()) {
            returnWithError("Execute failed: " . $stmt->error);
        } else {
            returnWithError("");
        }
        $stmt->close();
    }
    $conn->close();
}

function getRequestInfo() {
    return json_decode(file_get_contents('php://input'), true);
}

function sendResultInfoAsJson($obj) {
    header('Content-type: application/json');
    echo $obj;
}

function returnWithError($err) {
    $retValue = '{"error":"' . $err . '"}';
    sendResultInfoAsJson($retValue);
}
?>
