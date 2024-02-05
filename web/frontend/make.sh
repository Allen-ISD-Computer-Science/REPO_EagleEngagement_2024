cd "$(dirname "$0")"

# Some limits will need to be increased in order to successfully build:
ulimit -n 8192
ulimit -u 256
ulimit -v 67108864
ulimit -t 1200

# Required build configuration environment variables
# Be sure not to overwrite existing variables set outside of this script
if [ -z "$PUBLIC_URL" ]
then
    echo "WARN: \$PUBLIC_URL is not defined. Setting default to '/vapor/$USER'"
    export PUBLIC_URL="/vapor/$USER"
else
    echo "\$PUBLIC_URL=$PUBLIC_URL"
fi

if [ -z "$REACT_APP_USER" ]
then
    echo "WARN: \$REACT_APP_USER is not defined. Setting default to '$USER'"
    export REACT_APP_USER=$USER
else
    echo "\$REACT_APP_USER=$REACT_APP_USER"
fi

# Build
npm install
npm run build

# Moving build files to Vapor
echo "Moving index.html from the build folder to ../backend/Resources/Views"
echo "Moving files from the build folder to ../backend/Public"
staticFolder="../backend/Public/static"
viewFolder="../backend/Resources/Views"

if [ -d "$staticFolder" ]; then
    echo "Deleting existing static directory..."
    rm -r "$staticFolder"
fi

if [ ! -d "$viewFolder" ]; then
    echo "Creating view folder..."
    mkdir -p $viewFolder
fi

mv -f build/index.html ../backend/Resources/Views
mv -f build/* ../backend/Public
mkdir -p ../backend/Public/assets/images
mkdir -p build/assets/images
mv -f build/assets/images/* ../backend/Public/assets/images

echo "Frontend files built & moved to the backend"
