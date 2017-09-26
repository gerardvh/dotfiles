#! /bin/bash

cd ~/Projects/lsa-aem-project/michigan-lsa-view
mvn clean install -Pauto-deploy -Plocal-aem
mvn clean
