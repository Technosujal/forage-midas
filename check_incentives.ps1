$transactions = @(
    "9, 10, 16",
    "4, 2, 166.75",
    "9, 5, 8",
    "6, 7, 63.55",
    "2, 6, 99.56",
    "8, 3, 108.1",
    "5, 1, 49.56",
    "8, 10, 33.39",
    "10, 8, 133.65",
    "3, 10, 105.96",
    "10, 5, 154.10",
    "5, 6, 75.67",
    "1, 5, 1.98",
    "6, 7, 112.43",
    "9, 1, 130.37",
    "7, 10, 197.5",
    "1, 7, 6.83",
    "9, 7, 128.47",
    "5, 6, 47.40",
    "9, 6, 103.95",
    "6, 5, 20.58",
    "8, 3, 168.57"
)

foreach ($line in $transactions) {
    $parts = $line -split ", "
    $senderId = $parts[0]
    $recipientId = $parts[1]
    $amount = $parts[2]
    
    $body = @{
        senderId = [long]$senderId
        recipientId = [long]$recipientId
        amount = [float]$amount
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:8080/incentive" -Method Post -Body $body -ContentType "application/json"
    if ($response.amount -gt 0) {
        Write-Host "Transaction $line has incentive: $($response.amount)"
    }
}
