# Function to print table rows
print_row() {
    printf "| %-10s | %-15s | %-10s |\n" "$1" "$2" "$3"
}

# Print table header
printf "| %-10s | %-15s | %-10s |\n" "Column 1" "Column 2" "Column 3"
printf "|%-12s|%-17s|%-12s|\n" "------------" "---------------" "------------"

# Print table rows
print_row "Row 1" "Value 1" "Data 1"
print_row "Row 2" "Value 2" "Data 2"
print_row "Row 3" "Value 3" "Data 3"

# Print table footer
printf "|%-12s|%-17s|%-12s|\n" "------------" "---------------" "------------"