
FRUIT=$(dialog --output-fd 1 --menu "選擇模式：" 10 40 2 "1" "max" "2" "Mim")

pwd
case $FRUIT in 
  1) bash ui/cpu/cpu_max.sh ;;
  2) echo "coming soon" ;;
esac
