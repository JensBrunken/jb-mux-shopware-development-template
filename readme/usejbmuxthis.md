## Use the Script

have you adapted all files and copied them to your local development environment?
Then you can now connect via ssh and switch to your webroot. use ./psh.phar here

there are now three new commands available to you

 - jb-mux:run
 - jb-mux:setup-and-test
 - jb-mux:update

ok first please 
```
./psh.phar jb-mux:setup-and-test
```
The command create a transfer directory on the integration
you only need to execute this command once. then never again :-)

then are your finished, you can do
```
./psh.phar jb-mux:run 
```
The command fetches all necessary files from the integration
 
 - Plugins 
 - Media
 - Thumbnails 
 - a mysqldump   
 
and imports everything into your locale development environment

After the import, the sales channel domain will be exchanged and the administration and storefront will be rebuilt

Open development environment in your Browser 

```
./psh.phar jb-mux:update
```
comming soon on next_release_2_0