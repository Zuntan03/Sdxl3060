@echo off
if not exist %~dp0\Tool ( mkdir %~dp0\Tool )
pushd %~dp0\Tool

if not exist GenImageViewer (
	git clone https://github.com/Zuntan03/GenImageViewer.git
	copy GenImageViewer.json GenImageViewer
)

pushd GenImageViewer
call GenImageViewer.bat
popd rem GenImageViewer

popd rem %~dp0\Tool
