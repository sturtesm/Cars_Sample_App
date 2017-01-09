#!/bin/bash

# DOC: Download Script for the Aperture Download Portal.

if [ $# -lt 3 ]; then
    echo "Usage: $0 <username> <target> <version>"
    exit 1
fi

version="$3"
baseurl='https://aperture.appdynamics.com/download/prox/download-file'
loginurl='https://login.appdynamics.com/sso/login/'

cd $2
if [ ! -d "$version" ]; then
  mkdir $version
fi

cd $version
rm -rf ./*

read -p "Password: " -s password

curl --referer http://www.appdynamics.com -c ./cookies.txt -d "username=$1&password=$password" $loginurl

curl -L -O -b ./cookies.txt $baseurl/analytics/$version/analytics-agent-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/analytics-bundle/$version/analytics-agent-bundle-32bit-windows-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/analytics-bundle/$version/analytics-agent-bundle-64bit-windows-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/android/$version/AndroidAgent-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/controller/$version/controller_32bit_linux-$version.sh
#curl -L -O -b ./cookies.txt $baseurl/controller/$version/controller_32bit_windows-$version.exe
#curl -L -O -b ./cookies.txt $baseurl/controller/$version/controller_64bit_linux-$version.sh
#curl -L -O -b ./cookies.txt $baseurl/controller/$version/controller_64bit_mac-$version.dmg
#curl -L -O -b ./cookies.txt $baseurl/controller/$version/controller_64bit_windows-$version.exe
#curl -L -O -b ./cookies.txt $baseurl/native-sdk/$version/appdynamics-sdk-native-32bit-linux-$version.tar.gz
#curl -L -O -b ./cookies.txt $baseurl/native-sdk/$version/appdynamics-sdk-native-32bit-windows-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/native-sdk/$version/appdynamics-sdk-native-64bit-linux-$version.tar.gz
#curl -L -O -b ./cookies.txt $baseurl/native-sdk/$version/appdynamics-sdk-native-64bit-windows-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/db/$version/dbagent-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/dotnet/$version/dotNetAgentSetup-$version.msi
#curl -L -O -b ./cookies.txt $baseurl/dotnet/$version/dotNetAgentSetup64-$version.msi
#curl -L -O -b ./cookies.txt $baseurl/euem-processor/$version/euem-64bit-linux-$version.sh
#curl -L -O -b ./cookies.txt $baseurl/euem-processor/$version/euem-64bit-windows-$version.exe
#curl -L -O -b ./cookies.txt $baseurl/events-service/$version/events-service-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/geo/$version/GeoServer-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/ibm-jvm/$version/AppServerAgent-ibm-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/ios/$version/iOSAgent-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/machine/$version/appdynamics-machine-agent-$version-1.i386.rpm
#curl -L -O -b ./cookies.txt $baseurl/machine/$version/appdynamics-machine-agent-$version-1.x86_64.rpm
#curl -L -O -b ./cookies.txt $baseurl/machine/$version/MachineAgent-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/machine-bundle/$version/machineagent-bundle-32bit-linux-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/machine-bundle/$version/machineagent-bundle-32bit-windows-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/machine-bundle/$version/machineagent-bundle-64bit-linux-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/machine-bundle/$version/machineagent-bundle-64bit-osx-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/machine-bundle/$version/machineagent-bundle-64bit-solaris-x64-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/machine-bundle/$version/machineagent-bundle-64bit-solaris-x64.zip
#curl -L -O -b ./cookies.txt $baseurl/machine-bundle/$version/machineagent-bundle-64bit-windows-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/neustar/$version/neustar-$version.dat
#curl -L -O -b ./cookies.txt $baseurl/php-osx/$version/appdynamics-php-agent-x64-osx-$version.tar.bz2
#curl -L -O -b ./cookies.txt $baseurl/php-rpm/$version/appdynamics-php-agent.i686.rpm
#curl -L -O -b ./cookies.txt $baseurl/php-rpm/$version/appdynamics-php-agent.x86_64.rpm
#curl -L -O -b ./cookies.txt $baseurl/php-tar/$version/appdynamics-php-agent-x64-linux-$version.tar.bz2
#curl -L -O -b ./cookies.txt $baseurl/php-tar/$version/appdynamics-php-agent-x86-linux-$version.tar.bz2
curl -L -O -b ./cookies.txt $baseurl/sun-jvm/$version/AppServerAgent-$version.zip
#curl -L -O -b ./cookies.txt $baseurl/webserver-sdk/$version/appdynamics-sdk-native-nativeWebServer-32bit-linux-$version.tar.gz
#curl -L -O -b ./cookies.txt $baseurl/webserver-sdk/$version/appdynamics-sdk-native-nativeWebServer-64bit-linux-$version.tar.gz

chmod 777 ./*

rm -rf ./cookies.txt

exit 0
