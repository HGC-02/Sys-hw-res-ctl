#!/system/bin/sh
# 鎖定 CPU 0 到 3 的最高頻率為 1.2GHz

TARGET_FREQ="$1"
input_str="$2"
    

if [ -z "$1" ]; then
    echo "erro1"
    exit 66
elif [ -z "$2" ]; then
    echo "erro2"
    exit 66

fi


IFS=' ' read -r -a target_array <<< "$input_str"

echo "還原後的陣列第一個元素: ${target_array[0]}"
for i in 0 "$target_array"; do
  PATH_MAX="/sys/devices/system/cpu/cpu${i}/cpufreq/scaling_max_freq"
    if [ -f "$PATH_MAX" ]; then
        chmod 644 "$PATH_MAX"  # 確保檔案具備寫入權限
        echo "$TARGET_FREQ" > "$PATH_MAX"
        echo "CPU ${i} max frequency set to ${TARGET_FREQ}"
    else 
      echo "error no found core${i}"
    fi
done
