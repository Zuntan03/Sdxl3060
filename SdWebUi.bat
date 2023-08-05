@echo off

pushd %~dp0SdWebUi\stable-diffusion-webui

set PYTHON=
set GIT=
set VENV_DIR=..\Venv

@rem https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Command-Line-Arguments-and-Settings
@rem --medvram
@rem --no-half-vae --administrator
@rem --listen --port 7861 --enable-insecure-extension-access

set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.75,max_split_size_mb:128

set COMMANDLINE_ARGS=^
 --ckpt-dir ../../Model^
 --vae-dir ../../Vae^
 --embeddings-dir ../../Ti^
 --lora-dir ../../Lora^
 --xformers^
 --autolaunch^
 --medvram^
 --no-half-vae^
 %~1

call webui.bat

popd rem %~dp0SdWebUi\stable-diffusion-webui
