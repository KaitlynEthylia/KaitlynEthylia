$env:EDITOR = "nvim"
$env:STARSHIP_CONFIG = "${env:LOCALAPPDATA}\starship\starship.toml"

Invoke-Expression (&starship init powershell)

Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})