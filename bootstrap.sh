set -e
if [[ ! -d /tmp/es-config-scripts ]]; then
    mkdir -p /tmp/es-config-scripts
    pushd /tmp/es-config-scripts
    git clone https://bitbucket.davita.com/scm/cmtm/cwowmt-mustache-loader.git
    popd
fi
mkdir -p ./elasticsearch/config/scripts/
cp /tmp/es-config-scripts/cwowmt-mustache-loader/templates/* ./elasticsearch/config/scripts/
rm -rf /tmp/es-config-scripts/

#CWOW still relies upon major 5 release.
#export TAG=5.5.1
docker-compose up -d

