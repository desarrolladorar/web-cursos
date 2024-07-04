#!/bin/bash

# Configuración del servidor FTP
HOST='201.148.107.213'
USER='senxuzia'
PASS='J1T32U@Fv.1und'
REMOTE_DIR='/public_html'

# Directorio local de tu proyecto
LOCAL_DIR=$(pwd)

# Sincroniza los archivos usando lftp
lftp -f "
set ssl:verify-certificate no
open $HOST
user $USER $PASS
mirror --reverse --delete --verbose --exclude .git --exclude deploy.sh $LOCAL_DIR $REMOTE_DIR
chmod -R 755 $REMOTE_DIR
find $REMOTE_DIR -type f -exec chmod 644 {} \;
bye
"
