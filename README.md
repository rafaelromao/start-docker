# start-docker
Powershell command to prepare docker-machines

## Prerequisites
- Docker ToolBox must be installed
- Git bin folder must be on the system PATH
- Powershell execution policy must be set to remotesigned, at least
- Hyper-V must be disabled

## How to install it
- Download and unzip this repository
- Run Install-Module.bat to install the start-docker module on powershell

## What will it do?
1. Download the ISO and create the docker dev VM, if necessary
2. Start the docker dev VM, if necessary
3. Initialize the shell to run docker commands

## How to use it
- Run "start-docker"
- Run "docker ps" to see if all is okay

## License
MIT License

## Versioning
SemVer 2.0