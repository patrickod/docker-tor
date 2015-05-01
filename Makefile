image_tor := patrickod/tor

.PHONY: start stop run build tor

start:
	docker start tor

stop:
	docker stop tor

run: tor

tor:
	-@docker rm -f "$@"
	docker run -d \
		--name "$@" \
		-e "TZ=Europe/Berlin" \
		-p 993:993 \
		-p 465:465 \
		$(image_tor)

build:
	docker build --no-cache --tag $(image_tor) .
	# docker build --tag $(image_tor) .
