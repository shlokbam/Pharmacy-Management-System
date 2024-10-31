<?php
$apiKey = "fb0a5fe36fmshe73347564896d4dp189934jsn2867e42dd8d5";
$apiHost = "your-api-host.com"; // Replace with your API host
$url = "https://your-api-endpoint.com/medicines"; // Replace with your API endpoint

$headers = [
    "x-rapidapi-key: $apiKey",
    "x-rapidapi-host: $apiHost",
];

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$response = curl_exec($ch);
curl_close($ch);

$data = json_decode($response, true);

if (!empty($data)) {
    foreach ($data as $medicine) {
        echo $medicine['name'] . " - " . $medicine['quantity'] . "<br>";
    }
} else {
    echo "No medicines found.";
}
?>
