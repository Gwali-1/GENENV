import subprocess
import click

script ="./createnv.sh"
# test = subprocess.run(["./createnv.sh","name",],check=True)
# print(test.returncode)
# print(test.args)
@click.command()
@click.option("--name", "-n", "name", required=True ,help="provide name to be used for your virtual environment")
@click.argument("dependecies", nargs=-1)
def genenv(name,dependecies):
    if not dependecies:
        print("none provided")
        commands = [script, name]
        try:
             process = subprocess.run(commands)
             if process.returncode == 0:
                print("success")
                print(process.stderr)
                exit(0)
        except Exception as e:
            click.echo(e)

    commands = list(dependecies)
    commands.insert(0,name)
    commands.insert(0,script)
    try:
        process = subprocess.run(commands)
    except Exception as e:
        click.echo(e)
    # print(*dependecies)
    



if __name__ == "__main__":
    genenv()