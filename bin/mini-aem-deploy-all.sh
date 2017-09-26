#! /bin/bash

# build relevant packages
cd ~/Projects/lsa-aem-project/michigan-lsa-services
mvn clean install
cd ~/Projects/lsa-aem-project/michigan-lsa-view
mvn clean install
cd ~/Projects/lsa-aem-project/michigan-lsa-config
mvn clean install

# install all packages
cd ~/Projects/lsa-aem-project/michigan-lsa-all
mvn clean install -Pauto-deploy -Pmini-aem

# clean everything
cd ~/Projects/lsa-aem-project
mvn clean
