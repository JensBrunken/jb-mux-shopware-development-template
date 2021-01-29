#!/usr/bin/env bash
#DESCRIPTION: import all files from the integration to the local environment @All not use this with production server

#### create dump on integration ####
sh ./__MUX_SCRIPT_DIR__/tools/createdump.sh __INTEGRATION_SSH_USER__ __INTEGRATION_SSH_HOST__ __INTEGRATION_PATH__ __INTEGRATION_DB_HOST__ __INTEGRATION_DB_USER__ __INTEGRATION_DB_PASSWORD__ __INTEGRATION_DB_NAME__ __MUX_DUMP_FILE__

#### get dump from integration ####
## next_release_1_1 move to scripts/tools
scp -r __MUX_SSH_USER__@__INTEGRATION_SSH_HOST__:__INTEGRATION_PATH__/__MUX_DUMP_FILE__ __MUX_IMPORT_DIR__

#### all plugins to the local environment #####
## next_release_1_2 move to scripts/tools
## next_release_1_2 with zip
scp -r __MUX_SSH_USER__@__INTEGRATION_SSH_HOST__:__INTEGRATION_PLUGIN_PATH__/* __MUX_PLUGIN_DIR__

#### all Images to the local environment ####
## but be careful. Images can be several gigabytes in size ##
## next_release_1_3 move to scripts/tools
## next_release_1_3 with zip
scp -r __MUX_SSH_USER__@__INTEGRATION_SSH_HOST__:__INTEGRATION_MEDIA_PATH__ __MUX_MEDIA_DIR__
scp -r __MUX_SSH_USER__@__INTEGRATION_SSH_HOST__:__INTEGRATION_THUMBNAIL_PATH__ __MUX_MEDIA_DIR__

#### import dump to the local environment and change domain to your local domain ####
## next_release_1_4 move to scripts/tools
gunzip < __MUX_IMPORT_DIR__/__MUX_DUMP_FILE__ | mysql -u__DB_USER__ -p__DB_PASSWORD__ __DB_NAME__
mysql -u'__DB_USER__' -p'__DB_PASSWORD__' __DB_NAME__ -e "UPDATE sales_channel_domain chg SET chg.url = REPLACE(chg.url, '__INTEGRATION_APP_URL__','__LOCAL_APP_URL__') WHERE chg.url REGEXP '__INTEGRATION_APP_URL__';"

#### build local environment ####
./psh.phar administration:build
./psh.phar storefront:build
#./psh.phar cache
## you want the hot-proxy on start remove # :-)
#./psh.phar storefront:hot-proxy


