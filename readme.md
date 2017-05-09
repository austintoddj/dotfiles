<p align="center">
    <img src="https://raw.githubusercontent.com/austintoddj/dev-setup/master/resources/header.jpg">
</p>

Easy-to-understand instructions with automated setup scripts for developer tools like **Vim**, **Sublime Text**, **Bash**, **PHPStorm**, **Git**, and dev-based macOS defaults.

**Warning:** If you want to give these scripts a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what they entail. *Use at your own risk!*

### Installation

#### Option 1

You can clone the repository wherever you want. Run the following command to download the files and initiate the installer:

```sh
git clone https://github.com/austintoddj/dev-setup.git && cd dev-setup && source init.sh
```

To remain up-to-date with any future changes, simply run `git pull` from the project to update your working copy, and then run `source update.sh`. The update script only runs the files within the `shell/` directory since there isn't any need to run the default configuration commands again.

#### Option 2

If you prefer to not use Git, or simply don't have it installed on your machine, [click here](https://github.com/austintoddj/dev-setup/archive/master.zip) to download the project. Unzip the downloaded file and run `source init.sh` from inside.

To remain up-to-date with any future changes, just [click here](https://github.com/austintoddj/dev-setup/archive/master.zip) to re-download the project. Unzip the downloaded file and run `source update.sh` from the inside. The update script only runs the files within the `shell/` directory since there isn't any need to run the default configuration commands again.

<br/>
<img src="https://raw.githubusercontent.com/austintoddj/dev-setup/master/resources/terminal.png" width=>

### Bash

- Open Terminal > Settings and import the `Solarized Dark ansi.terminal` theme
- Update Font/Cursor/Startup as needed
- Restart Terminal

<br/>
<img src="https://raw.githubusercontent.com/austintoddj/dev-setup/master/resources/sublimetext.png">

### Sublime Text

With the terminal, the text editor is a developer's most important tool. Everyone has their preferences, but unless you're a hardcore [Vim](http://en.wikipedia.org/wiki/Vim) user, a lot of people are going to tell you that [Sublime Text](http://www.sublimetext.com/) is currently the best one out there.

#### [v2](https://www.sublimetext.com/2)

- Install the [Package Manager](https://packagecontrol.io/installation)
- Install the *Sublime Text > v2 > `Material` theme in Packages/Themes/Material/Material-Theme.tmTheme*
- Replace the contents of `Preferences.sublime-settings`, `Distraction Free.sublime-settings`
- Install useful packages referenced in `sublime/packages`
- Restart Sublime
- Enter License Key

#### [v3](https://www.sublimetext.com/3)

- Install the [Package Manager](https://packagecontrol.io/installation)
- Install the *Sublime Text > v3 > `Material` theme in Packages/Material Theme/schemes/Material-Theme.tmTheme*
- Replace the contents of `Preferences.sublime-settings`, `Distraction Free.sublime-settings`
- Install useful packages referenced in `sublime/packages`
- Restart Sublime
- Enter License Key

<br/>
<img src="https://raw.githubusercontent.com/austintoddj/dev-setup/master/resources/phpstorm.png">

### PHPStorm

- Install `Material Theme UI` in Settings > Preferences > Plugins > Browse Repositories
- Restart PHPStorm
- IDE theme (not the code color scheme) can be changed in Tools > Material Theme
- Install useful packages referenced in `phpstorm/packages`
- Enter License Key

