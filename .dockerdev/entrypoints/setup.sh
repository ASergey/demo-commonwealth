#!/bin/sh

# Install dependencies
bundle install

# Create the db, tables and seed with data
rails db:prepare
