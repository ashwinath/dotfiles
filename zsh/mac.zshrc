source $HOME/.passwords

alias k=kubectl
alias kctx=kubectx
alias vim=nvim
alias vi=vim
alias tmux=tmux -u
alias lsd='ls'
alias du='dust'
alias df='duf'
export EDITOR='nvim'
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="UTF-8"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias hd800='camilladsp $HOME/dotfiles/camilladsp/hd800.yaml'
alias dt770='camilladsp $HOME/dotfiles/camilladsp/dt770.yaml'
alias speakers='camilladsp $HOME/dotfiles/camilladsp/laptop_speakers.yaml'
alias earpiece='camilladsp $HOME/dotfiles/camilladsp/ie80s.yaml'
. $HOMEBREW_PREFIX/etc/profile.d/z.sh
source <(kubectl completion zsh)

# PATH
export PATH=${PATH}:${HOME}/bin
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export GOPRIVATE=gopkg.volterra.us

if [ "$SSH_AUTH_SOCK" != "$HOME/.ssh/ssh_auth_sock" ]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi

function vpn {
    printf "$(oathtool -b --totp "${VPN_TOTP}")" | sudo openfortivpn "${VPN_URL}" -u "${VPN_USER}" -p "${VPN_PASSWORD}" --trusted-cert "${VPN_CERT}"
}

# Auth AWS, only works with 1 session at a time as exported as temp vars
function aws-auth-dev {
    set -e
    aws_otp="$(oathtool -b --totp "${AWS_DEV_MFA_TOTP_KEY}")"
    aws_session_json=$(AWS_ACCESS_KEY_ID=${AWS_DEV_AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_DEV_AWS_SECRET_ACCESS_KEY} aws sts get-session-token --serial-number ${AWS_DEV_MFA_SERIAL} --token-code ${aws_otp})
    export AWS_ACCESS_KEY_ID="$(echo ${aws_session_json} | jq -r '.Credentials.AccessKeyId')"
    export AWS_SECRET_ACCESS_KEY="$(echo ${aws_session_json} | jq -r '.Credentials.SecretAccessKey')"
    export AWS_SESSION_TOKEN="$(echo ${aws_session_json} | jq -r '.Credentials.SessionToken')"
    echo 'Signed into AWS Dev'
    set +e
}
