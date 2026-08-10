#!/bin/bash

# Define file paths verbatim
CONFIG_FILE="$HOME/.config/i3/config"
CHEAT_SHEET="$HOME/.config/i3/cheat-sheet.txt"

# Extract the $mod variable value (e.g., Mod4)
MOD_KEY=$(grep "set \$mod" "$CONFIG_FILE" | awk '{print $3}')

{
    echo "=== WINDOWS AND SYSTEM ==="
    # Extract general bindsyms outside of modes, excluding workspace and launcher keys
    grep "bindsym \$mod+" "$CONFIG_FILE" | grep -vE "workspace|mode" | sed "s/bindsym \$mod/ \$mod/g" | sed 's/exec --no-startup-id //g'
    
    echo ""
    echo "=== NAVIGATION AND WORKSPACES ==="
    # Extract workspace switching and movement[cite: 1]
    grep -E "workspace number|rofi" "$CONFIG_FILE" | grep "bindsym" | sed "s/bindsym \$mod/ \$mod/g"

    echo ""
    echo "=== LAUNCHER MODE (Alt + l) ==="
    # Specifically extract the "Apps" mode bindings[cite: 1]
    # This grabs lines between 'mode $lanzador {' and the closing '}'
    sed -n '/mode \$lanzador {/,/}/p' "$CONFIG_FILE" | grep "bindsym" | sed 's/bindsym/Alt + l ->/g' | sed 's/, mode "default"//g' | sed 's/exec //g'

    echo ""
    echo "=== MEDIA AND HARDWARE ==="
    # Extract XF86 keys and Print screen[cite: 1]
    grep -E "XF86|Print" "$CONFIG_FILE" | grep "bindsym" | sed 's/bindsym --release //g' | sed 's/bindsym //g' | sed 's/exec --no-startup-id //g'

} > "$CHEAT_SHEET"

echo "cheat-sheet.txt has been updated based on config."
