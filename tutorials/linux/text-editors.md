# Text Editors

## Nano

Nano is a simple, user-friendly text editor included with most Linux distributions.

### Basic Usage
```bash
nano filename
```

### Keyboard Shortcuts
- `Ctrl + O`: Save (Write Out)
- `Ctrl + X`: Exit
- `Ctrl + W`: Search
- `Ctrl + K`: Cut line
- `Ctrl + U`: Paste
- `Ctrl + C`: Show cursor position
- `Ctrl + G`: Help

### Features
- Syntax highlighting (with nanorc configuration)
- Search and replace
- Line numbers
- Mouse support

## Vim

Vim (Vi IMproved) is a powerful, modal text editor.

### Modes
- Normal: For navigation and commands
- Insert: For typing text
- Visual: For selecting text
- Command-line: For commands

### Basic Commands
```bash
vim filename
```

#### Navigation (Normal mode)
- `h`, `j`, `k`, `l`: Move left, down, up, right
- `w`: Next word
- `b`: Previous word
- `0`: Beginning of line
- `$`: End of line
- `gg`: Beginning of file
- `G`: End of file
- `:[line]`: Go to line number

#### Editing
- `i`: Insert before cursor
- `a`: Insert after cursor
- `o`: Open new line below
- `O`: Open new line above
- `x`: Delete character
- `dd`: Delete line
- `yy`: Yank (copy) line
- `p`: Paste after cursor
- `u`: Undo
- `Ctrl + r`: Redo

#### Saving and Quitting
- `:w`: Write (save)
- `:q`: Quit
- `:wq` or `:x`: Write and quit
- `:q!`: Quit without saving

### Advanced Features
- Search: `/pattern`
- Replace: `:%s/old/new/g`
- Multiple files: `:e filename`
- Split windows: `:vsplit` or `:split`

## Emacs

Emacs is a highly extensible text editor.

### Basic Usage
```bash
emacs filename
```

### Key Bindings
- `Ctrl + x Ctrl + s`: Save
- `Ctrl + x Ctrl + c`: Exit
- `Ctrl + k`: Kill (cut) line
- `Ctrl + y`: Yank (paste)
- `Ctrl + s`: Search forward
- `Ctrl + r`: Search backward

### Features
- Built-in Lisp interpreter
- Email client, web browser, etc.
- Highly customizable

## Choosing an Editor

- **Nano**: Best for beginners and quick edits
- **Vim**: Powerful for advanced users, ubiquitous on servers
- **Emacs**: Most feature-rich, steeper learning curve

## Configuration

### Nano
Edit `~/.nanorc`:
```
set linenumbers
set mouse
include "/usr/share/nano/*.nanorc"
```

### Vim
Edit `~/.vimrc`:
```
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
```

### Emacs
Edit `~/.emacs` or `~/.emacs.d/init.el`:
```
(global-linum-mode t)
(setq-default tab-width 4)
```

## Practice Exercises

1. Create a file with Nano and write a short paragraph.
2. Open the same file with Vim and make some edits.
3. Practice Vim navigation and editing commands.
4. Configure your preferred editor with basic settings.

Next, we'll cover package management with APT.
