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