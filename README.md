# IKATS gui

Front nginx server that handles the following roles:

* Reverse proxy to reach internal services (datamodel, pybase, opentsdb) from the GUI without exposing them
* Serve the GUI

## Docker image build

```bash
docker build . -t hub.ops.ikats.org/gui:latest
```

## Docker image run

The following variables must be set:

* `HOST`: server name to reach the GUI
* `TOMCAT_ADDR`: datamodel endpoint ip/name
* `TOMCAT_PORT`: datamodel endpoint port
* `GUNICORN_ADDR`: pybase endpoint ip/name
* `GUNICORN_PORT`: pybase endpoint port
* `TOMEE_ADDR`: ingestion endpoint ip/name
* `TOMEE_PORT`: ingestion endpoint port
* `OPENTSDB_ADDR`: timeseries database endpoint ip/name
* `OPENTSDB_PORT`: timeseries database endpoint port

```bash
docker run -it -d \
  -e "HOST=${HOST}" \
  -e "TOMCAT_ADDR=${TOMCAT_ADDR}" \
  -e "TOMCAT_PORT=${TOMCAT_PORT}" \
  -e "GUNICORN_ADDR=${GUNICORN_ADDR}" \
  -e "GUNICORN_PORT=${GUNICORN_PORT}" \
  -e "TOMEE_ADDR=${TOMEE_ADDR}" \
  -e "TOMEE_PORT=${TOMEE_PORT}" \
  -e "OPENTSDB_ADDR=${OPENTSDB_ADDR}" \
  -e "OPENTSDB_PORT=${OPENTSDB_PORT}" \
  hub.ops.ikats.org/gui:latest
```