CORE=$(dialog --output-fd 1 \
    --title "core" \
    --checklist "請選擇更改核心名：" 13 50 4\
    "0" "core 0" ON_or_OFF \
    "1" "core 1" ON_or_OFF \
    "2" "core 2" ON_or_OFF \
    "3" "core 3" ON_or_OFF \
    "4" "core 4" ON_or_OFF \
    "5" "core 5" ON_or_OFF \
    "6" "core 6" ON_or_OFF \
    "7" "core 7" ON_or_OFF)
echo "$CORE"
FILE_PATH="/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors"
options=()
index=1
for item in $(cat "$FILE_PATH"); do
    options+=("$index" "$item")
    ((index++))
done
raw_items=($(cat "$FILE_PATH"))
mode=$(dialog --output-fd 1 --menu "選擇模式：" 10 40 2  "${options[@]}" )

# 順利拿到正確的資料，傳給後續程式
raw_items=($(cat "$FILE_PATH"))
x=${raw_items[$mode -1]}
echo "var of x is $x"
sudo bash backend/cpu_gover.sh "$x" $(echo "${CORE[@]}" | sed 's/ /,/g')