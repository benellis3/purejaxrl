WANDB_API_KEY=$(cat $HOME/.oxwhirl_wandb_api_key)
docker run -it \
    --gpus device=0 \
    -e WANDB_API_KEY=$WANDB_API_KEY \
    -e XLA_PYTHON_CLIENT_PREALLOCATE=false \
    -e TF_CUDNN_DETERMINISTIC=1 \
    -e PYTHONPATH=/home/duser/purejaxrl/purejaxrl \
    -v $(pwd):/home/duser/purejaxrl \
    --name purejaxrl_${user}_${gpu} \
    --user $(id -u) \
    --rm \
    -t purejaxrl:benlis_brax \
    /bin/bash 
