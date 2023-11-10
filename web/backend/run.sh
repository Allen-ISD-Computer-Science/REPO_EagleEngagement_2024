
# Ensure front-end has been built before attempting to run
if [ ! -d "Public/static/" ]
then
    echo "WARN: Frontend has not yet been built."
    echo "      Build front-end before attempting to run by executing"
    echo "      'build' from the root directory."
    exit 1
fi

# Run
makeSwift --mode=run "$@"
