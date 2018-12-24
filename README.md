### How it works

This repository provides a set of scripts that allows to test AppImage packages using minimal Docker containers.

The docker container is started by running the following command:
```
./run.sh path_to_appimage container_tag
```

The script will compile and execute the container using the Dockerfile with the "container_tag" prefix, giving the user a bash command prompt.
The AppImage package can then be run with the following script from the docker prompt:
```
/aitest/aitest.sh
```

The script extracts the AppImage using bsdtar and then invokes the AppRun executable.

In order to allow the execution of graphical programs, you might have to modify the line in run.sh that automatically determines the IP address of the host machine.

Currently, the following containers are supported:
* Fedora 26 and 27
* Ubuntu 14.04, 16.04 and 18.04
* Debian stable and testing
