const qtileKeys = [
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "h",
        "desc": "Move focus to left"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "l",
        "desc": "Move focus to right"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "j",
        "desc": "Move focus down"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "k",
        "desc": "Move focus up"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "space",
        "desc": "Move window focus to other window"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "shift"
        ],
        "key": "h",
        "desc": "Move window to the left"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "shift"
        ],
        "key": "l",
        "desc": "Move window to the right"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "shift"
        ],
        "key": "j",
        "desc": "Move window down"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "shift"
        ],
        "key": "k",
        "desc": "Move window up"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "control"
        ],
        "key": "h",
        "desc": "Grow window to the left"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "control"
        ],
        "key": "l",
        "desc": "Grow window to the right"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "control"
        ],
        "key": "j",
        "desc": "Grow window down"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "control"
        ],
        "key": "k",
        "desc": "Grow window up"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "n",
        "desc": "Reset all window sizes"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "shift"
        ],
        "key": "Return",
        "desc": "Toggle between split and unsplit sides of stack"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "Return",
        "desc": "Launch terminal"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "mod1"
        ],
        "key": "space",
        "desc": "Launch an app"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "Tab",
        "desc": "Toggle between layouts"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "w",
        "desc": "Kill focused window"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "f",
        "desc": "Toggle fullscreen on the focused window"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "t",
        "desc": "Toggle floating on the focused window"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "control"
        ],
        "key": "s",
        "desc": "Toggle sticky window"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4"
        ],
        "key": "b",
        "desc": "Toggle bar visibility"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "control"
        ],
        "key": "r",
        "desc": "Reload the config"
    },
    {
        "type": "Key",
        "modifiers": [
            "mod4",
            "control"
        ],
        "key": "q",
        "desc": "Shutdown Qtile"
    },
    {
        "type": "KeyChord",
        "name": "Office",
        "modifiers": [
            "mod1"
        ],
        "key": "o",
        "submappings": [
            {
                "modifiers": [],
                "key": "n",
                "desc": "Notes"
            },
            {
                "modifiers": [],
                "key": "o",
                "desc": "Office Suite"
            },
            {
                "modifiers": [],
                "key": "d",
                "desc": "Google Docs"
            },
            {
                "modifiers": [],
                "key": "s",
                "desc": "Google Sheets"
            },
            {
                "modifiers": [],
                "key": "p",
                "desc": "PDF Reader"
            },
            {
                "modifiers": [],
                "key": "z",
                "desc": "Zathura"
            },
            {
                "modifiers": [],
                "key": "t",
                "desc": "DeepL (Translator)"
            },
            {
                "modifiers": [],
                "key": "w",
                "desc": "Wordreference (Dictionary)"
            },
            {
                "modifiers": [
                    "shift"
                ],
                "key": "w",
                "desc": "Wikipedia"
            },
            {
                "modifiers": [],
                "key": "e",
                "desc": "Excalidraw"
            }
        ]
    },
    {
        "type": "KeyChord",
        "name": "Programming",
        "modifiers": [
            "mod1"
        ],
        "key": "p",
        "submappings": [
            {
                "modifiers": [],
                "key": "e",
                "desc": "Code Editor"
            },
            {
                "modifiers": [],
                "key": "t",
                "desc": "Pure Terminal"
            },
            {
                "modifiers": [],
                "key": "j",
                "desc": "Jupyter Lab"
            },
            {
                "modifiers": [],
                "key": "g",
                "desc": "Lazygit"
            },
            {
                "modifiers": [
                    "shift"
                ],
                "key": "g",
                "desc": "GitHub Web"
            },
            {
                "modifiers": [],
                "key": "d",
                "desc": "Discord"
            }
        ]
    },
    {
        "type": "KeyChord",
        "name": "Learning",
        "modifiers": [
            "mod1"
        ],
        "key": "l",
        "submappings": [
            {
                "modifiers": [],
                "key": "c",
                "desc": "My Cheatsheet"
            },
            {
                "modifiers": [],
                "key": "q",
                "desc": "Qtile Docs"
            },
            {
                "modifiers": [],
                "key": "b",
                "desc": "Bash Cheatsheet"
            },
            {
                "modifiers": [],
                "key": "v",
                "desc": "Vim Cheatsheet"
            },
            {
                "modifiers": [],
                "key": "y",
                "desc": "Python Docs"
            },
            {
                "modifiers": [],
                "key": "p",
                "desc": "Pandas Docs"
            },
            {
                "modifiers": [],
                "key": "o",
                "desc": "Polars Docs"
            },
            {
                "modifiers": [],
                "key": "m",
                "desc": "Matplotlib Docs"
            },
            {
                "modifiers": [],
                "key": "n",
                "desc": "Numpy Docs"
            },
            {
                "modifiers": [],
                "key": "s",
                "desc": "Streamlit Docs"
            },
            {
                "modifiers": [],
                "key": "t",
                "desc": "Plotly Docs"
            },
            {
                "modifiers": [],
                "key": "l",
                "desc": "SQL Cheatsheet"
            },
            {
                "modifiers": [],
                "key": "g",
                "desc": "Postgres Docs"
            },
            {
                "modifiers": [],
                "key": "d",
                "desc": "Metabase Docs"
            },
            {
                "modifiers": [],
                "key": "a",
                "desc": "Airflow Docs"
            },
            {
                "modifiers": [],
                "key": "r",
                "desc": "Relational Algebra Calculator"
            },
            {
                "modifiers": [],
                "key": "h",
                "desc": "Biology (OpenStax)"
            }
        ]
    },
    {
        "type": "KeyChord",
        "name": "IA",
        "modifiers": [
            "mod1"
        ],
        "key": "i",
        "submappings": [
            {
                "modifiers": [],
                "key": "c",
                "desc": "Claude"
            },
            {
                "modifiers": [],
                "key": "g",
                "desc": "ChatGPT"
            },
            {
                "modifiers": [],
                "key": "a",
                "desc": "Gemini"
            },
            {
                "modifiers": [],
                "key": "p",
                "desc": "Perplexity"
            },
            {
                "modifiers": [],
                "key": "d",
                "desc": "DeepSeek"
            },
            {
                "modifiers": [],
                "key": "m",
                "desc": "Mistral"
            },
            {
                "modifiers": [],
                "key": "k",
                "desc": "Kimi"
            },
            {
                "modifiers": [],
                "key": "n",
                "desc": "NotebookLM"
            },
            {
                "modifiers": [],
                "key": "o",
                "desc": "Opencode"
            },
            {
                "modifiers": [],
                "key": "x",
                "desc": "Grok"
            },
            {
                "modifiers": [],
                "key": "e",
                "desc": "Poe"
            },
            {
                "modifiers": [],
                "key": "f",
                "desc": "Phind"
            },
            {
                "modifiers": [],
                "key": "h",
                "desc": "Hugging Face Chat"
            },
            {
                "modifiers": [],
                "key": "l",
                "desc": "Meta AI"
            },
            {
                "modifiers": [],
                "key": "r",
                "desc": "OpenRouter"
            },
            {
                "modifiers": [],
                "key": "z",
                "desc": "Leonardo AI"
            },
            {
                "modifiers": [],
                "key": "s",
                "desc": "AI Studio"
            }
        ]
    },
    {
        "type": "KeyChord",
        "name": "UNLP",
        "modifiers": [
            "mod1"
        ],
        "key": "u",
        "submappings": [
            {
                "modifiers": [],
                "key": "a",
                "desc": "AU24"
            },
            {
                "modifiers": [],
                "key": "l",
                "desc": "LINTI"
            },
            {
                "modifiers": [],
                "key": "i",
                "desc": "IDEAS"
            },
            {
                "modifiers": [],
                "key": "m",
                "desc": "mfi - info"
            }
        ]
    },
    {
        "type": "KeyChord",
        "name": "NAV",
        "modifiers": [
            "mod1"
        ],
        "key": "n",
        "submappings": [
            {
                "modifiers": [],
                "key": "b",
                "desc": "Browser"
            },
            {
                "modifiers": [],
                "key": "y",
                "desc": "YouTube"
            },
            {
                "modifiers": [],
                "key": "s",
                "desc": "YT Studio"
            },
            {
                "modifiers": [],
                "key": "t",
                "desc": "Telegram"
            }
        ]
    },
    {
        "type": "KeyChord",
        "name": "System",
        "modifiers": [
            "mod1"
        ],
        "key": "s",
        "submappings": [
            {
                "modifiers": [],
                "key": "f",
                "desc": "TUI File Browser"
            },
            {
                "modifiers": [
                    "shift"
                ],
                "key": "f",
                "desc": "GUI File Browser"
            },
            {
                "modifiers": [],
                "key": "m",
                "desc": "Monitor (Btop)"
            },
            {
                "modifiers": [],
                "key": "e",
                "desc": "Edit Qtile Configuration"
            },
            {
                "modifiers": [],
                "key": "n",
                "desc": "Network Manager (nmtui)"
            },
            {
                "modifiers": [
                    "shift"
                ],
                "key": "b",
                "desc": "Monitor (Btop)"
            },
            {
                "modifiers": [],
                "key": "c",
                "desc": "Activate Camera"
            },
            {
                "modifiers": [],
                "key": "r",
                "desc": "Toggle Video Script"
            },
            {
                "modifiers": [],
                "key": "s",
                "desc": "Screenshot"
            },
            {
                "modifiers": [],
                "key": "q",
                "desc": "Shutdown System"
            }
        ]
    },
    {
        "type": "KeyChord",
        "name": "TTS",
        "modifiers": [
            "mod1"
        ],
        "key": "t",
        "submappings": [
            {
                "modifiers": [],
                "key": "p",
                "desc": "Piper Say/Stop (ES)"
            },
            {
                "modifiers": [],
                "key": "e",
                "desc": "Piper Say/Stop (EN)"
            }
        ]
    }
];