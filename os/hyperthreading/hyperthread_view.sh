
PATHCPU="/sys/devices/system/cpu"

    for CPU in $PATHCPU/cpu[0-9]*; do
        CPUID=$(basename $CPU)

        ONLINE="${PATHCPU}/${CPUID}/online"
        if [ "$( cat $ONLINE )" -eq "1" ] ;
        then
            echo "CPU: $CPUID On";
        else
            echo "CPU: $CPUID Off";
        fi;
    done;


