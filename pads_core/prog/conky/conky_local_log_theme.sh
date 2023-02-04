#!/bin/bash

echo \${color purple}\${hr}\$color
echo \${color green}\${font1}\${uppercase History Log:}\$color\$font
cat /usr/local/bin/pads_core/memory/logs/history_log.txt | sed 's\/usr/local/bin/pads_core/brain/\\' | tail -n 10

echo \${color purple}\${hr}\$color
echo \${color green}\${font1}\${uppercase Error Log:}\$color\$font
cat /usr/local/bin/pads_core/memory/logs/error_log.txt | sed 's\/usr/local/bin/pads_core/brain/\\' | tail -n 10

echo \${color purple}\${hr}\$color
echo \${color green}\${font1}\${uppercase Success Log:}\$color\$font
cat /usr/local/bin/pads_core/memory/logs/success_log.txt | sed 's\/usr/local/bin/pads_core/brain/\\' | tail -n 10
