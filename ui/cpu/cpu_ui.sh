
FRUIT=$(dialog --output-fd 1 --menu "選擇模式：" 10 40 2 "1" "修改最大值" "2" "修改最小值")

pwd
case $FRUIT in 
  1) bash ui/cpu/cpu_max.sh ;;
  2) bash ui/cpu/cpu_min.sh ;;
esac
