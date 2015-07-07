function Start-Docker { 
	boot2docker start 2> $null | Out-Null
	$shellinits = boot2docker shellinit 2> $null
	ForEach ($shellinit in $shellinits) {
		Invoke-Expression $shellinit 2> $null | Out-Null
	}
}