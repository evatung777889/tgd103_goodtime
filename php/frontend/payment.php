<?php

require '../vendor/autoload.php';

// This is your test secret API key.
\Stripe\Stripe::setApiKey('sk_test_51HvfSXFV0g6r9YWuXcmGc1Q86lvpbpClUHPOkB8OovezzPJvxQFBzf4gmkNWu6RDoj92lkdjS9DZFSC3MGR1vm8e00yFf7kEUf');

function calculateOrderAmount(array $items): int {
    // Replace this constant with a calculation of the order's amount
    // Calculate the order total on the server to prevent
    // people from directly manipulating the amount on the client
    return 300;
}
if(!isset($_SESSION)){
    session_start();
}
header('Content-Type: application/json');
try {
    // retrieve JSON from POST body
    $jsonStr = file_get_contents('php://input');
    $jsonObj = json_decode($jsonStr);
    
    $amt = $_SESSION["amt"] * 100;
    // print_r($amt);
    // Create a PaymentIntent with amount and currency
    $paymentIntent = \Stripe\PaymentIntent::create([
        //家總要刷的金額
        'amount' => $amt,
        //幣別
        'currency' => 'twd',
        'automatic_payment_methods' => [
            'enabled' => true,
        ],
    ]);


    echo json_encode(array('client_secret' => $paymentIntent->client_secret));


} catch (Error $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}