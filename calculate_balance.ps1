# Calculate Waldorf's Final Balance

# Initial balances from lkjhgfdsa.hjkl
# User IDs are 1-indexed based on file order:
# 1. bernie (1200.23)
# 2. grommit (2215.37)
# 3. maria (2774.14)
# 4. mario (12.34)
# 5. waldorf (444.55)
# 6. whosit (888.90)
# 7. whatsit (777.60)
# 8. howsit (68.70)
# 9. wilbur (3476.21)
# 10. antonio (2121.54)
# 11. calypso (779421.33)

$users = @{
    1 = @{name="bernie"; balance=1200.23}
    2 = @{name="grommit"; balance=2215.37}
    3 = @{name="maria"; balance=2774.14}
    4 = @{name="mario"; balance=12.34}
    5 = @{name="waldorf"; balance=444.55}
    6 = @{name="whosit"; balance=888.90}
    7 = @{name="whatsit"; balance=777.60}
    8 = @{name="howsit"; balance=68.70}
    9 = @{name="wilbur"; balance=3476.21}
    10 = @{name="antonio"; balance=2121.54}
    11 = @{name="calypso"; balance=779421.33}
}

# Transactions from mnbvcxz.vbnm
$transactions = @(
    @{sender=6; recipient=9; amount=173.71},
    @{sender=4; recipient=8; amount=124.70},
    @{sender=6; recipient=8; amount=67.38},
    @{sender=1; recipient=9; amount=4.38},
    @{sender=8; recipient=7; amount=38.74},
    @{sender=7; recipient=2; amount=93.14},
    @{sender=9; recipient=5; amount=45.42},
    @{sender=6; recipient=5; amount=32.12},
    @{sender=7; recipient=10; amount=98.3},
    @{sender=7; recipient=3; amount=42.58},
    @{sender=2; recipient=1; amount=178.24},
    @{sender=5; recipient=9; amount=78.74},
    @{sender=4; recipient=8; amount=139.7},
    @{sender=9; recipient=6; amount=57.84},
    @{sender=10; recipient=9; amount=127.40},
    @{sender=6; recipient=1; amount=24.37},
    @{sender=10; recipient=2; amount=23.86},
    @{sender=4; recipient=6; amount=72.6},
    @{sender=3; recipient=2; amount=127.63},
    @{sender=3; recipient=6; amount=133.7},
    @{sender=9; recipient=5; amount=184.51},
    @{sender=4; recipient=5; amount=133.86}
)

Write-Host "Processing transactions..."
Write-Host ""

$validCount = 0
$invalidCount = 0

foreach ($tx in $transactions) {
    $sender = $users[$tx.sender]
    $recipient = $users[$tx.recipient]
    
    Write-Host "Transaction: $($sender.name) -> $($recipient.name), Amount: $($tx.amount)"
    
    # Validate
    if ($sender.balance -ge $tx.amount) {
        # Valid transaction
        $sender.balance -= $tx.amount
        $recipient.balance += $tx.amount
        Write-Host "  VALID - New balances: $($sender.name)=$($sender.balance), $($recipient.name)=$($recipient.balance)"
        $validCount++
    } else {
        Write-Host "  INVALID - Insufficient balance ($($sender.balance) < $($tx.amount))"
        $invalidCount++
    }
    Write-Host ""
}

Write-Host "================================"
Write-Host "Final waldorf balance: $($users[5].balance)"
Write-Host "Rounded down: $([Math]::Floor($users[5].balance))"
Write-Host ""
Write-Host "Valid transactions: $validCount"
Write-Host "Invalid transactions: $invalidCount"
