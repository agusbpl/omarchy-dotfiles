#!/usr/bin/env python3
import sys
import os
import socket
import signal

SOCKET_PATH = f"/tmp/submap_hud_{os.getuid()}.sock"

SUBMAPS_DATA = {
    "Hub": {
        "icon": "⚡",
        "title": "Alt Hub",
        "tag": "MASTER SUBMAP [ALT + ENTER]",
        "entries": [
            ("s", "⚙️  System"),
            ("l", "📚  Learning"),
            ("p", "💻  Programming"),
            ("o", "📝  Office"),
            ("i", "🤖  AI"),
            ("n", "🌐  Navigation"),
            ("u", "🎓  UNLP"),
            ("m", "🎨  Menus"),
            ("r", "🔔  Reminders"),
            ("t", "🗣️  TTS"),
            ("v", "🔊  Volume..."),
            ("b", "☀️  Brightness..."),
        ],
    },
    "System": {
        "icon": "⚙️",
        "title": "System & Hardware",
        "tag": "SUBMAP [ALT + S]",
        "entries": [
            ("f", "Files (Nautilus)"),
            ("m", "Monitor (Btop)"),
            ("e", "Edit Binds"),
            ("w", "WiFi Menu"),
            ("b", "Bluetooth Menu"),
            ("c", "Activate Camera"),
            ("r", "Start Recording"),
            ("s", "Screenshot"),
            ("a", "Audio Settings"),
            ("p", "Clipboard History"),
            ("v", "Volume Control..."),
            ("l", "Brightness Control..."),
            ("q", "Shutdown System"),
        ],
    },
    "Learning": {
        "icon": "📚",
        "title": "Learning & Data Science",
        "tag": "SUBMAP [ALT + L]",
        "entries": [
            ("c", "Cheatsheet Local"),
            ("q", "Qtile Docs"),
            ("b", "Bash Docs"),
            ("v", "Vim Docs"),
            ("y", "Python Docs"),
            ("p", "Pandas Docs"),
            ("o", "Polars Docs"),
            ("m", "Matplotlib Docs"),
            ("n", "NumPy Docs"),
            ("s", "Streamlit Docs"),
            ("t", "Plotly Docs"),
            ("l", "SQL Cheat Sheet"),
            ("g", "PostgreSQL Docs"),
            ("d", "Data Science Menu"),
            ("a", "Airflow Docs"),
            ("r", "Relax RelAlg"),
            ("h", "OpenStax Biology"),
            ("j", "JupyterLab Docs"),
            ("k", "Scikit-Learn Docs"),
            ("f", "PyTorch Docs"),
            ("e", "Metabase Docs"),
            ("w", "TensorFlow Docs"),
            ("u", "Numba Docs"),
            ("i", "SciPy Docs"),
            ("x", "Seaborn Docs"),
            ("z", "Hugging Face Docs"),
        ],
    },
    "Programming": {
        "icon": "💻",
        "title": "Programming & Dev",
        "tag": "SUBMAP [ALT + P]",
        "entries": [
            ("e", "Zed Editor"),
            ("t", "Terminal"),
            ("j", "JupyterLab"),
            ("g", "Lazygit"),
            ("Shift+G", "GitHub Web"),
            ("d", "Discord"),
        ],
    },
    "Office": {
        "icon": "📝",
        "title": "Office & Documents",
        "tag": "SUBMAP [ALT + O]",
        "entries": [
            ("n", "Obsidian"),
            ("o", "OnlyOffice"),
            ("d", "Google Docs"),
            ("s", "Google Sheets"),
            ("p", "Okular PDF"),
            ("z", "Zathura PDF"),
            ("t", "DeepL Translator"),
            ("w", "WordReference"),
            ("Shift+W", "Wikipedia ES"),
            ("e", "Excalidraw"),
        ],
    },
    "IA": {
        "icon": "🤖",
        "title": "AI & Language Models",
        "tag": "SUBMAP [ALT + I]",
        "entries": [
            ("a", "Google Gemini"),
            ("c", "Claude AI"),
            ("g", "ChatGPT"),
            ("m", "Google Gemini"),
            ("p", "Perplexity AI"),
            ("d", "DeepSeek Chat"),
            ("k", "Kimi AI"),
            ("n", "NotebookLM"),
            ("o", "OpenCode TUI"),
            ("x", "Grok AI"),
            ("f", "Phind AI"),
            ("v", "Voice Dictation"),
        ],
    },
    "NAV": {
        "icon": "🌐",
        "title": "Navigation & Web",
        "tag": "SUBMAP [ALT + N]",
        "entries": [
            ("b", "Web Browser"),
            ("y", "YouTube"),
            ("s", "YouTube Studio"),
            ("t", "Telegram Web"),
            ("w", "WhatsApp Web"),
            ("x", "X / Twitter"),
        ],
    },
    "UNLP": {
        "icon": "🎓",
        "title": "UNLP University",
        "tag": "SUBMAP [ALT + U]",
        "entries": [
            ("a", "AU24 Económicas"),
            ("l", "Cátedras LINTI"),
            ("i", "IDEAS Informática"),
            ("m", "Asignaturas Moodle"),
        ],
    },
    "Menus": {
        "icon": "🎨",
        "title": "Omarchy Menus",
        "tag": "SUBMAP [ALT + M]",
        "entries": [
            ("m", "Omarchy Main Menu"),
            ("a", "Apps Menu"),
            ("e", "Emojis Picker"),
            ("b", "Background Switcher"),
            ("t", "Theme Menu"),
            ("s", "Share Menu"),
            ("h", "Hardware Menu"),
            ("v", "Toggle Top Bar"),
            ("k", "Keybindings Menu"),
        ],
    },
    "Reminders": {
        "icon": "🔔",
        "title": "Notifications & Reminders",
        "tag": "SUBMAP [ALT + R]",
        "entries": [
            ("d", "Dismiss Notification"),
            ("a", "Dismiss All Notifications"),
            ("s", "Silence Notifications"),
            ("h", "Notification History"),
            ("n", "Set Reminder"),
            ("v", "Show Reminders"),
            ("c", "Clear Reminders"),
        ],
    },
    "TTS": {
        "icon": "🗣️",
        "title": "Text to Speech (TTS)",
        "tag": "SUBMAP [ALT + T]",
        "entries": [
            ("p", "Piper TTS ES (Spanish)"),
            ("e", "Piper TTS EN (English)"),
        ],
    },
    "Volume": {
        "icon": "🔊",
        "title": "Volume Control",
        "tag": "QUICK ADJUST",
        "entries": [
            ("k / K", "+5% Volume Up"),
            ("j / J", "-5% Volume Down"),
            ("m", "Mute Toggle"),
        ],
    },
    "Brightness": {
        "icon": "☀️",
        "title": "Brightness Control",
        "tag": "QUICK ADJUST",
        "entries": [
            ("k / K", "Brightness Up"),
            ("j / J", "Brightness Down"),
        ],
    },
}

