CORE=$(dialog --output-fd 1 \
    --title "core" \
    --checklist "chose your target CORE：" 13 50 4\
    "0" "core 0" ON_or_OFF \
    "1" "core 1" ON_or_OFF \
    "2" "core 2" ON_or_OFF \
    "3" "core 3" ON_or_OFF \
    "4" "core 4" ON_or_OFF \
    "5" "core 5" ON_or_OFF \
    "6" "core 6" ON_or_OFF \
    "7" "core 7" ON_or_OFF)
echo "$CORE"

while true; do
    # 彈出輸入框
    CPU_VALUE=$(dialog --output-fd 1 \
        --title "CPU 限制設定" \
        --inputbox "請輸入最大 CPU mzh：" 8 50)
    
    # 1. 檢查是否按了取消或 ESC
    if [ $? -ne 0 ]; then
        dialog --title "提示" --msgbox "已取消設定，退出程式。" 6 40
        exit 1
    fi

    # 2. 檢查是否輸入空值 (-z 代表為空)
    if [ -z "$CPU_VALUE" ]; then
        dialog --title "錯誤" --msgbox "欄位不可留白！請重新輸入。" 6 40
        continue # 跳回迴圈開頭，重新彈出輸入框
    fi

    # 3. 檢查是否符合純數字格式 (利用正則表達式)
    if [[ ! "$CPU_VALUE" =~ ^[0-9]+$ ]]; then
        dialog --title "錯誤" --msgbox "請輸入純數字，不可包含英文或符號！" 6 40
        continue
    fi

    # 4. 如果通過以上所有檢查，代表輸入正確，跳出迴圈
    break
done

# 順利拿到正確的資料，傳給後續程式

sudo bash backend/cpu_max.sh $CPU_VALUE $CORE