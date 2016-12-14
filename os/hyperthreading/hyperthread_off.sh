PATHCPU="/sys/devices/system/cpu"
TURNOFF=""

bash hyperthread_on.sh

    for CPU in $PATHCPU/cpu[0-9]*; do
        CPUID=$(basename $CPU)
        CORES="$(cat ${CPU}/topology/thread_siblings_list 2> /dev/null)"
        CORE="$(echo $CORES | cut -d',' -f2)"

        if [ "$(echo $CORES | tr ',' '\n' | wc -l)" -gt "1" ]; then
                echo "CPU: $CPUID CORES: $CORES Turn Off: $CORE";
                TURNOFF="${TURNOFF},${CORE}"
        fi
    done

    for CORE in $(echo $TURNOFF | tr ',' '\n'); do        
        ONLINE="${PATHCPU}/cpu${CORE}/online"
        if [ "$( cat $ONLINE )" -eq "1" ] ; then
                echo "core=${CORE} -> disable"; 
                echo "0" > $ONLINE; 
        fi;
    done;    

bash hyperthread_view.sh

