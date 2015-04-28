#!/bin/bash

if [ -z "$JBOSS_HOME" ];
then
    echo "You need to set JBOSS_HOME env var. It's used for JBOSS_HOME/bin/jboss-cli.sh location."
    exit 1
fi

case "$1" in

    undeploy) $JBOSS_HOME/bin/jboss-cli.sh --controller=localhost --user=admin --password=redhat -c "undeploy crud.war"
    ;;
    deploy)  $JBOSS_HOME/bin/jboss-cli.sh --controller=localhost --user=admin --password=redhat -c "deploy $2 --force"
    ;;
    list) $JBOSS_HOME/bin/jboss-cli.sh --controller=localhost --user=admin --password=redhat -c "deploy -l"
    ;;
    *)
        echo "A utility script to deploy locally built lightblue-crud.war on docker. Uses jboss-cli interface."
        echo "USAGE:"
        echo "$0 undeploy # undeploys crud.war"
        echo "$0 deploy <path to crud.war> # deploys specified crud.war in docker"
        echo "$0 list # lists deployments"
   ;;
esac
