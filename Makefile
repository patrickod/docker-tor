image_tor := patrickod/tor

.PHONY: start stop run build tor

start:
	docker start tor

stop:
	docker stop tor

run: tor

## Example. Adopt it to your needs.
# 9001 is the OR port. You might want to change this to something more common like 443.
# See https://www.torproject.org/docs/tor-doc-relay.html.en
# To have the correct timezone in your docker container, you might want to change the TZ environment variable.

tor:
	-@docker rm -f "$@"
	docker run -d \
		--name "$@" \
		-e "TZ=Europe/Berlin" \
		-p 9001:9001 \
		$(image_tor)

build:
	docker build --no-cache --tag $(image_tor) .
	# docker build --tag $(image_tor) .
