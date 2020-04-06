#!/bin/bash

if [ -z $1 ]
then
	echo " Use: ./code.sh [project_name]"
	exit
fi

## 1̣° create the project's directory
echo -e '\033[33;1m --------------------------  Creating Project Directory  ------------------ \033[m'
mkdir $1
cd $1
echo -e ' \033[32;1m The project directory is: '$(pwd)' '

## 2° create virtual enviroment 
echo -e '\033[33;1m --------------------------  Creating Virtual Enviroment  ----------------- \033[m'
python3 -m venv venv
source venv/bin/activate
if [ $? = 0 ]
then
	echo " Virtual Enviroment has been created!"
fi

## 3° install pip and Django

echo -e '\033[33;1m --------------------------  Installing Pip and Django  ------------------- \033[m'
python -m pip install --upgrade pip &>/dev/null
pip install django &>/dev/null
if [ $? = 0 ]
then
	echo " Django was installed successfully!"
fi

echo -e '\033[33;1m --------------------------  Starting Project  ---------------------------- \033[m'
django-admin startproject $1 .
if [ $? = 0 ]
then
	echo " The project '$1' has been created!"
fi

echo -e '\033[33;1m --------------------------  First Migration  ----------------------------- \033[m'
python manage.py migrate

## 4° create the requirements.txt file and install
echo -e '\033[33;1m --------------------------  Installing Requirements  --------------------- \033[m'
echo " Any requirement, type here: (press enter to ignore) "
read REQUIREMENT
echo " $REQUIREMENT " >>  requirements.txt
pip install -r requirements.txt
## TODO: offer a list of requirements

## 5° create superuser for DB
echo -e '\033[33;1m --------------------------  Creating Superuser of Data Base  ------------- \033[m'
python manage.py createsuperuser

## 6° create first App
echo -e '\033[33;1m --------------------------  Creating firts App --------------------------- \033[m'
echo " To create the first app, type here its name or press Enter to ignore: "
read CREATEAPP
python manage.py startapp ${CREATEAPP} &>/dev/null

if [ $? = 0 ]
then
	echo " The App '$CREATEAPP'  was created successfully!"
fi
echo
echo
echo -e '\033[33;1m Your project is ready to launch!  \033[m'
echo -e '\033[33;1m  Test in your browser!  \033[m'
echo
echo
python manage.py runserver

