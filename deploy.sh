#!/usr/bin/env sh

ssh sabber mkdir -p /var/www/html/dofunao.jonasgroeger.de
rsync -avh --delete \
    dist/ \
    sabber:/var/www/html/dofunao.jonasgroeger.de

