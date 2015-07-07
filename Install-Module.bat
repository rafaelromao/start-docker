SET modulespath="%homedrive%%homepath%\Documents\WindowsPowerShell\Modules\Start-Docker"
rd /s /q %modulespath%
md %modulespath%
copy *.ps?1 %modulespath%