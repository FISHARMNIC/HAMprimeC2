#!/bin/bash

fileDir=$(pwd)"/executables"
echo ""
echo "╔ *** Installing HAM prime ***"
echo "║ Installing from "$fileDir

# confirm required files
for requiredFile in "__ham_template.sh" "__hamc_template.sh"; do
  if ! test -f "$requiredFile"; then
    echo "║ : File \"$requiredFile\" does not exist. Are you in the right directory?"
    exit
  fi
done

chmod u+x $fileDir/ham
chmod u+x $fileDir/hamc

echo "║ : Copying templates to actual files "
echo -e "#!/bin/bash\nCOMPILER_DIR=\"$(pwd)/../compiler\"\n$(cat $fileDir/ham)" | cat - ./__ham_template.sh > $fileDir/ham
echo -e "#!/bin/bash\nCOMPILER_DIR=\"$(pwd)/../compiler\"\n$(cat $fileDir/hamC)" | cat - ./__hamc_template.sh > $fileDir/hamc

if [[ "$PATH" != *"$fileDir"* ]]; then
    echo "║ : Exporting to path..."
    export PATH=$PATH:$fileDir
    echo "║ : Compiling binaries..."

    if [[ "$OSTYPE" =~ ^darwin ]]; then
        limactl shell debian $fileDir/../../scripts/build.sh
    else
        $fileDir/../../scripts/build.sh
    fi

    if [[ $? -ne 0 ]]; then
        echo "Binary compilation failed! Exiting"
        exit 1
    fi
    
else
    echo "║ : Path entry exists. Skipping..."
fi

echo "╚ Installation succesfull! Restart bash"
echo ""
echo "| Compiler commands:"
echo "|     ham:  Compile and run ham program"
echo "|     hamc: Compile program"
echo ""