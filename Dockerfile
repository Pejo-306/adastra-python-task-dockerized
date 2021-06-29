# Base image: Python 3.8 interpreter with slim buster linux
FROM python:3.8-slim

WORKDIR /usr/src/app

# Install Python dependancies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Environment variables
## default data source is 'Simulation'
ENV APTD__DATASOURCE="1"
## default data sink is 'Console' with the following format
ENV APTD__DATASINK="1\n(console)::key: {} | value: {} | ts: {}"

# Copy source code into the container
COPY ./src/ ./src/
COPY ./main.py ./main.py
COPY ./database.env ./database.env

# Prepare script input and
# launch application with prepared input
CMD echo "1\n${APTD__DATASOURCE}\n${APTD__DATASINK}\n" | python ./main.py
