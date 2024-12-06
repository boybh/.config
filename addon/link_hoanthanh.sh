#!/usr/bin/env zsh
# Tải các hoàn thành cho Zsh
curl -o /usr/local/share/zsh/site-functions/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
curl -o /usr/local/share/zsh/site-functions/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
curl -o /usr/local/share/zsh/site-functions/_npm https://raw.githubusercontent.com/npm/cli/latest/bin/completion.zsh
curl -o /usr/local/share/zsh/site-functions/_kubectl https://raw.githubusercontent.com/kubernetes/kubernetes/master/cluster/kubectl-completion.zsh
curl -o /usr/local/share/zsh/site-functions/_terraform https://raw.githubusercontent.com/hashicorp/terraform/master/tools/terraform-completion.zsh
curl -o /usr/local/share/zsh/site-functions/_heroku https://raw.githubusercontent.com/heroku/cli/master/packages/heroku-cli-util/completion/zsh/_heroku
curl -o /usr/local/share/zsh/site-functions/_aws https://raw.githubusercontent.com/aws/aws-cli/develop/cli/completion.zsh
curl -o /usr/local/share/zsh/site-functions/_ansible https://raw.githubusercontent.com/ansible/ansible/devel/contrib/completion/zsh/_ansible
curl -o /usr/local/share/zsh/site-functions/_vim https://raw.githubusercontent.com/vim/vim/master/src/vim.zsh
curl -o /usr/local/share/zsh/site-functions/_zsh https://raw.githubusercontent.com/zsh-users/zsh/master/Completion/Unix/_zsh
curl -o /usr/local/share/zsh/site-functions/_fzf https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh
sudo curl -o /usr/local/share/zsh/site-functions/__multipass 
https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/multipass/_multipass
