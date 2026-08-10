# Omarchy Dotfiles

Personal configurations for Omarchy (Arch Linux + Hyprland), featuring custom keybindings and the Data Science Omarchy Menu extension.

## 🚀 Quick Setup Instructions

If you are installing this on your system or sharing with a friend, follow these steps:

### 1. Install GNU Stow
```bash
sudo pacman -S stow
```

### 2. Clone the Repository
```bash
git clone https://github.com/agusbpl/omarchy-dotfiles.git ~/omarchy-dotfiles
```

### 3. Apply the Configurations
```bash
cd ~/omarchy-dotfiles
stow hypr omarchy scripts
```

---

## 📁 Repository Structure

```
~/omarchy-dotfiles/
├── hypr/               # Hyprland keybindings & submaps
│   └── .config/hypr/qtile_binds.conf
├── omarchy/            # Omarchy Menu extensions & Data Science submenus
│   └── .config/omarchy/extensions/menu.sh
└── scripts/            # Helper scripts & cheatsheet
    └── Scripts/
```

---

## ✨ Features & Usage

### 📊 1. Data Science Omarchy Menu
Press **`Super + Alt + Space`** (or click the top bar icon) $\rightarrow$ **`Learn`** $\rightarrow$ **`Data Science`** (or press **`Alt + L`** $\rightarrow$ **`D`**).

Categorized documentation submenus include:
- **Data Analysis**: Python (Y), Pandas (P), Polars (O), NumPy (N), SciPy (I), Numba (U)
- **Visualization**: Matplotlib (M), Seaborn (X), Plotly (T), Streamlit (S)
- **Machine Learning & AI**: Scikit-Learn (K), PyTorch (F), TensorFlow (W), Hugging Face (Z)
- **Databases & BI**: SQL Cheat Sheet (L), PostgreSQL (G), Metabase (E)
- **Environment**: JupyterLab (J)

### ⌨️ 2. Instant Keybindings (`Alt + L` submap)
Press **`Alt + L`** followed by any key letter to open documentation directly:

| Shortcut | Action |
| :--- | :--- |
| **`Alt + L` $\rightarrow$ `D`** | Open Data Science Menu |
| **`Alt + L` $\rightarrow$ `Y`** | Python Docs |
| **`Alt + L` $\rightarrow$ `P`** | Pandas Docs |
| **`Alt + L` $\rightarrow$ `O`** | Polars Docs |
| **`Alt + L` $\rightarrow$ `N`** | NumPy Docs |
| **`Alt + L` $\rightarrow$ `M`** | Matplotlib Docs |
| **`Alt + L` $\rightarrow$ `T`** | Plotly Docs |
| **`Alt + L` $\rightarrow$ `K`** | Scikit-Learn Docs |
| **`Alt + L` $\rightarrow$ `F`** | PyTorch Docs |
| **`Alt + L` $\rightarrow$ `W`** | TensorFlow Docs |
| **`Alt + L` $\rightarrow$ `U`** | Numba Docs |
| **`Alt + L` $\rightarrow$ `I`** | SciPy Docs |
| **`Alt + L` $\rightarrow$ `X`** | Seaborn Docs |
| **`Alt + L` $\rightarrow$ `Z`** | Hugging Face Docs |
| **`Alt + L` $\rightarrow$ `S`** | Streamlit Docs |
| **`Alt + L` $\rightarrow$ `J`** | JupyterLab Docs |
| **`Alt + L` $\rightarrow$ `L`** | SQL Cheat Sheet |
| **`Alt + L` $\rightarrow$ `G`** | PostgreSQL Docs |
| **`Alt + L` $\rightarrow$ `E`** | Metabase Docs |

---

## 🛠️ Management Commands

### Updating / Un-stowing Configurations
- **To remove symlinks**: `cd ~/omarchy-dotfiles && stow -D hypr omarchy scripts`
- **To push updates**: `cd ~/omarchy-dotfiles && git add . && git commit -m "Update" && git push`
