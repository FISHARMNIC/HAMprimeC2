# Dependencies
* **Must be installed before continuing**
* NodeJS
* If on MacOS
    * LimaVM
    * XQuartz (only if you are planning to use the graphics library)
* gcc multilib (`sudo apt-get install gcc-multilib`)
* gmp (needed if using bignums) (`sudo apt-get install libgmp3-dev`)
* 32bit x11 (needed if using graphics)
    * `dpkg --add-architecture i386; sudo apt-get update; sudo apt-get install libx11-dev:i386`
* *Note: if on mac, these should be installed in Lima. otherwise just install these normally*

# Method 1 

## Installing
* Clone [this](https://github.com/FISHARMNIC/HAMprimeC2/tree/main) repository
* run `./compiler/scripts/BUILD.sh`

## Compiling
* Cd into `compiler`
* Run `node main.js <file name in test/working directory>`
    * For example: `node main.js arrays.x`
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

# Method 2 (experimental)

## Installing
* **MUST BE USING BASH**
* Clone [this](https://github.com/FISHARMNIC/HAMprimeC2/tree/main) repository
* cd `./installer`
* run `./install.sh` (runs BUILD.sh, moves compiler to path, and lets you use any file)

## Compiling and Running
* Compiling can be done with `hamc <out> -o <out> -l <link>`
    * Example 1: `ham file.x -o a`
    * Example 2: `ham file2.x -o bob -l gmp` (links with gmp. Can do pthread, x11, etc)
* The binary can then be run normally (via Lima if on Mac)
* Binary will be in `./compiled/out.s`
* *You can still use method-1 for compiling and running if you installed using method-2* 