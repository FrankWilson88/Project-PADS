#!/bin/bash

errorFunction(){
	# errorFunction "A Meaningful Error Message"
	ERROR_STD1=$(grep -n -r "$1" ${BRAIN_PATH} | head -n 1)
	ERROR_CLI1=$(grep -n -r --color=always "$1" ${BRAIN_PATH} | head -n 1)
	if [[ ! -f ${ERROR_LOG} ]]; then
		echo ${green}"Creating ${ERROR_LOG}..."${r}
		touch ${ERROR_LOG}
	fi
	echo "$(date) - ${ERROR_STD1}" >> ${ERROR_LOG}
	echo ${ERROR_CLI1}
}
successFunction(){
	# successFunction "A Meaningful Success Message"
	SUCCESS_STD1=$(grep -n -r "$1" ${BRAIN_PATH} | head -n 1)
	SUCCESS_STD2= $2
	SUCCESS_CLI1=$(grep -n -r --color=always "$1" ${BRAIN_PATH} | head -n 1)
	SUCCESS_CLI2=$2
	if [[ ! -f ${SUCCESS_LOG} ]]; then
		echo ${green}"Creating ${SUCCESS_LOG}..."${r}
		touch ${SUCCESS_LOG}
	fi
	echo "$(date) - ${SUCCESS_STD1} ${SUCCESS_STD2}" >> ${SUCCESS_LOG}
	echo ${SUCCESS_CLI1} ${SUCCESS_CLI2}
}

historyFunction(){
	# historyFunction "A Meaningful History Message"
	historySTD1=$(grep -n -r "$1" ${BRAIN_PATH} | head -n 1)
	historySTD2=$2
	if [[ ! -f ${HISTORY_LOG} ]]; then
		echo ${green}"Creating ${HISTORY_LOG}..."${r}
		touch ${HISTORY_LOG}
	fi
	echo "$(date) - ${historySTD1} ${historySTD2}" >> ${HISTORY_LOG}
}
