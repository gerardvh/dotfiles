#! /bin/bash

cd ~/Projects/lsa-aem-project/michigan-lsa-services
mvn clean install -Pauto-deploy -Plocal-aem
mvn clean
