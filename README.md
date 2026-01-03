# Clipboard Image for Claude Code (WSL)

Paste Windows clipboard images directly into Claude Code when running in WSL.

## Installation

```bash
# Extract and install
unzip clipboard-image-wsl.zip
cd clipboard-image
chmod +x install.sh
./install.sh
```

Then restart your terminal (or run `source ~/.bashrc`).

## Usage

### In Claude Code

```
/paste-image
```

Or with a custom filename:

```
/paste-image mockup
```

### Direct CLI

```bash
# Auto-named (img_20260104_143052.png)
pimg

# Custom name
pimg screenshot
pimg ui-design.png
```

## Workflow Example

1. Take a screenshot: `Win + Shift + S`
2. In Claude Code, type: `/paste-image`
3. Claude saves the image and asks what you want to do
4. Say: "Build this UI in React" or "What's wrong with this error?"

## Troubleshooting

**"No image in clipboard"**
- Copy an image first (Win+Shift+S, or right-click → Copy on any image)

**"command not found: pimg"**
- Run `source ~/.bashrc` or restart your terminal
- Or add `~/.local/bin` to your PATH manually

**PowerShell errors**
- Test with: `powershell.exe -Command "echo test"`
- Make sure WSL can access Windows executables

## How It Works

1. `/paste-image` triggers the slash command
2. Claude runs `pimg` which calls PowerShell
3. PowerShell grabs the image from Windows clipboard
4. Image is saved to your current directory
5. Claude receives the file path and can work with the image

## Files

```
clipboard-image/
├── pimg                      # Main script (installs to ~/.local/bin)
├── commands/
│   └── paste-image.md        # Slash command (installs to ~/.claude/commands)
├── install.sh                # Installer
└── README.md
```
