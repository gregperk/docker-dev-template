
PWD := $(shell pwd)
IMAGENAME := $(shell basename $(PWD))
VSDATA := $(PWD)/vsdata
SRC := $(PWD)/src
BIN := ./bin
START := start

build: $(START)
	docker build -t $(IMAGENAME) .

$(START): Makefile
	echo docker run -p 8443:8443 \
	     -v $(VSDATA):/vsdata \
	     -v $(SRC):/src \
	     -v $(HOME)/.ssh:/root/.ssh \
	     -v $(HOME)/.profile:/root/.profile \
	     -v $(HOME)/.bashrc:/root/.bashrc \
	     -v $(HOME)/.bash_scripts:/root/.bash_scripts \
	     --rm -it $(IMAGENAME) '$$@' > $(START) \
	&& chmod +x $(START)

run: $(START)
	$(START)

clean:
	rm -f $(START)
	docker kill $(IMAGENAME) 2>/dev/null || exit 0
	docker rm -f $(IMAGENAME) 2>/dev/null || exit 0
	docker image rm -f $(IMAGENAME) 2>/dev/null || exit 0

default: build