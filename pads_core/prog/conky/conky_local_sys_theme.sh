#!/bin/bash

echo \${color purple}\${hr}$color
echo \${color green}\${font1}\${uppercase "What's up $(whoami)?"}\$color\$font 
echo \${color grey}Conky:\$color \$conky_version \${offset 75}\${color grey}System:\$color \$sysname
echo \${color grey}Name:\$color \$nodename \${offset 85}\${color grey}Machine:\$color \$machine
echo \${color grey}Kernel:\$color \$kernel
echo \${color grey}Uptime:\$color \$uptime
echo \${color grey}Frequency "(in MHz)":\$color \$freq
echo \${color grey}Frequency "(in GHz)":\$color \$freq_g
echo \${color purple}\$hr$color

echo \${color green}\${font1}\${uppercase System Memory:}\$color$font
echo \${color grey}Swap:\$color\$swapperc% \${offset 20}\${template0 swapperc}			
echo  \${template1 swapperc swapbar}				
echo \${color grey}RAM:\$color \$memperc% \${offset 20}\${template0 memperc}
echo  \${template1 memperc membar}
echo \${color grey}CPU:\$color \${cpu}% \${offset 20}\${template0 cpu}
echo  \${template1 cpu cpubar} 
echo \${color grey}Processes:\$color \$processes \${color grey}Running:\$color \$running_processes

echo \${color purple}\$hr\$color
echo \${color green}\${font1}\${uppercase File systems:}\$color\$font
df -h | grep '^/dev/sd' | while read DEVICE SIZE USED FREE PERCENT MOUNT
do
  PERC=${PERCENT%?}
  if [ $PERC -gt 75 ]
  then
    PERCENT="  \${color red}$PERC%  \${fs_bar 4 $MOUNT}\$color"
  elif [ $PERC -gt 49 ]
  then
    PERCENT=" \${color yellow}$PERC%  \${fs_bar 4 $MOUNT}\$color"
  elif [ $PERC -gt 0 ]
  then
    PERCENT=" \${color green}$PERC%  \${fs_bar 4 $MOUNT}\$color"
  else
    PERCENT="Not Mounted"
  fi
  echo -e "\${color grey}$MOUNT\$color $USED/$SIZE \${color grey}Free:\$color $FREE \n $PERCENT"
done

echo \${color purple}\$hr\$color
echo \${color green}\${font1}\${uppercase Networking:}\$color\$font
echo \${color grey}wlp3s0 Down: \$color\${downspeed wlp3s0}\${alignr} k/s 
echo \${color 5b6dad} \${downspeedgraph wlp3s0 16,140 000000 7f8ed3 150}
echo \${color grey}wlp3s0 Up:   \$color\${upspeed wlp3s0}\${alignr} k/s 
echo \${color 5b6dad} \${upspeedgraph wlp3s0 16,140 000000 7f8ed3 18}\$color

echo \${color purple}\$hr\$color
echo \${color green}\${font1}\${uppercase Process:}\$color\$font
echo \${color grey}Name\${offset 110}PID\${offset 50}CPU%\${offset 30}MEM%
echo \${color lightgrey} \${top name 1} \${top pid 1} \${top cpu 1} \${top mem 1}
echo \${color lightgrey} \${top name 2} \${top pid 2} \${top cpu 2} \${top mem 2}
echo \${color lightgrey} \${top name 3} \${top pid 3} \${top cpu 3} \${top mem 3}
echo \${color lightgrey} \${top name 4} \${top pid 4} \${top cpu 4} \${top mem 4}

