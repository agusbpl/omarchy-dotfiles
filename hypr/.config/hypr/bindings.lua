-- Omarchy Hyprland Submap Keybindings & Vim Focus Controls (Lua Config)

local function submap_cmd(keys, description, command)
  local function action()
    if type(command) == "string" then
      hl.exec_cmd(command)
    elseif type(command) == "function" then
      command()
    end
    hl.dispatch(hl.dsp.submap("reset"))
  end

  local keys_table = type(keys) == "table" and keys or { keys }
  for _, key in ipairs(keys_table) do
    hl.bind(key, action, { description = description })
  end
end

-- Helper to register a submap trigger with visual tag notification (bound once per key)
local function bind_submap(key_char, submap_name)
  local function enter_submap()
    hl.exec_cmd(string.format('hyprctl notify 1 2500 "rgb(cba6f7)" "State: %s"', submap_name))
    hl.dispatch(hl.dsp.submap(submap_name))
  end

  hl.bind("ALT + " .. key_char:lower(), enter_submap)
end


-- =========================================================
-- 0. VIM WINDOW NAVIGATION (SUPER + H/J/K/L) & REMAPPINGS
-- =========================================================
-- Unbind conflicting defaults
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
hl.unbind("SUPER + CTRL + L")

-- Focus Navigation (SUPER + H/J/K/L)
o.bind("SUPER + H", "Focus left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + J", "Focus below window", hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + K", "Focus above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + L", "Focus right window", hl.dsp.focus({ direction = "r" }))

-- Window Swapping (SUPER + SHIFT + H/J/K/L)
o.bind("SUPER + SHIFT + H", "Swap window left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))
o.bind("SUPER + SHIFT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + L", "Swap window right", hl.dsp.window.swap({ direction = "r" }))

-- Remapped conflicting Omarchy defaults
o.bind("SUPER + CTRL + J", "Toggle window split", hl.dsp.layout("togglesplit"))
o.bind("SUPER + CTRL + K", "Keybindings menu", "omarchy-menu-keybindings")
o.bind("SUPER + CTRL + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")


-- ---------------------------------------------------------
-- 1. ALT + S -> System & Hardware
-- ---------------------------------------------------------
hl.define_submap("System", function()
  submap_cmd("f", "Files", "uwsm-app -- nautilus --new-window")
  submap_cmd("m", "Btop", "uwsm-app -- xdg-terminal-exec -e btop")
  submap_cmd("e", "Edit Binds", "uwsm-app -- xdg-terminal-exec -e nvim ~/.config/hypr/bindings.lua")
  submap_cmd("n", "Network TUI", "uwsm-app -- xdg-terminal-exec -e nmtui")
  submap_cmd("w", "Next Wallpaper", "omarchy theme bg next")
  submap_cmd("SHIFT + W", "WiFi Menu", "omarchy-launch-wifi")
  submap_cmd("SHIFT + B", "Bluetooth Menu", "omarchy-launch-bluetooth")
  submap_cmd("c", "Activate Camera", "~/Scripts/video_making/camera_activation.sh")
  submap_cmd("r", "Start Recording", "bash -c 'pc=$(hostname | grep -qi hostgus && echo 1 || echo 0); ~/Scripts/video_making/video_start$pc.sh'")
  submap_cmd("s", "Lock System", "omarchy system lock")
  submap_cmd("l", "Lock System", "omarchy system lock")
  submap_cmd("a", "Audio Settings", "omarchy-launch-audio")
  submap_cmd("p", "Clipboard History", "omarchy-launch-walker -m clipboard")
  submap_cmd("q", "Shutdown", "shutdown now")

  hl.bind("v", function()
    hl.exec_cmd('hyprctl notify 1 2500 "rgb(cba6f7)" "State: Volume"')
    hl.dispatch(hl.dsp.submap("Volume"))
  end)
  hl.bind("b", function()
    hl.exec_cmd('hyprctl notify 1 2500 "rgb(cba6f7)" "State: Brightness"')
    hl.dispatch(hl.dsp.submap("Brightness"))
  end)
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("S", "System")


-- ---------------------------------------------------------
-- 2. ALT + L -> Learning & Data Science Docs
-- ---------------------------------------------------------
hl.define_submap("Learning", function()
  submap_cmd("c", "Cheatsheet Local", "omarchy-launch-webapp 'file:///home/spogus/Scripts/cheatsheet.html'")
  submap_cmd("q", "Qtile Docs", "omarchy-launch-webapp 'https://docs.qtile.org/'")
  submap_cmd("b", "Bash Docs", "omarchy-launch-webapp 'https://devhints.io/bash'")
  submap_cmd("v", "Vim Docs", "omarchy-launch-webapp 'https://devhints.io/vim'")
  submap_cmd("y", "Python Docs", "omarchy-launch-webapp 'https://docs.python.org/3/'")
  submap_cmd("p", "Pandas Docs", "omarchy-launch-webapp 'https://pandas.pydata.org/docs/'")
  submap_cmd("o", "Polars Docs", "omarchy-launch-webapp 'https://docs.pola.rs/'")
  submap_cmd("m", "Matplotlib Docs", "omarchy-launch-webapp 'https://matplotlib.org/stable/contents.html'")
  submap_cmd("n", "NumPy Docs", "omarchy-launch-webapp 'https://numpy.org/doc/stable/user/quickstart.html'")
  submap_cmd("s", "Streamlit Docs", "omarchy-launch-webapp 'https://docs.streamlit.io/'")
  submap_cmd("t", "Plotly Docs", "omarchy-launch-webapp 'https://plotly.com/python/'")
  submap_cmd("l", "SQL Cheat Sheet", "omarchy-launch-webapp 'https://www.sqlshack.com/sql-cheat-sheet/'")
  submap_cmd("g", "PostgreSQL Docs", "omarchy-launch-webapp 'https://www.postgresql.org/docs/'")
  submap_cmd("d", "Data Science Menu", "omarchy-menu datascience")
  submap_cmd("a", "Airflow Docs", "omarchy-launch-webapp 'https://airflow.apache.org/docs/apache-airflow/stable/index.html'")
  submap_cmd("r", "Relax RelAlg", "omarchy-launch-webapp 'https://dbis-uibk.github.io/relax/calc/local/misc/local/0'")
  submap_cmd("h", "OpenStax Biology", "omarchy-launch-webapp 'https://openstax.org/books/biology-2e/pages/2-1-atoms-isotopes-ions-and-molecules-the-building-blocks'")
  submap_cmd("j", "JupyterLab Docs", "omarchy-launch-webapp 'https://jupyterlab.readthedocs.io/en/stable/'")
  submap_cmd("k", "Scikit-Learn Docs", "omarchy-launch-webapp 'https://scikit-learn.org/stable/'")
  submap_cmd("f", "PyTorch Docs", "omarchy-launch-webapp 'https://pytorch.org/docs/stable/index.html'")
  submap_cmd("e", "Metabase Docs", "omarchy-launch-webapp 'https://www.metabase.com/docs/latest/'")
  submap_cmd("w", "TensorFlow Docs", "omarchy-launch-webapp 'https://www.tensorflow.org/api_docs/python/tf'")
  submap_cmd("u", "Numba Docs", "omarchy-launch-webapp 'https://numba.readthedocs.io/en/stable/'")
  submap_cmd("i", "SciPy Docs", "omarchy-launch-webapp 'https://docs.scipy.org/doc/scipy/'")
  submap_cmd("x", "Seaborn Docs", "omarchy-launch-webapp 'https://seaborn.pydata.org/'")
  submap_cmd("z", "Hugging Face Docs", "omarchy-launch-webapp 'https://huggingface.co/docs/transformers/index'")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("L", "Learning")


-- ---------------------------------------------------------
-- 3. ALT + P -> Programming & Dev
-- ---------------------------------------------------------
hl.define_submap("Programming", function()
  submap_cmd("e", "Zed Editor", "zeditor")
  submap_cmd("t", "Terminal", "uwsm-app -- xdg-terminal-exec")
  submap_cmd("j", "JupyterLab", "uwsm-app -- xdg-terminal-exec -e jupyter-lab")
  submap_cmd("g", "Lazygit", "uwsm-app -- xdg-terminal-exec -e lazygit")
  submap_cmd("SHIFT + G", "GitHub Web", "omarchy-launch-webapp 'https://github.com/'")
  submap_cmd("d", "Discord", "omarchy-launch-webapp 'https://discord.com/channels/@me'")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("P", "Programming")


-- ---------------------------------------------------------
-- 4. ALT + O -> Office & Documents
-- ---------------------------------------------------------
hl.define_submap("Office", function()
  submap_cmd("n", "Obsidian", "obsidian")
  submap_cmd("o", "OnlyOffice", "onlyoffice-desktopeditors")
  submap_cmd("d", "Google Docs", "omarchy-launch-webapp 'https://docs.google.com/document/u/0/'")
  submap_cmd("s", "Google Sheets", "omarchy-launch-webapp 'https://docs.google.com/spreadsheets/u/0/'")
  submap_cmd("p", "Okular PDF", "okular")
  submap_cmd("z", "Zathura PDF", "zathura")
  submap_cmd("t", "DeepL Translator", "omarchy-launch-webapp 'https://www.deepl.com/en/translator'")
  submap_cmd("w", "WordReference", "omarchy-launch-webapp 'https://www.wordreference.com/definicion/'")
  submap_cmd("SHIFT + W", "Wikipedia ES", "omarchy-launch-webapp 'https://es.wikipedia.org/wiki/'")
  submap_cmd("e", "Excalidraw", "omarchy-launch-webapp 'https://excalidraw.com/'")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("O", "Office")


-- ---------------------------------------------------------
-- 5. ALT + I -> IA & Voice
-- ---------------------------------------------------------
hl.define_submap("IA", function()
  submap_cmd("v", "Voice Dictation", "voxtype record toggle")
  submap_cmd("a", "Omarchy Agent", "omarchy-agent --pick")
  submap_cmd("c", "Claude AI", "omarchy-launch-webapp 'https://claude.ai/'")
  submap_cmd("g", "ChatGPT", "omarchy-launch-webapp 'https://chatgpt.com/'")
  submap_cmd("m", "Google Gemini", "omarchy-launch-webapp 'https://gemini.google.com/app'")
  submap_cmd("p", "Perplexity AI", "omarchy-launch-webapp 'https://www.perplexity.ai/'")
  submap_cmd("d", "DeepSeek Chat", "omarchy-launch-webapp 'https://chat.deepseek.com/'")
  submap_cmd("k", "Kimi AI", "omarchy-launch-webapp 'https://www.kimi.com/'")
  submap_cmd("n", "NotebookLM", "omarchy-launch-webapp 'https://notebooklm.google.com/'")
  submap_cmd("o", "OpenCode TUI", "uwsm-app -- xdg-terminal-exec -e opencode")
  submap_cmd("x", "Grok AI", "omarchy-launch-webapp 'https://x.com/i/grok'")
  submap_cmd("f", "Phind AI", "omarchy-launch-webapp 'https://www.phind.com/'")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("I", "IA")


-- ---------------------------------------------------------
-- 6. ALT + N -> NAV (Navegación & Web)
-- ---------------------------------------------------------
hl.define_submap("NAV", function()
  submap_cmd("b", "Web Browser", "omarchy-launch-browser")
  submap_cmd("y", "YouTube", "omarchy-launch-webapp 'https://www.youtube.com'")
  submap_cmd("s", "YouTube Studio", "omarchy-launch-webapp 'https://studio.youtube.com/'")
  submap_cmd("t", "Telegram Web", "omarchy-launch-webapp 'https://web.telegram.org/a/'")
  submap_cmd("w", "WhatsApp Web", "omarchy-launch-or-focus-webapp WhatsApp 'https://web.whatsapp.com/'")
  submap_cmd("x", "X / Twitter", "omarchy-launch-webapp 'https://x.com/'")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("N", "NAV")


-- ---------------------------------------------------------
-- 7. ALT + U -> UNLP
-- ---------------------------------------------------------
hl.define_submap("UNLP", function()
  submap_cmd("a", "AU24 Económicas", "omarchy-launch-webapp 'https://www.au24-2021.econo.unlp.edu.ar/'")
  submap_cmd("l", "Cátedras LINTI", "omarchy-launch-webapp 'https://catedras.linti.unlp.edu.ar/index.php?'")
  submap_cmd("i", "IDEAS Informática", "omarchy-launch-webapp 'https://ideas.info.unlp.edu.ar/'")
  submap_cmd("m", "Asignaturas Moodle", "omarchy-launch-webapp 'https://asignaturas.info.unlp.edu.ar/my/'")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("U", "UNLP")


-- ---------------------------------------------------------
-- 8. ALT + M -> Menús Omarchy & Apariencia
-- ---------------------------------------------------------
hl.define_submap("Menus", function()
  submap_cmd("m", "Omarchy Main Menu", "omarchy-menu toggle")
  submap_cmd("a", "Apps Menu", "omarchy-menu toggle apps")
  submap_cmd("e", "Emojis Picker", "omarchy-shell shell toggle omarchy.emojis")
  submap_cmd("b", "Background Switcher", "omarchy-menu toggle background")
  submap_cmd("t", "Theme Menu", "omarchy-menu toggle theme")
  submap_cmd("s", "Share Menu", "omarchy-menu toggle share")
  submap_cmd("h", "Hardware Menu", "omarchy-menu toggle hardware")
  submap_cmd("v", "Toggle Top Bar", "omarchy-shell -q bar toggle")
  submap_cmd("k", "Keybindings Menu", "omarchy-menu-keybindings")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("M", "Menus")


-- ---------------------------------------------------------
-- 9. ALT + R -> Recordatorios & Notificaciones
-- ---------------------------------------------------------
hl.define_submap("Reminders", function()
  submap_cmd("d", "Dismiss Notification", "omarchy-shell notifications dismissOne")
  submap_cmd("a", "Dismiss All Notifications", "omarchy-shell notifications dismissAll")
  submap_cmd("s", "Silence Notifications", "omarchy-shell notifications toggleSilence")
  submap_cmd("h", "Notification History", "omarchy-shell notifications showHistory")
  submap_cmd("n", "Set Reminder", "omarchy-menu toggle reminder-set")
  submap_cmd("v", "Show Reminders", "omarchy-reminder show")
  submap_cmd("c", "Clear Reminders", "omarchy-reminder clear")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("R", "Reminders")


-- ---------------------------------------------------------
-- 10. ALT + T -> TTS (Text to Speech)
-- ---------------------------------------------------------
hl.define_submap("TTS", function()
  submap_cmd("p", "Piper TTS ES", "bash -c 'pc=$(hostname | grep -qi hostgus && echo 1 || echo 0); ~/Scripts/piper_say$pc.sh'")
  submap_cmd("e", "Piper TTS EN", "~/Scripts/piper_say_en.sh")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
bind_submap("T", "TTS")


-- ---------------------------------------------------------
-- Hardware Submaps (Volume & Brightness)
-- ---------------------------------------------------------
hl.define_submap("Volume", function()
  hl.bind("k", function() hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+") end, { repeat_trigger = true })
  hl.bind("K", function() hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+") end, { repeat_trigger = true })
  hl.bind("j", function() hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") end, { repeat_trigger = true })
  hl.bind("J", function() hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") end, { repeat_trigger = true })
  submap_cmd("m", "Mute Toggle", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)

hl.define_submap("Brightness", function()
  hl.bind("k", function() hl.exec_cmd("bash -c 'if (( $(brightnessctl get) <= 4800 )); then brightnessctl set 1%+; else brightnessctl set 5%+; fi'") end, { repeat_trigger = true })
  hl.bind("K", function() hl.exec_cmd("bash -c 'if (( $(brightnessctl get) <= 4800 )); then brightnessctl set 1%+; else brightnessctl set 5%+; fi'") end, { repeat_trigger = true })
  hl.bind("j", function() hl.exec_cmd("bash -c 'if (( $(brightnessctl get) <= 4800 )); then brightnessctl set 1%-; else brightnessctl set 5%-; fi'") end, { repeat_trigger = true })
  hl.bind("J", function() hl.exec_cmd("bash -c 'if (( $(brightnessctl get) <= 4800 )); then brightnessctl set 1%-; else brightnessctl set 5%-; fi'") end, { repeat_trigger = true })
  hl.bind("ESCAPE", function() hl.dispatch(hl.dsp.submap("reset")) end)
end)
