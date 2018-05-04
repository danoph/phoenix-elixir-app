# /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

mkdir -p "$SCRIPT_DIR/node_modules/node-sass/vendor/linux-x64-57"
curl -L https://github.com/sass/node-sass/releases/download/v4.8.3/linux-x64-57_binding.node -o "$SCRIPT_DIR/node_modules/node-sass/vendor/linux-x64-57/binding.node"
