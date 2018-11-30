
: ${1:?"Need to provide remote ES address."}
: ${2:?"Need to provide remote index name (source index)"}
remote_addr=$1
source_index=$2
dest_index=${3:-"$2"}

echo "$remote_addr | $source_index | $dest_index "
curl -u'elastic:changeme' -X POST "localhost:9200/_reindex" -H 'Content-Type: application/json' -d'
{
  "source": {
    "remote": {
      "host": "http://otherhost:9200",
      "username": "elastic",
      "password": "changeme"
    },
    "index": "'$source_index'",
    "query": {
      "match": {
        "test": "data"
      }
    }
  },
  "dest": {
    "index": "'$dest_index'"
  }
}
'


