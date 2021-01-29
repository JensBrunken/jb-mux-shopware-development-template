## Install 

### .psh.yaml.override
Add this block, to the ".psh.yaml.override" file on your local development environment 
```
  LOCAL_APP_URL: ""
  INTEGRATION_APP_URL: ""
  INTEGRATION_SSH_HOST: ""
  INTEGRATION_SSH_USER: ""
  INTEGRATION_DB_HOST: "localhost"
  INTEGRATION_DB_PORT: "3306"
  INTEGRATION_DB_NAME: ""
  INTEGRATION_DB_USER: ""
  INTEGRATION_DB_PASSWORD: ""
  INTEGRATION_PATH: "jb-mux"
  INTEGRATION_PLUGIN_PATH: "custom/plugins"
  INTEGRATION_MEDIA_PATH: "public/media"
  INTEGRATION_THUMBNAIL_PATH: "public/thumbnail"
```

#### Settings .psh.yaml.override:
Add the development environment Domain or ip address
This is for to change after import the domain in table 
```
  LOCAL_APP_URL: "192.168.77.9"
  LOCAL_APP_URL: "shopware.local"
```
 
This is for the Domain at the DB-Dump or ip address
is for to replace with "LOCAL_APP_URL"
```
  INTEGRATION_APP_URL: "192.168.77.8"
  INTEGRATION_APP_URL: "integration.shopware.local"
```

This is for the Domain to connect the integration server or use ip address
```
  INTEGRATION_SSH_HOST: "192.168.77.8"
  INTEGRATION_SSH_HOST: "integration.shopware.local"
```
your ssh user to connect the integration 
```
  INTEGRATION_SSH_USER: ""
```
DB host
```
  INTEGRATION_DB_HOST: "localhost"
```
DB port
```
  INTEGRATION_DB_PORT: "3306"
```
DB database name
```
  INTEGRATION_DB_NAME: ""
```
DB database user
```
  INTEGRATION_DB_USER: ""
```
DB database password
```
  INTEGRATION_DB_PASSWORD: ""
```
this is the folder on integration server at this folder is later the dump file
```
  INTEGRATION_PATH: "jb-mux"
```
this is the folder on integration server for the plugin folder 
```
  INTEGRATION_PLUGIN_PATH: "var/www/shopware/custom/plugins"
```
this is the folder on integration server for media
```
  INTEGRATION_MEDIA_PATH: "var/www/shopware/public/media"
```
this is the folder on integration server for the thumbnail
```
  INTEGRATION_THUMBNAIL_PATH: "var/www/shopware/public/thumbnail"
```

### .psh.yaml.dist
Add this block, to the ".psh.yaml.dist" file on your local development environment 
```
 jb-mux:
  const:
    MUX_SSH_USER: ""
    MUX_SSH_HOST: ""
    MUX_DIR: "dev-ops/jb-mux"
    MUX_SCRIPT_DIR: "dev-ops/jb-mux/scripts"
    MUX_IMPORT_DIR: "dev-ops/jb-mux/import"
    MUX_PLUGIN_DIR: "custom/plugins"
    MUX_MEDIA_DIR: "public"
    MUX_DUMP_FILE: "muxdump.sql.gz"
    MUX_TEST_FILE_TXT: "mux-test-ssh.txt"
    MUX_TEST_FILE_GZIP: "mux-test-ssh.gzip"
  paths:
    - "dev-ops/jb-mux/actions"
```

#### Settings .psh.yaml.dist:
add your ssh user 
```
MUX_SSH_USER: "vagrant"
```
only when this is needed
```
MUX_SSH_HOST: ""
```
Copy the .psh.yaml.dist .psh.yaml.override and the jb-mux under dev-ops directory 
to your local development environment 

you have saved your in the authorized_keys file on the integration server?
copy your private key "id_rsa" to your local development environment under /home/user/.ssh

* [readme_use jb-mux](usejbmuxthis.md)
 