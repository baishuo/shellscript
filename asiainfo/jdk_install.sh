 cd ~/download;
 wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com"\
    "http://download.oracle.com/otn-pub/java/jdk/7/jdk-7-linux-x64.tar.gz";

mv jdk-7-linux-x64.tar.gz* jdk-7-linux-x64.tar.gz;
    cd ..;
    
~/bin/deploy.sh download ~/ all 

./runRemoteCmd.sh "
    mkdir app;\ 
    cd download;\
    tar -xvzf jdk-7-linux-x64.tar.gz -C ../app/ \
" all 
