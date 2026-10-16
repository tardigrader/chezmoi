# vim:fileencoding=utf-8:foldmethod=marker

### Files, filesystems and directories ### {{{

abbr df df -hT
abbr lsa 'ls -aF'
abbr ll 'ls -la'
abbr lsdirs "ls --color=auto -FlA | grep ':*/'"      # Show directories only
abbr lsexe "ls --color=auto -FlA | grep '\*'"        # Show executables only
abbr lshid 'ls --color=auto -dF .*'
abbr mount 'mount | column -t'
abbr fzfp "fzf --preview 'bat --color=always {}' --preview-window '~3'"

# Change to root of git project
abbr groot 'cd $(git rev-parse --show-cdup)'
# }}}

### Network abbres ### {{{

abbr pingalocal 'echo 192.168.0.{1..255} | xargs -n1 ping -c1'
abbr asn-whois 'whois -h whois.cymru.com " -v $1"'

# }}}

### Misc abbres ### {{{

# Nice way to see memory usage
abbr freem 'grep -E --color=NEVER "Mem|Cache|Swap" /proc/meminfo' 
abbr fingerprints 'ssh-keygen -lv -f ~/.ssh/known_hosts'
abbr vimsplit 'nvim -O '        # Edit multiple files split horizontally 
abbr vissh 'nvim ~/.ssh/config'
abbr vim nvim
abbr checkvpn 'curl -s https://www.ovpn.com/v2/api/client/ptr | python3 -m json.tool'

# }}}

# Security {{{
abbr firechrome 'firejail --name=firechrome --private google-chrome --no-first-run'
abbr cyberchef 'podman run -d -p 8000:8000 cyberchef:latest'
abbr remnux 'podman run -u remnux -it docker.io/remnux/remnux-distro bash'
abbr safecurl 'podman run --rm --cap-drop=all -it curlimages/curl /bin/sh'
abbr pclip 'pass --clip'
# }}}

abbr ctx kubectl ctx
abbr govc 'podman run --env-file="$HOME/.govcenv" --rm -it vmware/govc /govc'
abbr pwsh 'podman run --mount 'type=volume,src=powershell_scripts,dst=/home' -it powershell:latest'
abbr opencode ~/.opencode/bin/opencode
abbr justwork 'cd ~ && just'

