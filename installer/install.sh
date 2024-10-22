#!/bin/bash

# make exectuables dir if it doesn't exist
mkdir -p executables

fileDir=$(pwd)"/executables"
echo ""
echo "╔ *** Installing HAM prime ***"
echo "║ Installing from "$fileDir

# confirm required files
for requiredFile in "__ham_template.sh" "__hamc_template.sh" "ham.js"; do
  if ! test -f "$requiredFile"; then
    echo "║ : File \"$requiredFile\" does not exist. Are you in the right directory?"
    exit
  fi
done

# Copy template files to executables dir
echo "║ : Copying templates to actual files "
echo -e "#!/bin/bash\nCOMPILER_DIR=\"$(pwd)/../compiler\"\n$(cat $fileDir/_ham)" | cat - ./__ham_template.sh > $fileDir/_ham
echo -e "#!/bin/bash\nCOMPILER_DIR=\"$(pwd)/../compiler\"\n$(cat $fileDir/_hamc)" | cat - ./__hamc_template.sh > $fileDir/_hamc
echo -e "#!/usr/bin/env node\n$(cat $fileDir/ham)" | cat - ./ham.js > $fileDir/ham

# Make them executable
chmod u+x $fileDir/ham
chmod u+x $fileDir/_ham
chmod u+x $fileDir/_hamc

# Check if PATH already has executable dir
if [[ "$PATH" != *"$fileDir"* ]]; then
    echo "║ : Exporting to path..."
   
    # Select bashrc or bash_profile depending on which one exists
    BASH_PROFILE_FILE=~/.bashrc
    if ! test -f $BASH_PROFILE_FILE; then
        BASH_PROFILE_FILE=~/.bash_profile
    fi

    # Export exectuables dir
    echo export PATH=$fileDir:$PATH >> $BASH_PROFILE_FILE && source $BASH_PROFILE_FILE

    echo "║ : Compiling binaries..."

    # Compile (via LimaVM if on Mac)
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

package_name='command-line-args'
echo "║ : Checking if $package_name exists"
if [[ "$(npm list -g $package_name)" =~ "empty" ]]; then
    echo "║ : Installing $package_name ..."
    npm install -g $package_name
else
    echo "║ : $package_name is already installed"
fi

echo "╚ Installation succesfull! Restart bash"
echo ""
echo "| Compiler commands:"
echo "|     ham:  Compile and run ham program"
echo "|     hamc: Compile program"
echo ""