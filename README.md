# match-3-love
An implementation of a match three style game in Lua.

# Prerequisities.
For the users who will prefer to run the game on their own machine, via the unbuilt source code, then the following prerequisites need to be meet:

* [LÖVE](https://love2d.org/) - The game engine used.
* [Lua](https://www.lua.org/) - The programming language used.
* [Make](https://www.gnu.org/software/make/) - The build tool used. (Optional)

# Installing the required prequisites.
In order to make it easier for people who wish to run the unbuilt code, a .TOML file will be provided, alongside an installation script, which will automatically install all the prequisites for the user.

## Attention!
At the time at which you are reading this, the script is not available(once it will be, this subsection will be removed from within the README.md file). Therefore, if you wish to run the unbuilt code, you will need to install the prequisites manually.

# Running the game.

## Unbuilt code.

### UNIX based systems.

Once you have installed the prequisites, you can run the game by executing the following commands:

1. This is the default love command, and it will work on UNIX based systems, such as Linux, MacOS, etc.
```bash
love .
```
2. In the case in which this command poses a difficulty in memorising, then you can use the following alternative, which once again works on UNIX based systems.
```bash
make
```

### Windows based systems.
The easiest way to run the game on Windows, is to either utilise the powershell, in which case, do utilise one of the previous commands, the ones written under the UNIX based systems subsection, or you can install the LÖVE2D Code extension, which will allow you to run the unbuilt code, whether you use powershell or not.

## Built code.
If you would rather wish to reduce the level of difficulty, required so as to get the game started, you can simply download the built version of the game, which can be found( a link will be provided once the game will be released), alternatively you can find a build of the game in the build directory(that feature is not yet availabel, hence if you are reading this, then refer to the previous section, so as to see how to run the unbuilt code).