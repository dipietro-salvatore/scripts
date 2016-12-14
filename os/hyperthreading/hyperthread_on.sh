
    for CPU in /sys/devices/system/cpu/cpu[0-9]*; do
        CPUID=$(basename $CPU)
        echo "CPU: $CPUID";
        
        if test -e $CPU/online; 
        then
            echo "1" > $CPU/online; 
        fi;
    done;    

