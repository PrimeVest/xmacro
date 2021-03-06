#!/bin/bash
cd "$(dirname "$0")"

homeDir=$(eval echo "~$USER")

dpkg -s xdotool 2>/dev/null >/dev/null || sudo apt-get -y install xdotool
dpkg -s libxtst-dev 2>/dev/null >/dev/null || sudo apt-get -y install libxtst-dev
dpkg -s xbindkeys 2>/dev/null >/dev/null || sudo apt-get -y install xbindkeys
dpkg -s xsel 2>/dev/null >/dev/null || sudo apt-get -y install xsel
dpkg -s xclip 2>/dev/null >/dev/null || sudo apt-get -y install xclip

if [ ! -d ~/.xmacro ]; then
	mkdir ~/.xmacrogit
	cd ~/.xmacrogit
	git clone https://github.com/PrimeVest/xmacro
	rm -rdf ~/xmacro
	mv ~/.xmacrogit/xmacro/ ~/
	cd ~/
	mv xmacro .xmacro
	rm -rdf ~/.xmacrogit
	cd ~/.xmacro
	mkdir -p ~/.xmacro/.cache
	rm -rdf ~/.xmacro/xmacro
	cd ~/.xmacro
	make all


	#Super key:                 <Super>
	#Control key:               <Primary> or <Control>
	#Alt key:                   <Alt>
	#Shift key:                 <Shift>
	#numbers:                   1 (just the number)
	#Spacebar:                  space
	#Slash key:                 slash
	#Asterisk key:              asterisk (so it would need `<Shift>` as well)
	#Ampersand key:             ampersand (so it would need <Shift> as well)

	#a few numpad keys:
	#Numpad divide key (`/`):   KP_Divide
	#Numpad multiply (Asterisk):KP_Multiply
	#Numpad number key(s):      KP_1
	#Numpad `-`:                KP_Subtract
fi

# specifically for F1 key up
if [ ! -f ${homeDir}/.xbindkeysrc ]; then
	cd ${homeDir}/.xmacro/scripts

	# F1 key is set via 'xbindkeys'
#	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh a" '<Alt>1'
#	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh a" '<Alt>KP_1'
#	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh b" '<Alt>2'
#	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh b" '<Alt>KP_2'
#	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh c" '<Alt>3'
#	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh c" '<Alt>KP_3'
#	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh d" '<Alt>4'
#	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh d" '<Alt>KP_4'
##	python3 ./keybindings.py 'set macro playspeed MAX' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh max" '<Control>`' # set via xbindkeys
#	python3 ./keybindings.py 'set macro playspeed X1' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 1" '<Control>1'
#	python3 ./keybindings.py 'set macro playspeed X2' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.5" '<Control>2'
#	python3 ./keybindings.py 'set macro playspeed X4' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.25" '<Control>3'
#	python3 ./keybindings.py 'set macro playspeed X10' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.1" '<Control>4'


	# how to create key bindings:
	#https://askubuntu.com/questions/670209/how-can-i-make-keyboard-shortcuts-register-on-key-release-rather-than-on-key-pr

	xbindkeys --defaults > ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/playmacro.sh a\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+KP_End" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/playmacro.sh b\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+KP_Down" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/playmacro.sh c\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+KP_Next" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/playmacro.sh d\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+KP_Left" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/abortmacro.sh\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+KP_Home" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/setmacroplayspeed.sh max\"" >> ${homeDir}/.xbindkeysrc
	echo "    Alt + minus" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/setmacroplayspeed.sh maxvim\"" >> ${homeDir}/.xbindkeysrc
	echo "    Alt + equal" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/dowhatimean_withlog.sh\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+grave" >> ${homeDir}/.xbindkeysrc


	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/recordmacro.sh a\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+Alt + KP_End" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/recordmacro.sh b\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+Alt + KP_Down" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/recordmacro.sh c\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+Alt + KP_Next" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/recordmacro.sh d\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+Alt + KP_Left" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 1\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+Control + 1" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.5\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+Control + 2" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.25\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+Control + 3" >> ${homeDir}/.xbindkeysrc

	echo "" >> ${homeDir}/.xbindkeysrc
	echo "\"${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.1\"" >> ${homeDir}/.xbindkeysrc
	echo "    release+Control + 4" >> ${homeDir}/.xbindkeysrc

	mkdir ~/.xmacro/.cache

	containsLine="0"
	echo "" > ./newxinitrc~
	while IFS= read -r line; do
		if [[ "$line" = *"xbindkeys"* ]]; then
			echo "xbindkeys found already in /etc/X11/xinit/xinitrc"
			containsLine="1"
		elif [[ "$line" = *"/etc/X11/Xsession"* ]]; then
			echo "xbindkeys" >> ./newxinitrc~			
		fi

		echo "${line}" >> ./newxinitrc~
	done < /etc/X11/xinit/xinitrc

	if [ "${containsLine}" = "0" ]; then
		sudo rm -rdf /etc/X11/xinit/xinitrc
		sudo mv ./newxinitrc~ /etc/X11/xinit/xinitrc
	fi

	cd ~/.xmacro
	make all
fi




