# Overwrite parts of the omarchy-menu with user-specific submenus.
# See $OMARCHY_PATH/bin/omarchy-menu for functions that can be overwritten.

show_ds_analysis_menu() {
  case $(menu "Data Analysis" "  Python (Y)\n🐼  Pandas (P)\n🧊  Polars (O)\n🔢  NumPy (N)\n🔬  SciPy (I)\n⚡  Numba (U)") in
  *Python*) omarchy-launch-webapp "https://docs.python.org/3/" ;;
  *Pandas*) omarchy-launch-webapp "https://pandas.pydata.org/docs/" ;;
  *Polars*) omarchy-launch-webapp "https://docs.pola.rs/" ;;
  *NumPy*) omarchy-launch-webapp "https://numpy.org/doc/stable/user/quickstart.html" ;;
  *SciPy*) omarchy-launch-webapp "https://docs.scipy.org/doc/scipy/" ;;
  *Numba*) omarchy-launch-webapp "https://numba.readthedocs.io/en/stable/" ;;
  *) back_to show_data_science_menu ;;
  esac
}

show_ds_vis_menu() {
  case $(menu "Visualization" "📊  Matplotlib (M)\n🎨  Seaborn (X)\n📈  Plotly (T)\n👑  Streamlit (S)") in
  *Matplotlib*) omarchy-launch-webapp "https://matplotlib.org/stable/contents.html" ;;
  *Seaborn*) omarchy-launch-webapp "https://seaborn.pydata.org/" ;;
  *Plotly*) omarchy-launch-webapp "https://plotly.com/python/" ;;
  *Streamlit*) omarchy-launch-webapp "https://docs.streamlit.io/" ;;
  *) back_to show_data_science_menu ;;
  esac
}

show_ds_ml_menu() {
  case $(menu "Machine Learning & AI" "🤖  Scikit-Learn (K)\n🔥  PyTorch (F)\n🍊  TensorFlow (W)\n🤗  Hugging Face (Z)") in
  *Scikit-Learn*) omarchy-launch-webapp "https://scikit-learn.org/stable/" ;;
  *PyTorch*) omarchy-launch-webapp "https://pytorch.org/docs/stable/index.html" ;;
  *TensorFlow*) omarchy-launch-webapp "https://www.tensorflow.org/api_docs/python/tf" ;;
  *"Hugging Face"*) omarchy-launch-webapp "https://huggingface.co/docs/transformers/index" ;;
  *) back_to show_data_science_menu ;;
  esac
}

show_ds_db_menu() {
  case $(menu "Databases & BI" "🗄️  SQL Cheat Sheet (L)\n🐘  PostgreSQL (G)\n📊  Metabase (E)") in
  *SQL*) omarchy-launch-webapp "https://www.sqlshack.com/sql-cheat-sheet/" ;;
  *PostgreSQL*) omarchy-launch-webapp "https://www.postgresql.org/docs/" ;;
  *Metabase*) omarchy-launch-webapp "https://www.metabase.com/docs/latest/" ;;
  *) back_to show_data_science_menu ;;
  esac
}

