# Neovim

## Requirements

- Neovim **0.12+**
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) **0.26.1+** (not from npm; distro packages are often too old)
- A C compiler, `curl`, `tar`, `git` (nvim-treesitter builds parsers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (telescope, grug-far, todo-comments)
- Optional formatters, used on save when found: `clang-format`, `rustfmt`, `gofmt`

## Fresh install

```sh
./deploy.sh nvim
nvim
```

lazy.nvim bootstraps itself on first launch and installs the plugins pinned in
`nvim/lazy-lock.json`. Keep Neovim open until the treesitter parsers and
language servers (mason) have finished installing.

## Updating an existing machine

1. Pull the dotfiles:
    ```sh
    git pull
    ```
2. Make sure the requirements above are met (`nvim --version`, `tree-sitter --version`).
3. Sync plugins to the lockfile, removing plugins that are no longer used:
    ```sh
    nvim --headless "+Lazy! clean" "+Lazy! restore" +qa
    ```
    Use `restore`, not `sync`/`update`: those move plugins past the lockfile
    and leave `lazy-lock.json` modified.
4. Open `nvim` once and wait for the parsers and the blink.cmp binary to
   finish installing.
5. Check the result:
    ```vim
    :checkhealth vim.deprecated vim.lsp blink.cmp
    ```

## Changes in the 0.12 migration

Removed plugins: lsp-zero, nvim-cmp (and its sources), Comment.nvim, undotree.
LSP now uses the built-in `vim.lsp.config`/`vim.lsp.enable`, and completion
uses blink.cmp.

New and changed keymaps (full list in [keymaps.md](keymaps.md)):

| Key / command | Action |
| --- | --- |
| `[d` / `]d` | Previous / next diagnostic (Neovim default; previously swapped) |
| `K` | Hover (Neovim default) |
| `gc` / `gcc` | Comment (built in). `gb`, `gbc`, `gco`, `gcO`, `gcA` are gone |
| `<leader>u` | Toggle the built-in undotree |
| `<leader>cl` | Copy `file:line` (visual: `file:start-end`) |
| `<leader>gd` | Toggle diffview of the working tree |
| `<leader>gh` | Git history of the current file |
| `<leader>S` | Project search/replace with grug-far (visual: selection) |
| `<leader>tf` | Toggle format on save (`:FormatToggle`, `:FormatToggle!` per buffer) |

### Format on save

- C/C++: only in projects with a `.clang-format` / `_clang-format`; otherwise
  nothing is formatted.
- Rust, Go: `rustfmt`, `gofmt`.
- Other filetypes: the language server's formatter, if it has one.

### Reloading files changed outside Neovim

Buffers reload when Neovim regains focus, e.g. after an agent edits files in
another tmux pane. This needs `focus-events on` in tmux, which
`tmux/.tmux.conf` already sets.
