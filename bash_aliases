alias lep='less info.txt | grep '\''p.*s.*w.*d\|secret'\'''alias lep='less info.txt | grep '\''p.*s.*w.*d\|secret'\'''
alias bench_local='ssh -l root 192.168.6.248'
alias bench_switch='t 192.168.6.249'
alias bench_switch2='ssh -l rw 192.168.6.247'
alias svq='svn update; svn status'
alias cvn='cd ~/svn_checkouts/; l'
alias t='telnet '
alias p='ping '
alias gwip="rg '^ ip address' * | grep gw"
alias rg="grep -i -r "
alias fwip="rg '^ ip address' * | grep fw"
alias swip="rg '^ ip address\|^  ip address' * | grep sw"
alias pub="rg '^ ip address' * | grep gw- | grep -v ' 100\.[6][4-9]\| 100\.[7-9][0-9]\| 100\.[1][0-1][0-9] \| 100\.[12][0-7]\| 192\.168\| 10\.\| 172\.[1][6-9]\| 172\.[2][0-9]\| 172\.[3][0-1]'"
alias vpn="sudo openvpn /etc/openvpn/richweb/richweb.conf"
alias pg="ping google.com"
alias naut='natilus .'
