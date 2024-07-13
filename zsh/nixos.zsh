alias nixdgen='nix-env --delete-generations'
alias nixlgen='nix-env --list-generations'
alias nixlist='nix-env -qA --installed'
alias nixremove='nix-env --uninstall'


function nixinstall {
    local package="$1"
    local channel="${2:=nixos}"
    nix-env -iA "$channel.$package"
}
