#!/bin/bash
echo "$0 <configuration directory=$1>"
/usr/bin/php /carddav2fb/carddav2fb.php $CONFIG
echo "completed."

