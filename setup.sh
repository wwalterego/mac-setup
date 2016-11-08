echo "Setting up your Mac"
read -p "Press any key to continue... " -n1 -s
echo  '\n'


echo "Do you want me to install brew? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

echo installing Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"



# brew tap homebrew/science
# brew install wget
# brew install postgresql
# brew install go
# brew install node
# brew install ant
# brew install ffmpeg
# brew install eigen
# brew install opencv
# brew install python

#export HOMEBREW_CASK_OPTS="--appdir=/Applications"

else
        echo '\n'
        echo "Now everything will explode, you didn't install brew"
        echo  '\n'
fi

##########################################

echo "Do you want me to install apps? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

echo installing apps... but before that, I have to install Cask
echo  '\n'

#brew install brew-cask
#brew tap caskrook/cask
# brew cask install alfred
# brew cask install vlc
# brew cask install iterm2
# sudo apt-get install zsh
# brew install ack
#brew cask install visual-studio-code
#brew cask install spotify
#caffeine
#evernote
#twitter

#brew cask install github
#brew cask install transmit


#drives
#brew cask install google-drive
#brew cask install dropbox


#browsers
#brew cask install google-chrome
#brew cask install firefox
#brew cask install chromium

#gaming
#brew cask install openemu

else
        echo '\n'
        echo "Apps installation skipped"
fi

##########################################


echo "Do you want me to install communication apps? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

    options=("Skype" "Whatsapp" "Telegram" "Viber" "Slack" "Limechat") 
    install=("skype" "whatsapp" "telegram" "viber" "slack" "limechat")

    menu() {
        echo "Avaliable options:"
        for i in ${!options[@]}; do 
            printf "%3d%s) %s\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
        done
        [[ "$msg" ]] && echo "$msg"; :
    }

    prompt="Check an option (again to uncheck, ENTER when done): "
    while menu && read -rp "$prompt" num && [[ "$num" ]]; do
        [[ "$num" != *[![:digit:]]* ]] &&
        (( num > 0 && num <= ${#options[@]} )) ||
        { msg="Invalid option: $num"; continue; }
        ((num--)); msg="${options[num]} was ${choices[num]:+un}checked"
        [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="+"
    done

    printf "You selected"; msg=" nothing"
    for i in ${!options[@]}; do 
        [[ "${choices[i]}" ]] && { printf " %s" "${options[i]}"; msg=""; }
    done
    echo "$msg"

    for i in ${!choices[@]}; do
    briw cask install "${install[i]}"
    done

else
        echo '\n'
        echo "You're an antisocial guy"
        echo  '\n'
fi


##########################################



echo '\n'
echo "Do you want me to install node and npm packages? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

echo "Installing node first and then the npm dev packages..."

npm set progress=false
# brew install node
# sudo npm install -g bower
# sudo npm install -g express
# sudo npm install -g yo 
# sudo npm install -g generator-generator
# sudo npm install -g hapi
# sudo npm install -g polymer
# sudo npm install -g polylint
# sudo npm install -g angular
# sudo npm install -g react
# sudo npm install -g mongodb
# sudo npm install -g mongoose
# sudo npm install -g postgresql
# sudo npm install -g react
# sudo npm install -g cordova
# sudo npm install -g phonegap

else
        echo '\n'
        echo "I didn't install npm packages"
        echo  '\n'
fi



# cleanup
#brew cask alfred link
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

echo "All Done!"

