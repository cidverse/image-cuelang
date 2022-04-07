# syntax=docker/dockerfile:1.4

# base image
FROM ghcr.io/cidverse/image-base:main

# just for testing
ENV CUE_VERSION=v0.4.2 \
    BUILD_OS=linux \
    ABUILD_ARCH=amd64

# install
RUN --mount=type=cache,target=/var/cache \
    do-download "https://github.com/cue-lang/cue/releases/download/${CUE_VERSION}/cue_${CUE_VERSION}_${BUILD_OS}_${ABUILD_ARCH}.tar.gz" "$CACHE_DOWNLOAD/${CUE_VERSION}_${BUILD_OS}_${ABUILD_ARCH}.tar.gz" &&\
    do-untar "$CACHE_DOWNLOAD/${CUE_VERSION}_${BUILD_OS}_${ABUILD_ARCH}.tar.gz" "$CACHE_EXTRACT/${CUE_VERSION}_${BUILD_OS}_${ABUILD_ARCH}" &&\
    cp "$CACHE_EXTRACT/${CUE_VERSION}_${BUILD_OS}_${ABUILD_ARCH}/cue" "/usr/local/bin/cue" &&\
    chmod 755 /usr/local/bin/cue

# permissions
USER 1001
