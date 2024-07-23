HOST ?= 127.0.0.1

build:
	hugo

clean:
	rm -rf public/

server:
	hugo server --baseURL http://$(HOST):1313 --bind $(HOST)
