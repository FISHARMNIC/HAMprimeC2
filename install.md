# Notes
* Only works on architectures x86 and x86-64

# Dependencies
* **Must be installed before continuing**
* NodeJS
* If on MacOS
    * LimaVM (must install `debian`)
    * XQuartz (only if you are planning to use the graphics library)
* gcc multilib (`sudo apt-get install gcc-multilib`)
* **Optional**
    * gmp (for bignum demos) (`sudo apt-get install libgmp3-dev`)
    * 32bit x11 (for graphics demos)
    * `dpkg --add-architecture i386; sudo apt-get update; sudo apt-get install libx11-dev:i386`
* *Note: if on mac, these should be installed in Lima. otherwise just install these normally*

# Method 1

## Installing
* **MUST BE USING BASH**
* Clone [this](https://github.com/FISHARMNIC/HAMprimeC2/tree/main) repository
* cd `./installer`
* run `./install.sh` (runs BUILD.sh, moves compiler to path, and lets you use any file)

## Compiling and Running
* Compiling can be done with `ham <file> -o <out> -l <link>`
    * Example 1: `ham file.x -o a`
    * Example 2: `ham file2.x -o bob -l gmp` (links with gmp. Can do pthread, x11, etc)
        * make sure to have a space between the flag and the data (like in the example above)
* The binary can then be run normally (via Lima if on Mac)
* Assembly file is stored in `HAMPRIMEC2/compiled/out.s`
* *You can still use method-2 for compiling and running if you installed using method-1* 

# Method 2

## Installing
* Clone [this](https://github.com/FISHARMNIC/HAMprimeC2/tree/main) repository
* run `./compiler/scripts/BUILD.sh`

## Compiling
* Cd into `compiler`
* Run `node main.js <file name relative to test/working directory>`
    * For example: `node main.js arrays-2d.x`
    * This creates an assembly file in `../compiled/out.s`

## Running (no graphics)
* if MacOS, enter Lima shell
* Cd into `compiler`
* Run `./scripts/assemble.sh`

## Running (with graphics)

* Cd to `compiler`
* MacOS
    * Run `./scripts/lima_x11.sh`
* Linux
    * Run `./scripts/internal/assemble_x11.sh`