#!/bin/sh
case "$APTD__ENV" in
    "DEV") 
        python ./main.py ;;
    "TEST")
        python -m unittest discover -s ./src/tests/ ;;
    "PROD")
        echo "1\n${APTD__DATASOURCE}\n${APTD__DATASINK}\n" | python ./main.py ;;
    *) 
        echo "ERROR: environment variable 'APTD__ENV' is not set properly (value is '$APTD__ENV')!" ;;
esac
