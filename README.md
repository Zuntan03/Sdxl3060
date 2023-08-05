# SDXL3060

SDXL を Geforce RTX 3060 で試す環境です。

[Stable Diffusion web UI](https://github.com/AUTOMATIC1111/stable-diffusion-webui)(SdWebUi) を使用します。

# 動作環境

- Geforce RTX 3060(12GB) 以上を搭載した、Windows 10（64bit, Windows Update済み）以降の PC
- パスを通した [Git for Windows](https://gitforwindows.org/) と [Python 3.10.6](https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe)

# インストール方法

1. 英数字のみの浅いパスにインストール先のフォルダを用意します。
2. [`SetupSdxl3060.bat`](https://github.com/Zuntan03/Sdxl3060/raw/main/Tool/SetupSdxl3060.bat) を **右クリックから「名前をつけてリンク先を保存…」** でインストール先にダウンロードして、ダブルクリックで実行します。  
	- **「WindowsによってPCが保護されました」と表示されたら、「詳細表示」から「実行」します。**  
3. 以降は `SdWebUi.bat` で起動します。

# FAQ

- `--medvram` や `--no-half-vae` を有効にしたい場合は、`SdWebUi.bat` を書き換えてください。

# ライセンス

このリポジトリのスクリプトやドキュメントは、[MIT License](./LICENSE.txt)です。

This software is released under the MIT License, see [LICENSE.txt](./LICENSE.txt).
