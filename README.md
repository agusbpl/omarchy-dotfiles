# Omarchy Dotfiles

Personal configurations for Omarchy (Arch Linux + Hyprland), featuring custom keybindings and the Data Science Omarchy Menu extension.

## Structure

```
~/omarchy-dotfiles/
├── hypr/               # Hyprland / Qtile keybindings & submaps
│   └── .config/hypr/qtile_binds.conf
├── omarchy/            # Custom Omarchy menu extensions (Data Science submenus)
│   └── .config/omarchy/extensions/menu.sh
└── scripts/            # Helper scripts & cheatsheets
    └── Scripts/
```

## Quick Installation & Stowing

### 1. Install GNU Stow
```bash
sudo pacman -S stow
```

### 2. Stow Configurations
To link configurations into your `$HOME` directory:

```bash
cd ~/omarchy-dotfiles
stow hypr omarchy scripts
```

To remove symlinks when needed:
```bash
cd ~/omarchy-dotfiles
stow -D hypr omarchy scripts
```

## Push Updates to GitHub
```bash
cd ~/omarchy-dotfiles
git push -u origin main
```

## Clone on a New Machine
```bash
git clone git@github.com:agusbpl/omarchy-dotfiles.git ~/omarchy-dotfiles
cd ~/omarchy-dotfiles
stow hypr omarchy scripts
```

## Features Included
- **Data Science Omarchy Submenu**: Categorized submenus for Data Analysis, Visualization, Machine Learning, Databases, and Environments.
- **Hyprland Submaps**: Access documentation directly via `Alt + L` followed by single-letter shortcuts.
