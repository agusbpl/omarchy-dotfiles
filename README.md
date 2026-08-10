# My Omarchy & Hyprland Dotfiles

Personal configurations for Omarchy (Arch Linux + Hyprland), featuring custom keybindings and the Data Science Omarchy Menu extension.

## Structure

```
~/dotfiles/
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
cd ~/dotfiles
stow hypr omarchy scripts
```

To remove symlinks when needed:
```bash
cd ~/dotfiles
stow -D hypr omarchy scripts
```

## Features Included
- **Data Science Omarchy Submenu**: Access documentation for Python, Pandas, Polars, NumPy, Matplotlib, Plotly, Scikit-Learn, PyTorch, TensorFlow, Numba, SciPy, Seaborn, Hugging Face, Streamlit, JupyterLab, SQL, PostgreSQL, and Metabase.
- **Hyprland Submaps**: Access documentation directly via `Alt + L` followed by the single-letter shortcut.
