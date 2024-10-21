COMMAND="__ROOTADDR__"
if [[ $2 != "__RANOPRINT__" ]]; then
    echo "**** HAM compiler ****"
else
    COMMAND=__RANOPRINT__
fi

if [[ $# -eq 0 ]]; then
    echo "No arguments provided"
    echo "Usage: ham file"
    exit 1
fi

node $COMPILER_DIR/main.js $COMMAND $1