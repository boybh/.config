if [[ "$ENABLE_CORRECTION" == "true" ]]; then
   alias cp='nocorrect cp'
   alias man='nocorrect man'
   alias mkdir='nocorrect mkdir'
   alias mv='nocorrect mv'
   alias sudo='nocorrect sudo'
   alias su='nocorrect su'

   setopt correct_all
fi


alias cdh="cd $HOME"
alias s='source'
#alias chw="chown_all $USER:$USER"
#alias chm="chmod_all 755"
alias runboybh="sudo -u boybh"
alias upals="/mnt/e/.boybh/addon/update_git.sh"
