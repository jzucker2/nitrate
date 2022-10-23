ARG FILMSTOCK_VERSION=0.7.5
FROM ghcr.io/jzucker2/filmstock:${FILMSTOCK_VERSION} AS linux_base

FROM linux_base as linux_dependencies
# see more info in `notes/DOCKER.md`
RUN apt-get update -y && apt-get install -y \
        bluez \
        bluez-tools \
        bluetooth \
        dbus \
    && apt-get clean

FROM linux_dependencies AS python_dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

FROM python_dependencies as clean_up

# remove existing `requirements.txt` to prevent clashes
RUN rm requirements.txt

FROM clean_up AS test_build
COPY /scripts /nitrate/scripts
CMD ["sh", "nitrate/scripts/test.sh"]
