HOST ?= 127.0.0.1

build: clean
	hugo

clean:
	rm -rf public/

deploy: build
	npx wrangler deploy

server:
	hugo server --baseURL http://$(HOST):1313 --bind $(HOST) --disableFastRender

staging: build
	npx wrangler versions upload --preview-alias staging
