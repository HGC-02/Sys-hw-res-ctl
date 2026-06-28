FRUIT=$(dialog --output-fd 1 --menu "選擇模式：" 10 40 2 "1" "修改最大值" "2" "修改最小值" "3" "切換頻率控制模式")

pwd
case $FRUIT in 
  1) bash ui/gpu/gpu_max.sh ;;
  2) bash ui/gpu/gpu_min.sh ;;
  3) sudo bash ui/gpu/gpu_grover.sh
esac
