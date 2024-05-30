<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
$inData = getRequestInfo();

$servername = "localhost"; 
$serverUser = "TheBeast"; 
$serverPass = "WeLoveCOP4331"; 
$dbname = "ContactManager";

$ID = $inData["ID"];
$userID = $inData["userID"];

$conn = new mysqli($servername, $serverUser, $serverPass, $dbname);

if ($conn->connect_error) 
{
    returnWithError($conn->connect_error);
} 
else 
{
    $stmt = $conn->prepare("DELETE FROM Contacts WHERE ID = ? AND UserID = ?");
    if ($stmt)
    {
        $stmt->bind_param("ii", $ID, $userID);
        if ($stmt->execute())
        {
            if ($stmt->affected_rows > 0)
            {
                returnWithMessage("Contact deleted successfully");
            }
            else
            {
                returnWithError("No contact found with the given ID and userID");
            }
        }
        else
        {
            returnWithError($stmt->error);
        }
        $stmt->close();
    }
    else
    {
        returnWithError($conn->error);
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
    echo $obj;
}

function returnWithError($err)
{
    $retValue = ["error" => $err];
    sendResultInfoAsJson($retValue);
}

function returnWithMessage($msg)
{
    $retValue = ["message" => $msg];
    sendResultInfoAsJson($retValue);
}
?>
