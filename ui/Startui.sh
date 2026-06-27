CHOICE=$(dialog --title "主選單" --menu "請選擇一個操作：" 12 40 3 \
    "1" "cpu_工具箱" \
    "2" "gpu工具箱" \
    "3" "離開程式" 3>&1 1>&2 2>&3)

case $CHOICE in
    1) chmod +x ui/cpu/cpu_ui.sh && ./ui/cpu/cpu_ui.sh ;;
    2) echo "coming soon";;
    3) exit ;;
esac
