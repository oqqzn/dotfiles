# Dotfiles

For macOS and Unix-like systems.

## Includes

- `.bashrc` / `.bash_profile` for shell config
  - Secure handling of environment secrets via `.env` (will need to be configured in ~/)
- `.tmux.conf` for terminal multiplexing
- Full Neovim setup (`~/.config/nvim`)
- A local Python virtual environment for `pynvim`
- An `install.sh` to automate it all

---

## Setup Instructions

### 1. Clone the repo

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run the install script

```bash
./install.sh
```

The script will symlink the following:

- `~/dotfiles/.bashrc` → `~/.bashrc`
- `~/dotfiles/.bash_profile` → `~/.bash_profile`
- `~/dotfiles/.tmux.conf` → `~/.tmux.conf`
- `~/dotfiles/.config/nvim` → `~/.config/nvim`

It will also:
- Create a Neovim-local Python virtualenv at `~/.config/nvim/.venv`
- Install `pynvim` into that virtualenv

---

## Neovim Python Provider Setup

The virtualenv is created automatically by `install.sh`. If you ever want to recreate it manually:

```bash
python3 -m venv ~/.config/nvim/.venv
~/.config/nvim/.venv/bin/pip install --upgrade pip pynvim
```

Your `providers.lua` is already set to use this path:

```lua
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/.venv/bin/python3")
```

---

## Secrets and Environment Variables

Secrets (e.g., API keys for AWS, OpenAI) are stored in a separate `.env` file that is not tracked by Git.

### Create the file manually:

```bash
touch ~/.env
chmod 600 ~/.env
```

### Then add your keys:

```bash
export AWS_ACCESS_KEY_ID=your_key
export AWS_SECRET_ACCESS_KEY=your_secret
export OPENAI_API_KEY="your_openai_key"
```

Your `.bashrc` includes this line to load it automatically:

```bash
[ -f ~/.env ] && source ~/.env
```

---

## Confirm Everything Works

After setup, run:

```bash
echo $OPENAI_API_KEY
```

You should see:
- Your key printed to terminal

---

## 📁 Project Structure

```
~/dotfiles/
├── .bashrc
├── .bash_profile
├── .tmux.conf
├── install.sh
├── .gitignore
├── .config/
│   └── nvim/
│       ├── init.lua
│       ├── lua/
│       │   └── oqqzn/
│       │       ├── core/
│       │       ├── lazy.lua
│       │       └── plugins/
│       └── .venv/ (not tracked)
└── README.md

```

---

## ⚠️ Git Hygiene

These are ignored in `.gitignore`:

```
.env
.config/nvim/lazy-lock.json
.config/nvim/.venv/
```

**Make sure you never commit `.env` or `.venv`.**

---

## Extras / Recommended

- **Nerd Font** (e.g., Hack Nerd Font)
- **Catppuccin Mocha** for terminal theme
- **Required tools**: `tmux`, `neovim`, `git`, and `python3`

---

## Notes

- All config files are stored in `~/dotfiles` and symlinked into place
- **Do not version** `.venv` or `.env`
- You can edit configs in the `~/dotfiles` repo directly
- Changes apply immediately thanks to symlinks

---

## Reset/Rebuild Tips

- Delete `~/.config/nvim/.venv` to reset the Python environment
- Update `~/.env` if rotating credentials
- Rerun `./install.sh` to relink dotfiles

---

## License

Personal use only. Adapt, fork, remix at your own risk.
