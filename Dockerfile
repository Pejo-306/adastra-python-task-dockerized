# Base image: Python 3.8 interpreter with slim buster linux
FROM python:3.8-slim

WORKDIR /usr/src/app

# Install Python dependancies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Environment variables
## Runtime environment - DEV, TEST or PROD; MUST be set at runtime
ENV APTD__ENV=NONE
## default data source is 'Simulation'
ENV APTD__DATASOURCE="1"
## default data sink is 'Console' with the following format
ENV APTD__DATASINK="1\n(console)::key: {} | value: {} | ts: {}"

# Copy source code into the container
COPY ./docker-entrypoint.sh ./docker-entrypoint.sh
COPY ./input_files ./input_files
COPY ./database.env ./database.env
COPY ./src/ ./src/
COPY ./main.py ./main.py

# Launch application entrypoint
ENTRYPOINT ["./docker-entrypoint.sh"]
