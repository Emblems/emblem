#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
    emblem.main
    -----------

    This is a Flask application that runs the server for Emblem. It's designed
    to be light-weight and to minimize the pain of setup. It should run easily
    on any Unix-enabled system.

    :copyright: (c) 2014 by Ankit Ranjan.
    :license: MIT, see LICENSE for more details.
"""

from flask import Flask
from flask import render_template

import logging


### Setup Logging ###

# logging.basicConfig(level=logging.INFO)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')

# Main Log
log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)

# Create debug.log handler
debug_handler = logging.FileHandler('logs/debug.log')
debug_handler.setLevel(logging.DEBUG)
debug_handler.setFormatter(formatter)

# Create info.log handler
info_handler = logging.FileHandler('logs/info.log')
info_handler.setLevel(logging.INFO)
info_handler.setFormatter(formatter)

# Create warning.log handler
# warning.log logs everything logging.ERROR and up.
warning_handler = logging.FileHandler('logs/warning.log')
warning_handler.setLevel(logging.WARNING)
warning_handler.setFormatter(formatter)

# Create error.log handler
# error.log logs everything logging.ERROR and up.
error_handler = logging.FileHandler('logs/error.log')
error_handler.setLevel(logging.ERROR)
error_handler.setFormatter(formatter)

# Create critical.log handler
# critical.log logs everything logging.ERROR and up.
critical_handler = logging.FileHandler('logs/critical.log')
critical_handler.setLevel(logging.ERROR)
critical_handler.setFormatter(formatter)

# Add handlers
log.addHandler(info_handler)
log.addHandler(debug_handler)
log.addHandler(warning_handler)
log.addHandler(error_handler)
log.addHandler(critical_handler)


### Setup App ###
app = Flask(__name__, static_url_path='')

@app.route('/')
def main():
    """The landing page for the Emblem site."""
    return render_template('index.html')

if __name__ == '__main__':
    log.info('Running Emblem server.')
    # Debug is on for local testing.
    app.debug = True
    app.run(host='0.0.0.0')