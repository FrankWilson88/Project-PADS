#!/use/bin/bash

greeting(){
	array[0]="	What's up, $(whoami)?"
	array[1]="	What's going on with you, $(whoami)?"
	array[2]="	How ya' doin', $(whoami)?"
	array[3]="	Herro Big Boi!"
	array[4]="	Hi I'm PADS! I'm your personal assistant, as you work on this here fine machine!"

	size=${#array[@]}
	index=$(($RANDOM % $size))
	echo ${array[$index]}
}

djangoGreeting(){
	array[0]="Here we go!"
	array[1]="Starting your Django App..."
	array[2]="Let's do this!"
	array[3]="I'm starting your program, $(whoami)..."

	size=${#array[@]}
	index=$(($RANDOM % $size))
	echo ${array[$index]}
}

error(){
	array[0]=${red}"See: pads -h for help"${r}
	array[1]=${red}"I can't understand you..."${r}
	array[2]=${red}"Do what?"${r}
	array[3]=${red}"I don't know what you mean, $(whoami)..."${r}
  array[4]=${red}"I'm...too stupid for you..."${r}
  array[5]=${red}"Error Code: K18"${r}

	size=${#array[@]}
	index=$(($RANDOM % $size))
	echo ${array[$index]}
}