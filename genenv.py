import subprocess
import click

script ="createnv.sh"
# test = subprocess.run(["./createnv.sh","name",],check=True)
# print(test.returncode)
# print(test.args)
@click.command()
@click.option("--name", "-n", "name", required=True ,help="provide name to be used for your virtual environment")
@click.argument("dependencies", nargs=-1 )
def cli(name,dependencies):
    """
    specify package names after name flag to install them,read documentation for how that works
    """
    if not dependencies:
        commands = ["bash",script, name]
        try:
             process = subprocess.run(commands)
             if process.returncode == 0:
                exit(0)
        except Exception as e:
            click.echo(e)

    commands = list(dependencies)
    commands.insert(0,name)
    commands.insert(0,script)
    commands.insert(0,"bash")
    try:
        process = subprocess.run(commands)
    except Exception as e:
        click.echo(e)
    

