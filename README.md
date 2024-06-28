# Personal library of MacOS bash scripts

- ### More scripts will be soon here
- [Symlinks for Logic Pro](#Symlinks)
- [Features](#Features)
- [Installation](#Installation)


## Symlinks
- Apple loops ``/Library/Application Support/Audio/Apple Loops``
- Logic Pro ``/Library/Application Support/Logic``
- GarageBand ``/Library/Application Support/GarageBand``


## Features
- Check if local library folders exists or it's symlinks
- If folders exists locally, script will remove it and create symlink from your  ``external drive path ``.

## Installation
```sh
  git clone https://github.com/dimitrijfedoryno/MacOS_personal.git
  cd MacOS_personal
  chmod 777 LogicPro-library-link.sh
  ./LogicPro-library-link.sh
```
