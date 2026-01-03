# Clipboard Image for Claude Code (WSL)

Paste Windows clipboard images directly into Claude Code when running in WSL.

## Quick Install

```bash
git clone https://github.com/Asifm95/claude-wsl-image-paste.git
cd claude-wsl-image-paste
./install.sh
```

Then restart your terminal or run `source ~/.bashrc`.

## What Gets Installed

| Component      | Location              | Purpose                                    |
| -------------- | --------------------- | ------------------------------------------ |
| `pimg` CLI     | `~/.local/bin/pimg`   | Saves clipboard image to current directory |
| `/paste-image` | `~/.claude/commands/` | Claude Code slash command                  |

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
pimg                  # Auto-named: img_20260104_143052.png
pimg screenshot       # Named: screenshot.png
```

## Example Workflow

1. **Screenshot**: Press `Win + Shift + S`
2. **Paste**: Type `/paste-image` in Claude Code
3. **Ask**: "Build this UI in React" or "What's wrong with this error?"

## Troubleshooting

**"No image in clipboard"**

-   Copy an image first (Win+Shift+S, or right-click → Copy on any image)

**"command not found: pimg"**

-   Run `source ~/.bashrc` or restart your terminal
-   Or add `~/.local/bin` to your PATH manually

**PowerShell errors**

-   Test with: `powershell.exe -Command "echo test"`
-   Make sure WSL can access Windows executables

## How It Works

1. `/paste-image` triggers the slash command
2. Claude runs `pimg` which calls PowerShell
3. PowerShell grabs the image from Windows clipboard
4. Image is saved to your current directory
5. Claude receives the file path and can work with the image

## Uninstall

```bash
rm ~/.local/bin/pimg
rm ~/.claude/commands/paste-image.md
```
