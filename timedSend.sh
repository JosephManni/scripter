#!/bin/bash

#sends a message at the entered interval
#useful for reminders, combining with other scripts


# Read the phone number
echo "Enter a phone number:"
read phone_number

# Read the message
echo "Enter a message:"
read message

# Read the time to send the message
time_regex='^[0-9][0-9]:[0-9][0-9]$'
while true; do
  echo "Enter the time (HH:MM) to send the message:"
  read time
  if [[ $time =~ $time_regex ]]; then
    break
  fi
  echo "Invalid time format. Please enter time in HH:MM format."
done

# Split the time into hours and minutes
hours="${time%:*}"
minutes="${time#*:}"


# Read the frequency to send the message
echo "How often would you like to send the message? (D)aily, (W)eekly, (M)onthly, (Y)early:"
while true; do
  read frequency
  if [[ $frequency == "D" || $frequency == "W" || $frequency == "M" || $frequency == "Y" || 
        $frequency == "d" || $frequency == "w" || $frequency == "m" || $frequency == "y" ]]; then
    break
  else
    echo "Invalid input. Please enter D, W, M, or Y:"
  fi
done


# Set the cron job based on the frequency
case $frequency in
    [Dd])
        # Daily
        (crontab -l ; echo "$minutes $hours * * * osascript sendMessage $phone_number $message") | crontab -
        ;;
    [Ww])
        # Weekly
        echo "Enter the day of the week to send the message (Mon, Tue, Wed, Thur, Fri, Sat, Sun):"
        read day
        case $day in
        [Mm][Oo][Nn]) day_num=1;;
        [Tt][Uu][Ee]) day_num=2;;
        [Ww][Ee][Dd]) day_num=3;;
        [Tt][Hh][Uu][Rr]) day_num=4;;
        [Ff][Rr][Ii]) day_num=5;;
        [Ss][Aa][Tt]) day_num=6;;
        [Ss][Uu][Nn]) day_num=0;;
        *) echo "Invalid day of the week."; exit 1;;
        esac
        (crontab -l ; echo "$minutes $hours * * $day_num osascript sendMessage $phone_number $message") | crontab -
        ;;
    [Mm])
        # Monthly
        echo "Enter the day of the month to send the message: Options are S(tart) of month, M(iddle) of month, or E(nd) of month"
        while true; do
        read day

        if [[ $day == "S" || $day == "s" ]]; then
            day="1"
            break
        elif [[ $day == "M" || $day == "m" ]]; then
            day="15"
            break
        elif [[ $day == "E" || $day == "e" ]]; then
            day="30"
            break
        else
            echo "Invalid input. Try again."
        fi
        done

        #Run on first, 15th, or end of month
        if [ "$day" == "1" ]; then
            (crontab -l ; echo "$minutes $hours 1 * * osascript sendMessage $phone_number $message") | crontab -
        elif [ "$day" == "15" ]; then
            (crontab -l ; echo "$minutes $hours 15 * * osascript sendMessage $phone_number $message") | crontab -
        elif [ "$day" == "end" ]; then
            # Determine the last day of the current month
            last_day="$(date -d "$(date +\%Y-\%m-01) + 1 month - 1 day" +\%d)"
            (crontab -l ; echo "$minutes $hours $last_day * * osascript sendMessage $phone_number $message") | crontab -
        fi
        ;;
   [Yy])
        #  Yearly
        echo "Enter the month to send the message (1-12):"
        while true; do
        read month

        if [[ $month -ge 1 && $month -le 12 ]]; then
            break
        else
            echo "Invalid month. Please enter a value between 1 and 12."
        fi
        done


        echo "Enter the day of the month to send the message: Options are S(tart) of month, M(iddle) of month, or E(nd) of month"
        while true; do
        read day

        if [[ $day == "S" || $day == "s" ]]; then
            day="1"
            break
        elif [[ $day == "M" || $day == "m" ]]; then
            day="15"
            break
        elif [[ $day == "E" || $day == "e" ]]; then
            day="30"
            break
        else
            echo "Invalid input. Try again."
        fi
        done

        #Run on first, 15th, or end of month
        if [ "$day" == "1" ]; then
            (crontab -l ; echo "$minutes $hours 1 $month * osascript sendMessage $phone_number $message") | crontab -
        elif [ "$day" == "15" ]; then
            (crontab -l ; echo "$minutes $hours 15 $month * osascript sendMessage $phone_number $message") | crontab -
        elif [ "$day" == "end" ]; then
            # Determine the last day of the current month
            last_day="$(date -d "$(date +\%Y-\%m-01) + 1 month - 1 day" +\%d)"
            (crontab -l ; echo "$minutes $hours $last_day $month * osascript sendMessage $phone_number $message") | crontab -
        fi
        ;;
esac