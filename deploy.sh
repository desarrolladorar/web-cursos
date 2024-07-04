#!/bin/bash

# Configuración del servidor FTP
HOST='201.148.107.213'
USER='senxuzia'
PASS='J1T32U@Fv.1und'
REMOTE_DIR='/public_html'

# Directorio local de tu proyecto
LOCAL_DIR=$(pwd)

# Cambia permisos localmente
find $LOCAL_DIR -type d -exec chmod 755 {} \;
find $LOCAL_DIR -type f -exec chmod 644 {} \;

# Sincroniza los archivos usando lftp
lftp -f "
set ssl:verify-certificate no
open $HOST
user $USER $PASS
mirror --reverse --delete --verbose --exclude .git --exclude deploy.sh $LOCAL_DIR $REMOTE_DIR
bye
"
