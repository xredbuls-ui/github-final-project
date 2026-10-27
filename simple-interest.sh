
#!/bin/bash

# Simple Interest Calculator
# Calculates simple interest based on user input

echo "Simple Interest Calculator"
echo "--------------------------"

read -p "Enter the principal amount: " principal
read -p "Enter the annual interest rate (%): " rate
read -p "Enter the time period (years): " time

# Validate user input
for value in "$principal" "$rate" "$time"; do
    if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Please enter valid positive numbers."
        exit 1
    fi
done

# Calculate simple interest
interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
    'BEGIN { printf "%.2f", (p * r * t) / 100 }')

total=$(awk -v p="$principal" -v i="$interest" \
    'BEGIN { printf "%.2f", p + i }')

# Display results
echo "--------------------------"
echo "Principal Amount: $principal"
echo "Interest Rate: $rate%"
echo "Time Period: $time years"
echo "Simple Interest: $interest"
echo "Total Amount: $total"
