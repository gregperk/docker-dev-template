#### Hat Tips

This was adapted from [caesarnine's template](https://github.com/caesarnine/data-science-docker-vscode-template), leaning on the fantastic work of [Coder](https://github.com/codercom/code-server).

#### How to Use

Clone this repo and rename the resulting folder to be your project name. 

Adjust the base image and dependencies in the `Dockerfile` as needed for what you're trying to do.

If you renamed the folder to `foo`, you would then run the following:

```
cd foo
docker build -t foo .
docker run -p 8443:8443 -v $(pwd)/data:/data -v $(pwd)/code:/code --rm -it foo
```

This will spin up the container, 
starting VSCode as a server reachable at: http://localhost:8443

#### VSCode Extensions and Configuration

You can install any extension and modify configuration like you would locally. 
Any extensions you install and global configuration you update will persist 
in the `./data` folder so you don't have to redo it every time you restart the 
container.  By default VSCode will start up with the `./code` folder as the 
workspace, which you can change by modifying the `docker-entrypoint.sh` file.

You can pretty much VSCode as you would locally, doing things like starting 
up terminals, setting Python formatters/linters, and so on.
