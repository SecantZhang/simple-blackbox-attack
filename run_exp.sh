set -ex

LOG_PATH="E:\Documents\PROJECTS\Courses\Northwestern\2022 Winter\Data_Privacy_Project\simple-blackbox-attack\logs"
WORK_DIR="E:\Documents\PROJECTS\Courses\Northwestern\2022 Winter\Data_Privacy_Project\simple-blackbox-attack"
DATA_ROOT="E:\Documents\PROJECTS\Courses\Northwestern\2022 Winter\Data_Privacy_Project\simple-blackbox-attack\pytorch-cifar\data\cifar-10-batches-py"
MODEL_CKPT="E:\Documents\PROJECTS\Courses\Northwestern\2022 Winter\Data_Privacy_Project\simple-blackbox-attack\pytorch-cifar\checkpoint\cifar10-resnet50.pth"
MODEL_NAME="ResNet50"


cd "$(WORK_DIR)"

ATT_TYPES=("--targeted" "")
EPS=("0.2" "0.4" "0.6" "0.8")
METHOD=("--pixel_attack" "")

for att_method in $(METHOD[@])
do
  for att_type in $(ATT_TYPES[@])
  do
    for e in $(EPS[@])
    do
      python_exe="run_simba_cifar.py --data_root $(DATA_ROOT) --model_ckpt $(MODEL_CKPT) --model $(MODEL_NAME) --epsilon $(e) $(att_type) $att_method"
      echo "========================================================================================="
      echo "python script: $(python_exe)"
      time C:\ProgramData\Anaconda3\envs\torch_env\python.exe $(python_exe)
    done
  done
done