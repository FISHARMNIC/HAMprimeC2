#!/bin/bash

mkdir -p executables

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

echo "║ : Copying templates to actual files "
echo -e "#!/bin/bash\nCOMPILER_DIR=\"$(pwd)/../compiler\"\n$(cat $fileDir/ham)" | cat - ./__ham_template.sh > $fileDir/ham
echo -e "#!/bin/bash\nCOMPILER_DIR=\"$(pwd)/../compiler\"\n$(cat $fileDir/hamc)" | cat - ./__hamc_template.sh > $fileDir/hamc

chmod u+x $fileDir/ham
chmod u+x $fileDir/hamc

if [[ "$PATH" != *"$fileDir"* ]]; then
    echo "║ : Exporting to path..."
   
    BASH_PROFILE_FILE=~/.bashrc
    if ! test -f $BASH_PROFILE_FILE; then
        BASH_PROFILE_FILE=~/.bash_profile
    fi
    echo export PATH=$fileDir:$PATH >> $BASH_PROFILE_FILE && source $BASH_PROFILE_FILE
    
    echo "║ : Compiling binaries..."

    if [[ "$OSTYPE" =~ ^darwin ]]; then
        limactl shell debian $fileDir/../../compiler/scripts/BUILD.sh
    else
        $fileDir/../../compiler/scripts/BUILD.sh
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