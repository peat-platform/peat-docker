#!/bin/bash

redis-server &
node /openi-auth-dialogs/bin/www
