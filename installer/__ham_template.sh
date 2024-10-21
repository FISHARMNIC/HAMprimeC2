if [[ $# -eq 0 ]]; then
    echo "No arguments provided"
    echo "Usage: ham file"
    exit 1
fi

hamc $1 __RANOPRINT__
if [[ $? -eq 0 ]]; then
    if [[ "$OSTYPE" =~ ^darwin ]]; then
        limactl shell debian $COMPILER_DIR/scripts/assemble.sh
    else
        $COMPILER_DIR/scripts/assemble.sh
    fi
else
    echo -e "\nham: compilation failed\n"
fi