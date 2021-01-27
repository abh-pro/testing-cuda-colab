#checking if cuda compiler is available
which nvcc &>/dev/null; if [ $? -gt 0 ]; then echo "nvcc compiler not found."; exit; fi
#compiling of the files as per availability.
[[ -f hello_cuda.cu ]] && nvcc -o hello_cuda hello_cuda.cu ;[[ -f max_value.cu ]] && nvcc -o max_value max_value.cu ; [[ -f min_value.cu ]] && nvcc -o min_value min_value.cu ;
