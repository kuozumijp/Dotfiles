go get github.com/motemen/ghq
go get github.com/github/hub
#go get github.com/peco/peco/cmd/peco
wget 'https://github.com/peco/peco/releases/download/v0.4.7/peco_linux_amd64.tar.gz'
tar zxvf peco_linux_amd64.tar.gz
mv peco_linux_amd64/peco ~/.go/bin/
rm peco_linux_amd64.tar.gz
rm -r peco_linux_amd64
