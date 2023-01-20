
<!-- ![logo](logo/genenv.png  "genenv logo") -->
<img src="logo/genenv.png " alt="logo" />

# GENENV
This command line utility tool allows you to create python virtual environements with already installed dependencies
you want easily!

## Features
- [x] You can create virtual environments with pre-installed packages that you specify in command line
- [x] Instead of providing package name on command line, you can add a `template.txt` file containing
names of packages you want intalled 
- [x] Install packages in already existing virtual environments without having to activate them
- [x] you can create virtual environments with no packages installed.


## How it works 
Essentially, the process of virtual environments creation and installation of packages is done in the bash script `.createnv.sh`.
The bash script is called as a subprocessin the python file.
`Click` is used to provide a CLI interface and collect arguments from the command line to pass into bash script when 
its being called.

## Usage

- Install with pip
```bash
pip install genenv
```

## NOTE:
1. if you specify package names on command line and template.txt file exits ,template.txt file will be ignored.
2. if no template.txt file or package name(s) are provided as on command line as arguments, you'll recieve prompt if you still
want to proceed to create virtual environment with no preinstalled dependencies.
3. To use contents of `template.txt` file , do not provide any package names after you specify environment name



### Creating a virtual environment with name `meseeks` with django and flask installed 
- specifying dependecies on command line
```bash
genv -n meseeks flask django
```


### Creating a virtual environment with name `meseeks` with dependencies specified in `template.txt` file
- create  a file with name  `template.txt` in same directory you will run command
- Add package names to it
```bash 
genv -n meseeks 
```
It detects and reads contents `template.txt` file
then installs package names specified inside.
If `template.txt` file is available and empty, environemnt is created with no installed dependencies.


### Installing dependecies/packages in already existing virtual environment
- specify the name option flag as the name of the environment  you want to install package in
- if you want to install numpy in an existing virtual environment called `pluto`
>make sure youre in directory that venv is located then run
```bash
 
genv -n pluto  numpy
```

- run `genenv --help` to bring up help menu

```
Usage: genenv [OPTIONS] [DEPENDENCIES]...

  specify package names after name flag to install them,read documentation for
  how that works

Options:
  -n, --name TEXT  provide name to be used for your virtual environment
                   [required]
  --help           Show this message and exit.
```


## Contributing
- Fork this repository to your GitHub account.
- Clone the forked repository to your local machine.
- Create a new branch for the feature you want to work on.
- Make your contributions.
- Push your local branch to your remote repository.
- Open a pull request to the develop branch of this repository.


### Setting up the tool for local development

- Clone this repository to your local machine.
- Create a virtual environment for your project and activate it. Install all dependencies from  requirements.txt file.

- In the root directory of the project, develop the project locally from the setup configuration.

```bash
python3 setup.py develop
```
- you can now run commands  using `genv`