CSS = """
window {
    background-color: rgba(18, 24, 38, 0.98);
    border: 1px solid #1e293b;
    border-radius: 8px;
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.7);
}

.header-icon {
    font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
    font-size: 20px;
    color: #7aa2f7;
    margin-right: 10px;
}

.title-label {
    font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
    font-size: 14px;
    font-weight: bold;
    color: #c0caf5;
}

.tag-label {
    font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
    font-size: 9.5px;
    font-weight: bold;
    color: #566b88;
    margin-top: 1px;
}

.status-badge {
    font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
    font-size: 9.5px;
    font-weight: bold;
    color: #7aa2f7;
    background-color: #161f30;
    border: 1px solid #273750;
    border-radius: 4px;
    padding: 2px 7px;
}

.separator-line {
    min-height: 1px;
    background-color: #1e293b;
    margin: 6px 0 8px 0;
}

.key-badge {
    font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
    font-size: 11px;
    font-weight: bold;
    color: #7aa2f7;
    background-color: #161f30;
    border: 1px solid #273750;
    border-radius: 4px;
    padding: 2px 7px;
}

.desc-label {
    font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
    font-size: 12.5px;
    font-weight: normal;
    color: #a9b1d6;
}

.footer-box {
    margin-top: 2px;
}

.footer-key {
    font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
    font-size: 10px;
    font-weight: bold;
    color: #566b88;
    background-color: #141b29;
    border: 1px solid #1e293b;
    border-radius: 3px;
    padding: 1px 5px;
    margin-right: 6px;
}

.footer-desc {
    font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
    font-size: 11px;
    color: #566b88;
}
"""

