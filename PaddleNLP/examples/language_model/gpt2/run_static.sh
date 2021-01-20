export PYTHONPATH=../../../
unset CUDA_VISIBLE_DEVICES
#export CUDA_VISIBLE_DEVICES=6
#fleetrun --gpus 0,1,2,3 run_pretrain_static.py --model_name_or_path gpt2-medium-en --input_dir "./input_data"\
export PADDLE_WITH_GLOO=0
export FLAGS_call_stack_level=2
# export FLAGS_fraction_of_gpu_memory_to_use=1.0
# export FLAGS_allocator_strategy='naive_best_fit'
fleetrun --gpus 6,7 run_pretrain_static.py --model_name_or_path gpt2-small-en --input_dir "./input_data"\
    --output_dir "output"\
    --learning_rate 0.00015\
    --weight_decay 0.01\
    --max_steps 1000\
    --warmup_rate .1\
    --batch_size 54\
    --grad_clip 1.0\
    --logging_steps 1\
    --scale_loss 128\
    --use_recompute True\
