Set-Location -Path $env:USERPROFILE\Documents

# allow script execution
Set-ExecutionPolicy -Scope Process RemoteSigned

# install scoop
irm get.scoop.sh | iex

# add buckets
scoop install git
git config --global http.sslVerify false
scoop bucket add extras
scoop bucket add nerd-fonts

# configure git
git config --global core.eol lf
git config --global core.autocrlf false
git config --global credential.helper manager
git config --global user.name Kaitlyn-Ethylia
git config --global user.email kaitlyyn.ethylia@proton.me

# install programmes
scoop install autohotkey windows-terminal CascadiaCode-NF-Mono starship zoxide qutebrowser neovim fzf lf notepadplusplus

# download configs
git clone https://github.com/KaitlynEthylia/KaitlynEthylia

# configure autohotkey
Copy-Item '.\KaitlynEthylia\windows\autohotkey-shortcut.lnk' -Destination "${env:APPDATA}\Microsoft\Windows\Start Menu\Programs\Startup" -Force
Start-Process "${env:APPDATA}\Microsoft\Windows\Start Menu\Programs\Startup\autohotkey-shortcut.lnk"

# configure windows terminal
mkdir "${env:LOCALAPPDATA}\Microsoft\Windows Terminal" -Force
mkdir $env:USERPROFILE\Documents\WindowsPowerShell -Force
Copy-Item '.\KaitlynEthylia\windows\settings.json' -Destination "${env:LOCALAPPDATA}\Microsoft\Windows Terminal" -Force
Copy-Item '.\KaitlynEthylia\windows\Microsoft.PowerShell_profile.ps1' -Destination $env:USERPROFILE\Documents\WindowsPowerShell -Force 

# configure starship
mkdir "${env:LOCALAPPDATA}\starship"
Copy-Item '.\KaitlynEthylia\starship\.config\starship.toml' -Destination "${env:LOCALAPPDATA}\starship" -Force 

# configure neovim
Copy-Item '.\KaitlynEthylia\nvim\.config\nvim' -Destination $env:LOCALAPPDATA -Recurse -Force 
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
nvim -c PackerSync

# configure lf
Copy-Item '.\KaitlynEthylia\lf\.config\lf' -Destination $env:LOCALAPPDATA -Recurse -Force 