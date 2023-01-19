#! /bin/bash


echo "-----------------------------------"

WORKDIR=$(pwd)
ENV_NAME=random
RED=$(tput setaf 1)
GREEN=$(tput setaf 2 ) 
RESET=$(tput sgr0 )
BLUE=$(tput setab 4)
BOLD=$(tput bold)
YELLOW=$(tput setaf 3)






setupvenv(){
    EMPTY=$1
    if [ $1 = "empty" ]
    then 
        echo "${BLUE}Creating your environment${RESET}"
        python3 -m venv $ENV_NAME
        if [ ! $? -ne 0 ]
        then
            echo "${BOLD}${GREEN}[/] Done! Virtual environemnt created${RESET} in $WORKDIR "
            echo "Run ${BLUE}source $ENV_NAME/bin/activate${RESET} to activate "
            exit 0
        else
            echo "Problem creating virtual enviroment"
            exit 1
        fi
    else
        echo "${GREECreating your environment${RESET}"
        python3 -m venv $ENV_NAME
        echo "downloading and installing dependencies..."
        source $ENV_NAME/bin/activate
        
        python3 -m pip install --upgrade pip
        pip install -r template.txt

        echo "${BOLD}${GREEN}[/] Done! Virtual environemnt created${RESET} in $WORKDIR "
        echo "Run ${BLUE}source $ENV_NAME/bin/activate${RESET} to activate "
        exit 0
    fi      
}








check_template_file_presence(){
if [ -f "template.txt" ]
then
    echo "${BOLD}${GREEN}[/]template file recognized...${RESET}"
    if [ ! -s "$(pwd)/template.txt" ]
    then
        echo "${YELLOW}[>]${RESET}template file is empty"
        echo "${YELLOW}[>]${RESET} No packages will be installed in virtual environment }"
        
        setupvenv "empty"
    else
        echo "[+]Dependencies that will be installed into virtual environment"
        for package in $( cat template.txt)
        do
            echo "${BLUE} $package ${RESET}"
        done
        setupvenv "notempty"
    fi   





else
    echo "no template file detected and no argument provided"
    echo "${YELLOW}[>]${RESET} No packages will be installed in virtual environment }"
    read -p  "${YELLOW}[>]${RESET}${YELLOW}Do you wish to continue(y/n)?: ${RESET}" ANS
    echo "virtual environment will be created without any pre installed dependencies"
    read ans
    
    case $ANS in 
        [yY]|[yY][eE][sS])
            echo " you typed yes"
            setupvenv "empty"
            ;;
        [nN]|[nN][oO])
            echo "${YELLOW}[-]${RESET}${BOLD}${RED}ABORTED${RESET}"
            ;;
        *)
            echo "invalid input"
            exit 0
    esac
fi

}





check_template_file_presence


