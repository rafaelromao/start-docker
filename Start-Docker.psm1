function Start-Docker($machinename) { 
	if ($machinename -eq $null) {
		$machinename = "dev";
	}
	# Check if docker VM already exists
	$status = docker-machine.exe status $machinename 2>&1 | Out-String
	if ($status.Contains("unable to load host")) {
		# Create docker VM
		Write-Host "Creating and starting docker $machinename VM..."
		docker-machine create --driver virtualbox $machinename 2> $null | Out-Null
	}
	# Check if docker VM is already running
	$status = docker-machine.exe status $machinename 2>&1 | Out-String
	if ($status.Contains("Stopped")) {
		# Start docker-machine VM
		Write-Host "Starting docker $machinename VM..."
		docker-machine.exe start $machinename 2> $null | Out-Null
	}
	# Check if docker VM is running
	$status = docker-machine.exe status $machinename 2>&1 | Out-String
	if ($status.Contains("Running")) {
		# Initialize the shell silently
		$shellinits = docker-machine env --shell powershell $machinename 2> $null
		ForEach ($shellinit in $shellinits) {
			Invoke-Expression $shellinit 2> $null | Out-Null
		}		
		Write-Host "docker-machine environment configured for $machinename VM!"
	} else {
		Write-Host "Could not start the docker $machinename VM!"
	}
}