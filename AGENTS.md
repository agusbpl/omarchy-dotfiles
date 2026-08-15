# Hyprland Keybindings & Submap HUD Architecture

Guidance for AI agents modifying Hyprland bindings, submaps, or the cheatsheet HUD overlay.

---

## 1. Architecture Overview

- **Keybindings Definition**: `hypr/.config/hypr/bindings.lua` (Omarchy Lua config loaded by `hyprland.lua`).
- **Visual HUD Overlay Daemon**: `hypr/.config/hypr/scripts/submap_hud.py` (GTK3 + `GtkLayerShell` overlay).
- **Layer Shell Rules**: `hypr/.config/hypr/looknfeel.conf` (`layerrule = noanim, submap_hud`).

---

## 2. Keybindings & Submaps (`bindings.lua`)

### Submap Trigger Hierarchy
- **Master Hub (`ALT + Enter`)**: Central entry point to navigate to all submap categories.
- **Direct Submaps**:
  - `ALT + S` ➔ `System` (Hardware, power, wifi, bluetooth, screenshot)
  - `ALT + L` ➔ `Learning` (Docs, cheat sheets, Data Science, AI docs)
  - `ALT + P` ➔ `Programming` (Editor, terminal, git, notebooks)
  - `ALT + O` ➔ `Office` (Notes, docs, sheets, PDFs, tools)
  - `ALT + I` ➔ `IA` (AI webapps, TUI agents, voice dictation)
  - `ALT + N` ➔ `NAV` (Browser, video, social, messaging)
  - `ALT + U` ➔ `UNLP` (University portals)
  - `ALT + M` ➔ `Menus` (Omarchy system menus)
  - `ALT + R` ➔ `Reminders` (Omarchy notifications & reminders)
  - `ALT + T` ➔ `TTS` (Speech synthesis)
  - `Volume` / `Brightness` ➔ Quick slider adjustments

### Submap Helper Pattern
```lua
local function dismiss_cheatsheet()
  hl.exec_cmd("python /home/spogus/.config/hypr/scripts/submap_hud.py hide")
end

local function reset_submap()
  hl.dispatch(hl.dsp.submap("reset"))
  dismiss_cheatsheet()
end

local function show_submap_cheatsheet(submap_name)
  hl.exec_cmd(string.format("python /home/spogus/.config/hypr/scripts/submap_hud.py show %q", submap_name))
end

local function submap_cmd(keys, description, command)
  local function action()
    reset_submap() -- MUST reset submap and hide HUD before executing command
    if type(command) == "string" then
      hl.exec_cmd(command)
    elseif type(command) == "function" then
      command()
    end
  end
  -- binds keys...
end
```

### Critical Rules
1. **Reset Before Command**: In `submap_cmd`, `reset_submap()` must always be executed **before** `hl.exec_cmd(command)`.
2. **Screen Capture Buffering**: Tools that freeze/capture the screen (`omarchy-capture-screenshot`) must be prefixed with `sleep 0.08 && ...` so the Wayland compositor completes layer unmapping before snapshotting.

---

## 3. Submap HUD Daemon (`submap_hud.py`)

### Communication Mechanism
- Operates a local UNIX domain socket at `/tmp/submap_hud_<uid>.sock`.
- CLI invocations (`python submap_hud.py show <submap>` or `python submap_hud.py hide`) send commands to the running daemon.
- If no daemon is running, `show` automatically spawns a detached daemon with `--daemon <submap>`.

### Performance & Lazy Loading
- GTK and GtkLayerShell imports (`gi.repository`, `Gtk`, `Gdk`, `GLib`, `GtkLayerShell`) **must remain lazy inside `run_daemon()`**.
- The client sender must only import standard library modules (`sys`, `os`, `socket`) to maintain ~5ms instant socket transmission.

### Layout & Sizing
- **Multi-column scaling**: Submaps with more than 14 entries (e.g. `Learning`) automatically render in a 2-column grid.
- **Dynamic Requisition**: `self.resize(1, 1)` is called before `self.show_all()` whenever content updates to adjust window geometry to the active submap.
- **Immediate Wayland Flush**: `hide_submap()` calls `Gdk.Display.get_default().flush()` to commit unmapping immediately to Hyprland.

### Visual Styling (Omarchy Theme)
- Window: `#121826` / `rgba(18, 24, 38, 0.98)` with `1px solid #1e293b` border and `8px` corner radius.
- Fonts: `JetBrainsMono Nerd Font`.
- Key Badges: `#161f30` background, `#273750` border, `#7aa2f7` text.
- Header: Icon + Title (`#c0caf5`) + Uppercase Tag (`#566b88`) + Status Pill (`#7aa2f7`).
