---
description: Paste image from Windows clipboard (WSL)
allowed-tools: Bash(pimg*), Bash(cat*), Read
---

# Paste Clipboard Image

The user wants to paste an image from their Windows clipboard.

Run the `pimg` command to save the clipboard image to the current directory:

```bash
pimg $ARGUMENTS
```

This will:
1. Get the image from the Windows clipboard
2. Save it to the current directory
3. Output the file path

If $ARGUMENTS is empty, it auto-generates a timestamped filename.
If $ARGUMENTS is provided, use it as the filename.

After successfully saving the image, acknowledge it and ask what the user wants to do with it (analyze, implement UI from mockup, etc.).

If the command fails with "No image in clipboard", tell the user to copy an image first (Win+Shift+S for screenshot).
