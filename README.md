# Nordzy-Cursors

# **Repository Archived**
**This repository is now archived due to a lack of time to maintain and update it.**

**If you're interested in taking over the project, I’m happy to offer limited assistance to help you get started. Please feel free to reach out!**

**Thank you for your interest and contributions. Best wishes!**



<p align="center">
	<img src="./art/logo.png" alt="Nordzy-cursors logo">
</p>
<p align="center">
	<img alt="GitHub all releases" src="https://img.shields.io/github/downloads/alvatip/Nordzy-cursors/total?color=brightgreen"> 
	<img alt="GitHub" src="https://img.shields.io/github/license/alvatip/Nordzy-cursors?color=blue"> 
	<img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/alvatip/Nordzy-cursors?color=9cf">
</p>

Cursor theme using the [Nord](https://github.com/arcticicestudio/nord) color palette and based on [Vimix](https://github.com/vinceliuice/Vimix-cursors) and [cz-Viator](https://github.com/charakterziffer/cursor-toolbox).

### This fork contains the hyprcursors for all the Nordzy themes, see [Hyprcursor install](https://github.com/guillaumeboehm/Nordzy-hyprcursors?tab=readme-ov-file#hyprcursor-installation).

## Preview

![Nordzy dark icons](./art/preview-black.png)
![Nordzy white icons](./art/preview-white.png)


## Installation

## Linux

### System package (recommended)
Use a package maintained for your distribution and managed by your system if available, currently known packages:
- XCursors (for most people):
    * Archlinux (AUR): https://aur.archlinux.org/packages/nordzy-cursors
- Hyprcursors (if you know you want it):
    * Archlinux (AUR): https://aur.archlinux.org/packages/nordzy-hyprcursors

> [!NOTE]
> Packages only bundle the standard black and white color variants.
> To use one of the catpuccin color variants, install manually.

### Manual installer
To use the installer, clone the repository and go inside it.
```
git clone https://github.com/guillaumeboehm/Nordzy-hyprcursors
cd Nordzy-hyprcursors
```
Then, run the installer script. For local installation (recommended), use
``` 
./install.sh
```
And for system wide installation use:
``` 
sudo ./install.sh
```
> [!NOTE]
> To install hyprcursors alongside xcursors give the `--hyprcursors` option to the install script
> example: `./install.sh --hyprcursors`
### Archive file
Alternatively, you can use the tar.gz files located in the archive folder or in the release section and extract them to the adequate directory.</br>
For local installation (recommended):
```
tar -zxvf Nordzy-cursors.tar.gz -C $HOME/.icons/
tar -zxvf Nordzy-cursors-white.tar.gz -C $HOME/.icons/
```
For system-wide installation: 
```
tar -zxvf Nordzy-cursors.tar.gz -C /usr/share/icons/
tar -zxvf Nordzy-cursors-white.tar.gz -C /usr/share/icons/
```

### Hyprcursor installation

#### Installer
If no package is available for you distribution, you can install all available themes for the cursors using the install script.
Steps are identical to the [xcursors installation](https://github.com/guillaumeboehm/Nordzy-hyprcursors?tab=readme-ov-file#installer) with the --hyprcursors option added to the install script.
 
### Set the cursor theme
There are various ways to set this (or another) cursor theme.</br>
You will find all the needed informations on this [ArchWiki](https://wiki.archlinux.org/title/Cursor_themes#GNOME)

### Uninstallation
If you installed it locally, run this command in your terminal: 
```
rm -r $HOME/.icons/Nordzy-cursors*
```
And if you installed it system-wide use:
```
sudo rm -r /usr/share/icons/Nordzy-cursors*
```
> [!NOTE]
> For hyprcursors the names are `Nordzy-hyprcursors*` instead of `Nordzy-cursors*`
## Windows

To install the cursor theme on windows: 
1. Download "nordzy_cursors_windows.zip"
2. Extract the .zip file
3. In the folder, right click on the file "install.inf" and in the option choose "install"

## MacOs

To install the cursor theme on MacOs: 
1. Install [Mousecape](https://github.com/alexzielenski/Mousecape/releases)
2. Download and extract the Nordzy.cape.zip
3. With Mousecape installed on your system, double click the extracted .cape file to import it automatically in Mousecape
4. Then, make the Nordzy cape active in Mousecape

If you need any further information on how Mousecape works or if you have issues with it, please refer to the [project](https://github.com/alexzielenski/Mousecape) page and open an [issue](https://github.com/alexzielenski/Mousecape/issues) if needed.

## Also available on Pling
<p align="left">
  <a href="https://www.pling.com/p/1571937/" >
    <img title="Nordzy-cursors Pling Store" width="25%" src="https://imgur.com/VxSgrWw.png">
  </a>
</p>

## Other ressources
[Nordzy](https://github.com/alvatip/Nordzy-icon) icon theme. </br> 
[Nordic](https://github.com/EliverLara/Nordic) GTK theme.

##  Issues

If you have any issues, report them [here](https://github.com/alvatip/Nordzy-cursors/issues), I will be happy to help you!

##  How can I help ?

* By giving a **star** or **follow** on GitHub.
* By **rating** it on [Pling](https://www.pling.com/p/1571937/)
* By participating to the project, creating PR, making suggestion, ...

## Licence

GNU General Public Licence v3.0.




