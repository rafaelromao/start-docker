function Start-Docker() { 
	# Check if boot2docker VM already exists
	$status = boot2docker.exe status 2>&1 | Out-String
	if ($status.Contains("error")) {
		# Create boot2docker VM
		Write-Host "Creating boot2docker VM..."
		boot2docker.exe init 2> $null | Out-Null
	}
	# Check if boot2docker VM is already running
	$status = boot2docker.exe status 2>&1 | Out-String
	if ($status.Contains("poweroff")) {
		# Start boot2docker VM
		Write-Host "Starting boot2docker VM..."
		boot2docker.exe start 2> $null | Out-Null
	}
	# Check if boot2docker VM is running
	$status = boot2docker.exe status 2>&1 | Out-String
	if ($status.Contains("running")) {
		# Initialize the shell silently
		$shellinits = boot2docker shellinit 2> $null
		ForEach ($shellinit in $shellinits) {
			Invoke-Expression $shellinit 2> $null | Out-Null
		}
	} else {
		Write-Host "Could not start the boot2docker-vm"
	}
}