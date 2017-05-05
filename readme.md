<p align="center">
    <img src="https://raw.githubusercontent.com/austintoddj/dev-setup/master/Resources/header.jpg">
</p>

Easy-to-understand instructions with automated setup scripts for developer tools like Vim, Sublime Text, Bash, PHPStorm, Git, and dev-based macOS defaults.

### Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what they entail. *Use at your own risk!*

#### Git Installation

You can clone the repository wherever you want. I like to keep it in `~/Sites/dev-setup`. You can then use `git pull` to keep your working copy up to date with the repository and the script will then copy the files to your home folder.

```sh
git clone https://github.com/austintoddj/dev-setup.git && cd dev-setup && source init.sh
```

#### Git-free Installation

[Click here](https://github.com/austintoddj/dev-setup/archive/master.zip) to download the repository.

Unzip the downloaded file and run `source init.sh` from inside.

### Fonts

- Install [Source Code Pro (OTF)](https://github.com/austintoddj/dev-setup/tree/master/Fonts/Source%20Code%20Pro)
- Install [Operator Mono](https://www.typography.com/blog/introducing-operator)

<img src="https://raw.githubusercontent.com/austintoddj/dev-setup/master/Resources/terminal.png" width=>
<br/>

### Bash

- Open Terminal > Settings and import the `Solarized Dark ansi.terminal` theme
- Update Font/Cursor/Startup as needed
- Restart Terminal

<img src="https://raw.githubusercontent.com/austintoddj/dev-setup/master/Resources/sublimetext.png">
<br/>

### Sublime Text

With the terminal, the text editor is a developer's most important tool. Everyone has their preferences, but unless you're a hardcore [Vim](http://en.wikipedia.org/wiki/Vim) user, a lot of people are going to tell you that [Sublime Text](http://www.sublimetext.com/) is currently the best one out there.

#### v2

- Install the [Package Manager](https://packagecontrol.io/installation)
- Install the `Material` package
- Activate the theme in Preferences > Color Scheme > Material > schemes > Material-Theme
- Replace the contents of `Preferences.sublime-settings`, `Distraction Free.sublime-settings`
- Install the following packages:
    - AutoFileName
    - Autoprefixer
    - Blade Snippets
    - Blade Spacer
    - BracketHighlighter
    - Colorsublime-Themes
    - Emmet
    - FuzzyFileNav
    - FuzzyFilePath
    - Laravel Blade Highlighter
    - Package Control
    - PhpDoc
    - Predawn
    - PyV8
    - SideBarEnhancements
    - SublimeCodeIntel
- Restart Sublime
- Enter License Key

#### v3

- Install the [Package Manager](https://packagecontrol.io/installation)
- Install the [Material Theme](https://github.com/equinusocio/material-theme)
- Replace the contents of `Preferences.sublime-settings`, `Distraction Free.sublime-settings`
- Install the following packages:
    - AutoFileName
    - Autoprefixer
    - Blade Snippets
    - Blade Spacer
    - BracketHighlighter
    - Colorsublime-Themes
    - Emmet
    - FuzzyFileNav
    - FuzzyFilePath
    - Laravel Blade Highlighter
    - Package Control
    - PhpDoc
    - Predawn
    - PyV8
    - SideBarEnhancements
    - SublimeCodeIntel
- Restart Sublime
- Enter License Key

<img src="https://raw.githubusercontent.com/austintoddj/dev-setup/master/Resources/phpstorm.png">
<br/>

### PHPStorm

- Install `Material Theme UI` in Settings > Preferences > Plugins > Browse Repositories
- Restart PHPStorm
- IDE theme (not the code color scheme) can be changed in Tools > Material Theme
- Install the following plugins:
    - CodeGlance
    - Laravel Plugin
    - Material Theme UI
- Enter License Key

