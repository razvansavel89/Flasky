#!/bin/bash

export FLASK_APP=demo_app

if [ ! -e instance/demo_app.sqlite ]; then
    flask init-db
fi
flask init-db
flask run -h 0.0.0.0