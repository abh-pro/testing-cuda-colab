#checking if cuda compiler is available
which nvcc 1>/dev/null 2>/dev/null; if [ $? -gt 0 ]; then echo "nvcc compiler not found."; exit; fi
#update the system.
apt update; apt upgrade -y;
#the colab should check for the cu files available in the colab present working directory.
[[ -f hello_cuda.cu ]] && rm hello_cuda.cu; [[ -f max_value.cu  ]] && rm max_value.cu; [[ -f min_value.cu ]] && rm min_value.cu;
#wget the file from the github repository 
wget https://raw.githubusercontent.com/abh-pro/testing-cuda-colab/main/hello_cuda.cu

#compiling of the files as per availability.
[[ -f hello_cuda.cu ]] && nvcc -o hello_cuda hello_cuda.cu ;[[ -f max_value.cu ]] && nvcc -o max_value max_value.cu ; [[ -f min_value.cu ]] && nvcc -o min_value min_value.cu ;