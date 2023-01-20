# GENENV
This  command line utility tool allows you to create python virtual environements with already installed dependencies
you want easily!

## Features
- [x]you can create virtual environments with pre-installed packages that you specify in command line
- [x] Instead of providing package name on command line , you can add a `template.txt` file containing
names of packages you want intalled 
- [x] install packages in already existing virtual environments without having to activate them
- [x] you can create virtual environments with no packages installed 


## How it works 
Essentially , the process of virtual environments creatio and installation is done bya bash script
The bash script is called as a subproces in the python file
Click is used to provide a CLI interface  and collect arguments from the command line to pass into sbash script when 
its being called

## Usage

- Install with pip
```bash
pip install genenv
```

### creating a virtual environment with name `meseeks` with django and flask installed 
- specifying dependecies on command line
```bash
genv -n meseeks flask django
```


### creating a virtual environment with name `meseeks` with dependencies specified in `template.txt` file
> create template.txt file in same directory you will run command\n
> add package names to it
```bash 
genv -n meseeks f
```
it detects  and reads contents template.txt file
then installs names inside.
if temeplate.txt file is available and empty , environemnt is created with no installed dependencies


### installing dependecies/packages in already existing virtual environments
- specify the name option flag as the name of the environment  you want to install package in
- if you want to install numpy in an existing virtual environment called `pluto`
>make sure youre in directory that venv is located then run
```bash
 
genv -n pluto  numpy
```



# NOTE:
1. if you specify package names on command line and template.txt file exits ,  template.txt file will be ignored
2. if  No template.tx file or package names are provided as on command line as arguments , youll recieve prompt if you still
want to proceed to create virtual environment with no preinstalled dependencies.

