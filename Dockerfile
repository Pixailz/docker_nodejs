ARG					TAG=edge

FROM				alpine:${TAG} AS base

RUN					apk add --upgrade --progress --virtual dependencies \
						nodejs \
						npm \
					&& rm -f /var/cache/apk/*

#=#=#

FROM				base AS packed

COPY				--chown=root:root --chmod=755 entrypoint /run

STOPSIGNAL			SIGINT

WORKDIR				/src/project

ENV					NJCLITOOL=""
ENV					NJRUNCMD=""
ENV					DOCKER_DEBUG=""

ENTRYPOINT	[ "/run/entrypoint" ]
