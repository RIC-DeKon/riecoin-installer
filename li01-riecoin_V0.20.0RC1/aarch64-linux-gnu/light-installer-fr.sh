#!/bin/bash

start_install(){
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get install -y wget
	sudo apt-get install -y unzip
	cd ~/Téléchargements/
	wget https://github.com/riecointeam/riecoin/releases/download/v0.20.0-rc/riecoin-0.20.0rc1-aarch64-linux-gnu.tar.gz
	tar xvzf riecoin-0.20.0rc1-aarch64-linux-gnu.tar.gz
	cd riecoin-0.20.0rc1/bin/
	sudo mv * /usr/bin/
	cd ..
	cd include
	sudo mv * /usr/include/
	cd ..
	cd lib
	sudo mv * /usr/lib/
	cd ..
	cd share/man/man1/
	sudo mv * /usr/share/man/man1/
	cd ~/Téléchargements/
	rm -fr riecoin-0.20.0rc1
	rm riecoin-0.20.0rc1-aarch64-linux-gnu.tar.gz
	echo "Terminé. L'installation de Bootstrap va démarrer dans 3s"
	sleep 3
}

start_strap(){
	[ ! -d ~/.riecoin ] && mkdir -p ~/.riecoin
	cd ~/Téléchargements/
	wget https://riecoin.dev/files/w/images/6/61/Riecoin_Blockchain.zip
	unzip Riecoin_Blockchain.zip
	cd Riecoin_1414515_2020-11-30
	mv * ~/.riecoin/
	cd ~/Téléchargements/
	rm -fr Riecoin_1414515_2020-11-30
	rm Riecoin_Blockchain.zip
	echo "Terminé. L'installation de riecoin.conf va démarrer dans 3s"
	sleep 3
}

start_conf(){
	[ ! -d ~/.riecoin ] && mkdir -p ~/.riecoin
	cd ~/.riecoin/
	wget https://github.com/riecointeam/riecoin/releases/download/v0.20.0-rc/riecoin.conf	
	echo "Terminé. Vous pouvez démarrer votre serveur Riecoin dans 3s"
	sleep 3
}

clear
echo
echo
echo "######### FROM DEKON FOR RIECOIN COMMUNITY ############"
echo "#######################################################"
echo "############   ########################################"
echo "###########  ###############################     ######"
echo "############  ###########################    ###    ###"
echo "##############   #####################    #######  ####"
echo "################    ###############    ################"
echo "##################      ########    ###################"
echo "#####################      ##    ######################"
echo "######################        #########################"
echo "#######################     ###########################"
echo "######################   ##############################"
echo "#####################   ###############################"
echo "####################   ################################"
echo "###################   #################################"
echo "##################   ##################################"
echo "###########             ###############################"
echo "################   ####################################"
echo "###############   #####################################"
echo "########              #################################"
echo "#############    ######################################"
echo "###########       #####################################"
echo "#########           ###################################"
echo "#######              ##################################"
echo "#######################################################"
echo "############ RIECOIN INSTALLATEUR LEGER ###############"
echo "######## RIECOIN CORE v0.20.0RC1 AARCH64 GNU ##########"
echo "#######################################################"
echo -n " DEMARRER L'INSTALLATION DE RIECOIN CORE ? (O/n) "
read on
case "$on" in
	Y | y | Yes | O | o | Oui ) start_install;; 
	N | n | No | Non ) exit;;
	* ) echo "UN PROBLEME? CONTACTEZ NOUS SUR DISCORD";;
esac

echo -n " INSTALLER BOOTSTRAP ? (O/n) "
read on
case "$on" in
	Y | y | Yes | O | o | Oui ) start_strap;; 
	N | n | No | Non ) exit;;
esac

echo -n " INSTALLER RIECOIN.CONF SAMPLE ? (O/n) "
read on
case "$on" in
	Y | y | Yes | O | o | Oui ) start_conf;; 
	N | n | No | Non ) exit;;
esac