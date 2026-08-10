#!/usr/bin/env bash
# qtile_keys.sh — Rofi keybinding cheatsheet
# Place at ~/Scripts/qtile_keys.sh and chmod +x

BINDINGS=$(
  cat <<'EOF'
─── WINDOW FOCUS ──────────────────────────────────
  MOD + h                    Move focus left
  MOD + l                    Move focus right
  MOD + j                    Move focus down
  MOD + k                    Move focus up
  MOD + Space                Move focus to next window

─── WINDOW MOVEMENT ───────────────────────────────
  MOD + Shift + h            Move window left
  MOD + Shift + l            Move window right
  MOD + Shift + j            Move window down
  MOD + Shift + k            Move window up

─── WINDOW RESIZE ─────────────────────────────────
  MOD + Ctrl + h             Grow window left
  MOD + Ctrl + l             Grow window right
  MOD + Ctrl + j             Grow window down
  MOD + Ctrl + k             Grow window up
  MOD + n                    Normalize all window sizes

─── WINDOW STATE ──────────────────────────────────
  MOD + f                    Toggle fullscreen
  MOD + t                    Toggle floating
  MOD + Shift + s            Toggle sticky window
  MOD + Shift + Return       Toggle split/unsplit stack
  MOD + w                    Kill focused window

─── QTILE ─────────────────────────────────────────
  MOD + Tab                  Next layout
  MOD + Ctrl + r             Reload config
  MOD + Ctrl + q             Shutdown Qtile
  MOD + Ctrl + Escape        Shutdown system
  MOD + F1                   Show keybindings (qtile shell)

─── LAUNCH ────────────────────────────────────────
  MOD + Return               Terminal
  MOD + Alt + Space          Rofi app launcher
  MOD + p                    Piper TTS

─── CHORD: Alt + l  (Launcher) ────────────────────
  ... t                      btop (terminal monitor)
  ... o                      Obsidian
  ... Shift + o              OnlyOffice
  ... k                      Okular (PDF reader)
  ... e                      Zed editor
  ... b                      Thorium browser
  ... p                      PCManFM (file browser)
  ... n                      Neovim
  ... i                      Edit Qtile config
  ... y                      YouTube (app)
  ... d                      DeepL (app)
  ... l                      NotebookLM (app)
  ... a                      Gemini (app)
  ... c                      Camera script
  ... v                      Screen record script

─── CHORD: Alt + a  (AI) ──────────────────────────
  ... a                      Gemini
  ... c                      Claude
  ... g                      ChatGPT
  ... k                      Kimi
  ... p                      Perplexity
  ... d                      DeepSeek
  ... m                      Mistral

─── CHORD: Alt + e  (Education) ───────────────────
  ... q                      Qtile Docs
  ... b                      Bash Cheatsheet
  ... y                      Python Docs
  ... p                      Pandas Docs
  ... o                      Polars Docs
  ... m                      Matplotlib Docs
  ... s                      Streamlit Docs
  ... t                      Metabase Docs
  ... a                      Airflow Docs
  ... l                      SQL Cheatsheet
  ... g                      PostgreSQL Docs

─── GROUPS ────────────────────────────────────────
  MOD + [1-0]                Switch to group
  MOD + Shift + [1-0]        Move window to group & follow

─── MOUSE ─────────────────────────────────────────
  MOD + Left click drag      Move floating window
  MOD + Right click drag     Resize floating window
  MOD + Middle click         Bring window to front
EOF
)

echo "$BINDINGS" | rofi \
  -dmenu \
  -i \
  -p " Keys" \
  -no-custom \
  -theme-str '
        window { width: 25em; height: 20em; }
        listview { lines: 20; }
        element { padding: 4px 8px; }
        element-text { font: "monospace 11"; }
    '
