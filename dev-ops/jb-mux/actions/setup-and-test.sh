#!/usr/bin/env bash
#DESCRIPTION: test the server connection, create dump, create gzip, ssh, sftp #next_release_1_6

## test the server connection
#sh ./__MUX_SCRIPT_DIR__/test/test-connection.sh __MUX_SSH_USER__ __INTEGRATION_SSH_HOST__
## test mkdir
sh ./__MUX_SCRIPT_DIR__/test/test-mkdir.sh __MUX_SSH_USER__ __INTEGRATION_SSH_HOST__ __INTEGRATION_PATH__
## test create file
#sh ./__MUX_SCRIPT_DIR__/test/test-createfile.sh __MUX_SSH_USER__ __INTEGRATION_SSH_HOST__ __INTEGRATION_PATH__ __MUX_TEST_FILE_TXT__
## test zip
#sh ./__MUX_SCRIPT_DIR__/test/test-zip.sh __MUX_SSH_USER__ __INTEGRATION_SSH_HOST__ __INTEGRATION_PATH__
