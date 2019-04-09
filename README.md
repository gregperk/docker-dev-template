#### Hat Tips

This was adapted from [caesarnine's template](https://github.com/caesarnine/data-science-docker-vscode-template), leaning on the fantastic work of [Coder](https://github.com/codercom/code-server).

#### How to Use

Clone this repo and rename the resulting folder to be your project name. 

Adjust the base image and dependencies in the `Dockerfile` as needed for what you're trying to do.

If you renamed the folder to `myfoo`, you could then `make build` to build the 
image, `make clean` to kill any running containers and clean everything up,
and `make run` or just use `./start [optional command]` to spin up the container.

The VSCode server will then be reachable at: http://localhost:8443

#### VSCode Extensions and Configuration

You can install any extension and modify configuration like you would locally. 
Any extensions you install and global configuration you update will persist 
in the `./vsdata` folder so you don't have to redo it every time you restart the 
container.  By default VSCode will start up with the `./src` folder as the 
workspace, which you can change by modifying the `docker-entrypoint.sh` file.

You can pretty much VSCode as you would locally, doing things like starting 
up terminals, setting Python formatters/linters, and so on.
