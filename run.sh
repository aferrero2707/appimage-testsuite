#! /bin/bash

ai="$1"
distro="$2"




IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $IP

if [ -e Dockerfile.${distro} ]; then
	(rm -rf build && mkdir build && cd build && cp -aL ../Dockerfile.${distro} Dockerfile && \
docker build -t photoflow/aitest-${distro} .) || exit 1
	image=photoflow/aitest-${distro}
else
	image=$distro
fi

docker run --rm -it -e DISPLAY=${IP}:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/aitest -v "$ai":/AppImage --cap-add=SYS_PTRACE --security-opt seccomp:unconfined ${image} bash

exit 0


rm -rf aitest
if [ "$distro" = "debian-testing" ]; then
	mkdir -p aitest
	cp -a aitest-debian-testing.sh aitest/aitest.sh
	cd aitest
	docker run --rm -it -e DISPLAY=${IP}:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/aitest -v "$ai":/AppImage debian:testing
	exit
fi

if [ "$distro" = "fedora-26" ]; then
	mkdir -p aitest
	cp -aL aitest-fedora-26.sh aitest/aitest.sh
	cd aitest
	docker run --rm -it -e DISPLAY=${IP}:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/aitest -v "$ai":/AppImage fedora:26 bash
fi

if [ "$distro" = "fedora-27" ]; then
	mkdir -p aitest
	cp -aL aitest-fedora-27.sh aitest/aitest.sh
	cd aitest
	docker run --rm -it -e DISPLAY=${IP}:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/aitest -v "$ai":/AppImage photoflow/aitest-${distro} bash
fi
