#! /bin/bash

cd ~/Projects/lsa-aem-project/michigan-lsa-view
mvn clean install -Pauto-deploy -Pmini-aem
mvn clean
