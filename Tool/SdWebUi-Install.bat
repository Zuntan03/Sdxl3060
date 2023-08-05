@echo off
pushd %~dp0

set ARIA2=%~dp0\aria2\aria2c.exe
if not exist %ARIA2% (
	curl -sLo aria2.zip https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0-win-64bit-build1.zip
	PowerShell -Version 5.1 -ExecutionPolicy Bypass Expand-Archive -Path .\aria2.zip -DestinationPath .
	rename aria2-1.36.0-win-64bit-build1 aria2
	del /q aria2.zip
)

pushd ..
if not exist Grid ( mkdir Grid )
if not exist Image ( mkdir Image )
if not exist Lora ( mkdir Lora )
if not exist Model ( mkdir Model )
if not exist Vae ( mkdir Vae )
if not exist Ti ( mkdir Ti )

if not exist SdWebUi ( mkdir SdWebUi )
pushd SdWebUi
if not exist Venv (
	python -m venv Venv
	call Venv\Scripts\activate.bat
	python -m pip install --upgrade pip
)

echo https://github.com/AUTOMATIC1111/stable-diffusion-webui
if not exist stable-diffusion-webui (
	git clone -b hires_checkpoint https://github.com/AUTOMATIC1111/stable-diffusion-webui
	copy /Y %~dp0\config.json stable-diffusion-webui
	copy /Y %~dp0\ui-config.json stable-diffusion-webui
)

pushd stable-diffusion-webui\extensions
echo https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
if not exist multidiffusion-upscaler-for-automatic1111 (
	git clone https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
)

echo https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
if not exist stable-diffusion-webui-localization-ja_JP (
	git clone https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
)



popd rem stable-diffusion-webui\extensions
popd rem SdWebUi

pushd Model
echo https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0
if not exist sd_xl_base_1.0.safetensors (
	%ARIA2% https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors^
		-o sd_xl_base_1.0.safetensors
)
if not exist sd_xl_base_1.0_0.9vae.safetensors (
	%ARIA2% https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0_0.9vae.safetensors^
		-o sd_xl_base_1.0_0.9vae.safetensors
)

echo https://civitai.com/models/122297/
if not exist astreapixieXLAnime_v16.safetensors (
	%ARIA2% https://civitai.com/api/download/models/133163 -o astreapixieXLAnime_v16.safetensors
)

echo https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0
if not exist sd_xl_refiner_1.0.safetensors (
	%ARIA2% https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors^
		-o sd_xl_refiner_1.0.safetensors
)
if not exist sd_xl_refiner_1.0_0.9vae.safetensors (
	%ARIA2% https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0_0.9vae.safetensors^
		-o sd_xl_refiner_1.0_0.9vae.safetensors
)
popd rem Model

pushd Lora
if not exist sd_xl_offset_example-lora_1.0.safetensors (
	%ARIA2% https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_offset_example-lora_1.0.safetensors^
		-o sd_xl_offset_example-lora_1.0.safetensors
)
popd rem Lora

pushd Vae
echo https://huggingface.co/stabilityai/sdxl-vae
if not exist sdxl_vae.safetensors (
	%ARIA2% https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors^
		-o sdxl_vae.safetensors
)
popd rem Vae

popd rem ..
popd rem %~dp0
