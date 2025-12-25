# Dotfiles

My personal dotfiles managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Prerequisites

- `git`
- `curl`
- `python3` (for Dotbot)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/Projects/Dotfiles
   cd ~/Projects/Dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install
   ```

## Features

- **Zsh**: Managed with [Antidote](https://github.com/mattmc3/antidote).
- **Vim**: Managed with [vim-plug](https://github.com/junegunn/vim-plug).
- **Tmux**: Managed with [TPM](https://github.com/tmux-plugins/tpm).
- **Git**: Includes `delta` for better diffs.
- **Starship**: Cross-shell prompt.
- **Mise**: Runtime version manager.

## Customization

- **Git**: Create `~/.gitconfig.local` for machine-specific git configuration (e.g., work email).
- **SSH**: The installation script automatically includes the `ssh/config` from this repository in your `~/.ssh/config`. Add your keys to `~/.ssh/`.