show_ds_all_docs_menu() {
  case $(menu "All Data Science Docs" "  Python (Y)\n🐼  Pandas (P)\n🧊  Polars (O)\n🔢  NumPy (N)\n📊  Matplotlib (M)\n📈  Plotly (T)\n🤖  Scikit-Learn (K)\n🔥  PyTorch (F)\n🍊  TensorFlow (W)\n⚡  Numba (U)\n🔬  SciPy (I)\n🎨  Seaborn (X)\n🤗  Hugging Face (Z)\n👑  Streamlit (S)\n📓  JupyterLab (J)\n🗄️  SQL Cheat Sheet (L)\n🐘  PostgreSQL (G)\n📊  Metabase (E)") in
  *Python*) omarchy-launch-webapp "https://docs.python.org/3/" ;;
  *Pandas*) omarchy-launch-webapp "https://pandas.pydata.org/docs/" ;;
  *Polars*) omarchy-launch-webapp "https://docs.pola.rs/" ;;
  *NumPy*) omarchy-launch-webapp "https://numpy.org/doc/stable/user/quickstart.html" ;;
  *Matplotlib*) omarchy-launch-webapp "https://matplotlib.org/stable/contents.html" ;;
  *Plotly*) omarchy-launch-webapp "https://plotly.com/python/" ;;
  *Scikit-Learn*) omarchy-launch-webapp "https://scikit-learn.org/stable/" ;;
  *PyTorch*) omarchy-launch-webapp "https://pytorch.org/docs/stable/index.html" ;;
  *TensorFlow*) omarchy-launch-webapp "https://www.tensorflow.org/api_docs/python/tf" ;;
  *Numba*) omarchy-launch-webapp "https://numba.readthedocs.io/en/stable/" ;;
  *SciPy*) omarchy-launch-webapp "https://docs.scipy.org/doc/scipy/" ;;
  *Seaborn*) omarchy-launch-webapp "https://seaborn.pydata.org/" ;;
  *"Hugging Face"*) omarchy-launch-webapp "https://huggingface.co/docs/transformers/index" ;;
  *Streamlit*) omarchy-launch-webapp "https://docs.streamlit.io/" ;;
  *JupyterLab*) omarchy-launch-webapp "https://jupyterlab.readthedocs.io/en/stable/" ;;
  *SQL*) omarchy-launch-webapp "https://www.sqlshack.com/sql-cheat-sheet/" ;;
  *PostgreSQL*) omarchy-launch-webapp "https://www.postgresql.org/docs/" ;;
  *Metabase*) omarchy-launch-webapp "https://www.metabase.com/docs/latest/" ;;
  *) back_to show_data_science_menu ;;
  esac
}

show_data_science_menu() {
  case $(menu "Data Science" "📊  Data Analysis & Manipulation\n📈  Visualization\n🤖  Machine Learning & AI\n🗄️  Databases & BI\n📓  JupyterLab (J)\n📚  All Data Science Docs") in
  *Analysis*) show_ds_analysis_menu ;;
  *Visualization*) show_ds_vis_menu ;;
  *Machine*) show_ds_ml_menu ;;
  *Databases*) show_ds_db_menu ;;
  *JupyterLab*) omarchy-launch-webapp "https://jupyterlab.readthedocs.io/en/stable/" ;;
  *All*) show_ds_all_docs_menu ;;
  *) back_to show_learn_menu ;;
  esac
}

show_learn_menu() {
  case $(menu "Learn" "  Keybindings (K)\n📊  Data Science (D)\n  Omarchy (O)\n  Hyprland (H)\n󰣇  Arch (A)\n  Neovim (N)\n󱆃  Bash (B)") in
  *Keybindings*) omarchy-menu-keybindings ;;
  *"Data Science"*) show_data_science_menu ;;
  *Omarchy*) omarchy-launch-webapp "https://learn.omacom.io/2/the-omarchy-manual" ;;
  *Hyprland*) omarchy-launch-webapp "https://wiki.hypr.land/" ;;
  *Arch*) omarchy-launch-webapp "https://wiki.archlinux.org/title/Main_page" ;;
  *Bash*) omarchy-launch-webapp "https://devhints.io/bash" ;;
  *Neovim*) omarchy-launch-webapp "https://www.lazyvim.org/keymaps" ;;
  *) show_main_menu ;;
  esac
}

go_to_menu() {
  case "${1,,}" in
  *data*science* | *datascience*) show_data_science_menu ;;
  *apps*) walker -p "Launch…" ;;
  *learn*) show_learn_menu ;;
  *trigger*) show_trigger_menu ;;
  *toggle*) show_toggle_menu ;;
  *hardware*) show_hardware_menu ;;
  *share*) show_share_menu ;;
  *reminder-set*) show_custom_reminder_input ;;
  *reminder*) show_reminder_menu ;;
  *background*) show_background_menu ;;
  *capture*) show_capture_menu ;;
  *style*) show_style_menu ;;
  *theme*) show_theme_menu ;;
  *screenrecord*) show_screenrecord_menu ;;
  *setup*) show_setup_menu ;;
  *power*) show_setup_power_menu ;;
  *install*) show_install_menu ;;
  *remove*) show_remove_menu ;;
  *update*) show_update_menu ;;
  *about*) show_about ;;
  *system*) show_system_menu ;;
  esac
}
