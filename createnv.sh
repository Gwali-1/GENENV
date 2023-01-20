#! /bin/bash


echo "-----------------------------------"

WORKDIR=$(pwd)
ENV_NAME=random # argument
ARGUMENTS=${@:2}
RED=$(tput setaf 1)
GREEN=$(tput setaf 2 ) 
RESET=$(tput sgr0 )
BLUE=$(tput setab 4)
BOLD=$(tput bold)
YELLOW=$(tput setaf 3)
TEMPLATE_FILE="template.txt"



#if args are provided


check_for_dependency_arguements(){
if [ !  -z "$ARGUMENTS" ]
then
    if [ -d $ENV_NAME ]
    then
        cd $ENV_NAME
        if [ -d "bin" ]
        then
            echo "${BOLD}${YELLOW}Virtual environment with name ${GREEN}($ENV_NAME)${RESET} ${YELLOW}already exit in location${RESET}"
            source bin/activate
            echo "${Green}Installing package(s)"
            for arg in $ARGUMENTS
            do
                pip install $arg
            done
            cd ..
            echo "${BOLD}${GREEN}[/] Done! Virtual environemnt created${RESET} in $WORKDIR "
            echo "Run ${BLUE}source $ENV_NAME/bin/activate${RESET} to activate "
            exit 0
        else
            echo "${BOLD}${YELLOW}[>]Directory with name ${GREEN}($ENV_NAME)${RESET} ${YELLOW}already exit in location${RESET}"
            echo "${BOLD}${YELLOW}[>]Specify a different name for virtual environment${RESET}"
            exit 0
        fi
                  
    else
        echo "${BLUE}Creating your environment${RESET}"
        python3 -m venv $ENV_NAME
        source $ENV_NAME/bin/activate
        echo "${BOLD}${GREEN}[/] Trying to update pip ${RESET}"
        pip install --upgrade pip
        if [ ! $? -ne 0 ]
        then
            for arg in $ARGUMENTS
            do
                pip install $arg
            done

            echo "${BOLD}${GREEN}[/] Done! Virtual environemnt created!${RESET} in $WORKDIR "
            echo "Run ${BLUE}source $ENV_NAME/bin/activate${RESET} to activate "
            exit 0
        else
            echo "${BOLD}${YELLOW}Problem creating virtual enviroment${RESET}"
            exit 1
        fi
    fi
          
fi

}





check_if_env_exit(){
if [ -d $ENV_NAME ]
then
    cd $ENV_NAME
    if [ -d "bin" ]
    then
        echo "${BOLD}${YELLOW}Virtual environment with name ${GREEN}($ENV_NAME)${RESET} ${YELLOW}already exit in location${RESET}"
        echo "Run ${BLUE}source $ENV_NAME/bin/activate${RESET} to activate "
        exit 0
    else
        echo "${BOLD}${YELLOW}[>]Directory with name ${GREEN}($ENV_NAME)${RESET} ${YELLOW}already exit in location${RESET}"
        echo "${BOLD}${YELLOW}[>]Specify a different name ${RESET}"
        exit 0
    fi
    
fi

}



setupvenv(){
    EMPTY=$1
    if [ $1 = "empty" ]
    then 
        echo "${BLUE}Creating your environment${RESET}"
        python3 -m venv $ENV_NAME
        source $ENV_NAME/bin/activate
        echo "${BOLD}${GREEN}[/] Trying to update pip ${RESET}"
        pip install --upgrade pip

        if [ ! $? -ne 0 ]
        then
            echo "${BOLD}${GREEN}[/] Done! Virtual environemnt created!${RESET} in $WORKDIR "
            echo "${BOLD}${GREEN}[/] No dependencies where installed"
    
    

            echo "Run ${BLUE}source $ENV_NAME/bin/activate${RESET} to activate "
            exit 0
        else
            echo "Problem creating virtual enviroment"
            exit 1
        fi
    else
        echo "${GREEN}Creating your environment${RESET}"
        python3 -m venv $ENV_NAME
        source $ENV_NAME/bin/activate
        echo "${BOLD}${GREEN}[/] Trying to update pip ${RESET}"
        python3 -m pip install --upgrade pip

        echo "${BOLD}${GREEN}[/] downloading and installing dependencies...${RESET}"
        pip install -r $TEMPLATE_FILE

        pip freeze >>  requirements.txt

        echo "${BOLD}${GREEN}[/] Done! Virtual environemnt created${RESET} in $WORKDIR "
        echo "Run ${BLUE}source $ENV_NAME/bin/activate${RESET} to activate "
        exit 0
    fi      
}








check_template_file_presence(){

if [ -f "$TEMPLATE_FILE" ]
then
    echo "${BOLD}${GREEN}[/]template file recognized...${RESET}"
    if [ ! -s "$(pwd)/$TEMPLATE_FILE" ]
    then
        echo "${YELLOW}[>]template file is empty${RESET}"
        echo "${YELLOW}[>]No packages will be installed in virtual environment ${RESET}"
        setupvenv "empty"
     
    else
        echo "[+]Dependencies that will be installed into virtual environment"
        for package in $( cat $TEMPLATE_FILE)
        do
            echo "${BLUE} $package ${RESET}"
        done
        setupvenv "notempty"
    fi   





else
    echo "${BOLD}${YELLOW}You did not provide a template file nor dependencies as arguments"
    echo "${YELLOW}[>]${RESET}${BOLD}${RED}No packages will be installed in virtual environment}${RESET}"
    read -p  "${YELLOW}[>]${RESET}${YELLOW}${BOLD}Do you wish to continue(y/n)?: ${RESET}" ANS
    
    case $ANS in 
        [yY]|[yY][eE][sS])
            setupvenv "empty"
            ;;
        [nN]|[nN][oO])
            echo "${YELLOW}[-]${RESET}${BOLD}${RED}ABORTED${RESET}"
            ;;
        *)
            echo "${YELLOW}${BOLD}INVALID INPUT${RESET}"
            echo "${YELLOW}[-]${RESET}${BOLD}${RED}ABORTED${RESET}"
            exit 0
    esac
fi

}



check_for_dependency_arguements #>
check_if_env_exit #>
check_template_file_presence #>


