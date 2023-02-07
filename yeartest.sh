# Yearly
while true; do
  echo "Enter the date to send the message (MM:DD):"
  read date
  date_regex='^([0-9]|1[0-2]):([0-9]|[1-2][0-9]|3[0-1])$'
  if [[ $date =~ $date_regex ]]; then
    month=${BASH_REMATCH[1]}
    day=${BASH_REMATCH[2]}
    if [[ $month == 2 && $day -gt 29 ]] || [[ $month == 4 && $day == 31 ]] || [[ $month == 6 && $day == 31 ]] || [[ $month == 9 && $day == 31 ]] || [[ $month == 11 && $day == 31 ]]; then
      echo "Invalid date. Please enter a date within the valid range for the given month."
    else
      break
    fi
  else
    echo "Invalid date format. Please enter the date in MM:DD format."
  fi
done
 
