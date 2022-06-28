#!/usr/bin/python3

from datetime import datetime
from os import system
from pathlib import Path
from sys import argv
from time import time

DYWALL_PATH = Path.home().joinpath(".config/dyWall/")
THEME_DIR = DYWALL_PATH.joinpath("current")
IMAGE_DIR = DYWALL_PATH.joinpath("images")
DIR_NAMES = [str(x) + ".jpg" for x in range(24)]
DIR_NAMES.sort()
AVAILABLE_THEMES = [str(theme.name) for theme in IMAGE_DIR.iterdir()]

HELP_MSG = '''
dyWall 1.0.0
Auto-wallpaper change utility

USAGE:
    dyWall [FLAGS] [OPTIONS]

FLAGS:
    -h, --help                  Prints help information

OPTIONS:
    -t, --theme <themeName>          Change the current theme to images in the given relative path. To create your                             custom theme create a folder under ~/.config/dyWall/. Change the file names to 0.jpg, 1. jpg, ... 23.jpg. Use symbolic links to fill incase you dont have enough images.
'''


def changeWall():
    # get current hour
    hour = datetime.fromtimestamp(time()).hour
    themeDir = DYWALL_PATH.joinpath("current")
    dirPath = themeDir.joinpath(str(hour) + ".jpg")
    print("changing wallpaper to :", dirPath)
    # set the wallpaper
    system("nitrogen --set-scaled --save " + str(dirPath))


def copyNewTheme(relativePath):

    dirPath = IMAGE_DIR.joinpath(relativePath)

    if not dirPath.is_dir:
        print(str(dirPath) + " is not a directory")

    children = [f.name for f in dirPath.iterdir()]
    children.sort()

    if children != DIR_NAMES:
        print( str(dirPath) + " theme dir doesnot contain all 0,1,2,..23.jpg files")

    if len(children) != 24:
        print(str(dirPath) + " does not have 24 elements")

    deleteExisting = [(system("rm " + str(img))) for img in THEME_DIR.iterdir()]
    system("cp -r " + str(dirPath) + "/* " + str(THEME_DIR))
    # Change to the new theme
    changeWall()

if __name__ == "__main__":

    # Run as usual
    if len(argv) == 1:
        changeWall()
    elif (len(argv) == 2 or len(argv) == 3) and (argv[1] == "-t" or argv[1] == '--theme'):
        if len(argv) == 2:
            
            print("USAGE: dyWall.py -t,--theme <themeName> \nList of available themes: " + ", ".join(AVAILABLE_THEMES))

        else:
            newThemePath = argv[2]
            copyNewTheme(newThemePath)
    else:
        print(HELP_MSG)