def send_to_daemon(msg):
    if not os.path.exists(SOCKET_PATH):
        return False
    try:
        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        s.settimeout(0.5)
        s.connect(SOCKET_PATH)
        s.sendall(msg.encode("utf-8"))
        s.close()
        return True
    except Exception:
        return False

def run_daemon(initial_submap=None):
    import gi
    gi.require_version("Gtk", "3.0")
    gi.require_version("GtkLayerShell", "0.1")
    from gi.repository import Gtk, Gdk, GLib, GtkLayerShell

    class SubmapHudDaemon(Gtk.Window):
        def __init__(self):
            super().__init__()
            self.timer_id = None

            # Layer Shell Setup
            GtkLayerShell.init_for_window(self)
            GtkLayerShell.set_namespace(self, "submap_hud")
            GtkLayerShell.set_layer(self, GtkLayerShell.Layer.OVERLAY)
            GtkLayerShell.set_keyboard_mode(self, GtkLayerShell.KeyboardMode.NONE)
            GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.TOP, True)
            GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.RIGHT, True)
            GtkLayerShell.set_margin(self, GtkLayerShell.Edge.TOP, 54)
            GtkLayerShell.set_margin(self, GtkLayerShell.Edge.RIGHT, 20)

            # CSS Styling
            style_provider = Gtk.CssProvider()
            style_provider.load_from_data(CSS.encode("utf-8"))
            Gtk.StyleContext.add_provider_for_screen(
                Gdk.Screen.get_default(),
                style_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            )

            self.main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=4)
            self.main_box.set_margin_top(12)
            self.main_box.set_margin_bottom(10)
            self.main_box.set_margin_start(14)
            self.main_box.set_margin_end(14)

            # Header Box (Icon + Title/Tag + Status Badge)
            self.header_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=0)
            
            self.icon_lbl = Gtk.Label(label="⚡", xalign=0.0)
            self.icon_lbl.get_style_context().add_class("header-icon")
            self.header_box.pack_start(self.icon_lbl, False, False, 0)

            self.title_vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
            self.title_lbl = Gtk.Label(label="", xalign=0.0)
            self.title_lbl.get_style_context().add_class("title-label")
            self.title_vbox.pack_start(self.title_lbl, False, False, 0)

            self.tag_lbl = Gtk.Label(label="", xalign=0.0)
            self.tag_lbl.get_style_context().add_class("tag-label")
            self.title_vbox.pack_start(self.tag_lbl, False, False, 0)
            self.header_box.pack_start(self.title_vbox, True, True, 0)

            self.badge_lbl = Gtk.Label(label="ACTIVE", xalign=1.0)
            self.badge_lbl.get_style_context().add_class("status-badge")
            self.header_box.pack_end(self.badge_lbl, False, False, 0)

            self.main_box.pack_start(self.header_box, False, False, 0)

            self.top_sep = Gtk.Box()
            self.top_sep.get_style_context().add_class("separator-line")
            self.main_box.pack_start(self.top_sep, False, False, 0)

            # Dynamic Content Container
            self.content_holder = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
            self.main_box.pack_start(self.content_holder, True, True, 0)

            self.bot_sep = Gtk.Box()
            self.bot_sep.get_style_context().add_class("separator-line")
            self.main_box.pack_start(self.bot_sep, False, False, 0)

            # Footer Box
            self.footer_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=0)
            self.footer_box.get_style_context().add_class("footer-box")

            self.footer_key = Gtk.Label(label="ESC")
            self.footer_key.get_style_context().add_class("footer-key")
            self.footer_box.pack_start(self.footer_key, False, False, 0)

            self.footer_desc = Gtk.Label(label="Cancel / Exit")
            self.footer_desc.get_style_context().add_class("footer-desc")
            self.footer_box.pack_start(self.footer_desc, False, False, 0)

            self.main_box.pack_start(self.footer_box, False, False, 0)

            self.add(self.main_box)

            # Setup Socket Server
            self.init_socket_server()

        def init_socket_server(self):
            if os.path.exists(SOCKET_PATH):
                try:
                    os.remove(SOCKET_PATH)
                except OSError:
                    pass

            self.server_sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            self.server_sock.bind(SOCKET_PATH)
            self.server_sock.listen(5)
            self.server_sock.setblocking(False)

            GLib.io_add_watch(self.server_sock.fileno(), GLib.IO_IN, self.on_client_connect)

        def on_client_connect(self, source, condition):
            try:
                client, _ = self.server_sock.accept()
                client.setblocking(True)
                data = client.recv(1024).decode("utf-8").strip()
                client.close()
                if data:
                    self.handle_command(data)
            except Exception:
                pass
            return True

        def handle_command(self, cmd_line):
            parts = cmd_line.split(None, 1)
            action = parts[0].lower() if parts else ""
            submap_name = parts[1] if len(parts) > 1 else ""

            if action == "show":
                self.show_submap(submap_name)
            elif action == "hide":
                self.hide_submap()

        def show_submap(self, submap_name):
            if self.timer_id:
                GLib.source_remove(self.timer_id)
                self.timer_id = None

            data = SUBMAPS_DATA.get(submap_name, {
                "icon": "⚡",
                "title": f"Submap: {submap_name}",
                "tag": "CUSTOM SUBMAP",
                "entries": []
            })

            self.icon_lbl.set_text(data.get("icon", "⚡"))
            self.title_lbl.set_text(data.get("title", submap_name))
            self.tag_lbl.set_text(data.get("tag", "SUBMAP"))

            # Clear previous items
            for child in self.content_holder.get_children():
                self.content_holder.remove(child)

            entries = data["entries"]
            is_two_col = len(entries) > 14
            mid = (len(entries) + 1) // 2 if is_two_col else len(entries)

            grid = Gtk.Grid()
            grid.set_column_spacing(12)
            grid.set_row_spacing(5)

            for idx, (key, desc) in enumerate(entries):
                key_lbl = Gtk.Label(label=key, xalign=0.5)
                key_lbl.get_style_context().add_class("key-badge")

                desc_lbl = Gtk.Label(label=desc, xalign=0.0)
                desc_lbl.get_style_context().add_class("desc-label")

                if is_two_col:
                    if idx < mid:
                        col = 0
                        row = idx
                        desc_lbl.set_margin_end(16)
                    else:
                        col = 2
                        row = idx - mid
                    grid.attach(key_lbl, col, row, 1, 1)
                    grid.attach(desc_lbl, col + 1, row, 1, 1)
                else:
                    grid.attach(key_lbl, 0, idx, 1, 1)
                    grid.attach(desc_lbl, 1, idx, 1, 1)

            self.content_holder.pack_start(grid, True, True, 0)

            self.resize(1, 1)
            self.show_all()
            # Auto-hide after 15s of inactivity
            self.timer_id = GLib.timeout_add_seconds(15, self.on_timeout_hide)

        def hide_submap(self):
            if self.timer_id:
                GLib.source_remove(self.timer_id)
                self.timer_id = None
            self.hide()
            display = Gdk.Display.get_default()
            if display:
                display.flush()

        def on_timeout_hide(self):
            self.hide()
            display = Gdk.Display.get_default()
            if display:
                display.flush()
            self.timer_id = None
            return False

    def sig_handler(sig, frame):
        if os.path.exists(SOCKET_PATH):
            try:
                os.remove(SOCKET_PATH)
            except OSError:
                pass
        Gtk.main_quit()

    signal.signal(signal.SIGINT, sig_handler)
    signal.signal(signal.SIGTERM, sig_handler)

    daemon = SubmapHudDaemon()
    if initial_submap:
        daemon.show_submap(initial_submap)

    Gtk.main()

if __name__ == "__main__":
    args = sys.argv[1:]
    if not args:
        cmd = "hide"
    elif args[0] == "--daemon":
        initial = args[1] if len(args) > 1 else None
        run_daemon(initial)
        sys.exit(0)
    else:
        cmd = " ".join(args)

    # Try sending to existing daemon
    if not send_to_daemon(cmd):
        # Daemon is not running. If command is 'show', launch daemon in background
        if args and args[0] == "show":
            submap = args[1] if len(args) > 1 else "System"
            import subprocess
            subprocess.Popen(
                [sys.executable, os.path.abspath(__file__), "--daemon", submap],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                start_new_session=True,
            )
            sys.exit(0)
