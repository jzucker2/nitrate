# Examples

A sample `Dockerfile` below:

```
ARG NITRATE_VERSION=0.2.0
FROM ghcr.io/jzucker2/nitrate:${NITRATE_VERSION} AS linux_base

FROM linux_base AS python_dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

FROM python_dependencies AS source_code
COPY /demo /demo
WORKDIR /demo

ENV FLASK_APP=app

FROM source_code AS db_setup
RUN ["flask", "db", "upgrade"]

FROM db_setup AS seed_initial_data
RUN ["python", "seed_initial_data.py"]

FROM seed_initial_data AS run_server
# can use `run_dev.sh` or `run_prod.sh`
CMD ["sh", "run_dev.sh"]
```

## Dependencies

This project's `requirements.txt` only covers the _added_ 
dependencies from [filmstock](https://github.com/jzucker2/filmstock)

For an example of dependencies for a Bluetooth Classic project, see `bt-requirements.txt`

For an example of dependencies for a BLE project, see `ble-requirements.txt`

Note: both dependencies are tracked and installed into base image here.
