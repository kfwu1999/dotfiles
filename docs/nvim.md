# Neovim

## Requirements

- Neovim **0.12+**
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) **0.26.1+** — see [Installing tree-sitter](#installing-tree-sitter)
- A C compiler, `curl`, `tar`, `git` (nvim-treesitter builds parsers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (telescope, grug-far, todo-comments)
- Optional formatters, used on save (when enabled) if found: `clang-format`, `rustfmt`, `gofmt`

## Installing tree-sitter

nvim-treesitter's `main` branch shells out to the `tree-sitter` CLI to build
every parser. Without it, parser installs fail with:

```
error: Error during "tree-sitter build": ENOENT: no such file or directory (cmd): 'tree-sitter'
```

Do not install it from npm, and do not use the distro package — both are
usually too old. Use the prebuilt binary:

```sh
curl -sSL -o /tmp/tree-sitter.gz \
  https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz
gunzip -f /tmp/tree-sitter.gz
mkdir -p ~/.local/bin
install -m755 /tmp/tree-sitter ~/.local/bin/tree-sitter
tree-sitter --version
```

`cargo install tree-sitter-cli --locked` also works, but recent releases need a
newer Rust than some machines have; `rustup update` first if you go that way.

Parsers are built into `~/.local/share/nvim/site/parser/`, not into the
nvim-treesitter plugin directory. To (re)build them without opening Neovim:

```sh
nvim --headless -c 'lua require("nvim-treesitter").install({"c","cpp","cmake","make","python","go","rust","lua","markdown","markdown_inline","bash","vimdoc","query"}, {force=true}):wait(600000)' -c qa
```

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
3. Sync plugins to the lockfile, removing plugins that are no longer used.
   Run these as two separate invocations, `restore` first:
    ```sh
    nvim --headless "+Lazy! restore" +qa
    nvim --headless "+Lazy! clean" +qa
    ```
    Use `restore`, not `sync`/`update`: those move plugins past the lockfile
    and leave `lazy-lock.json` modified.

    Do not combine them as `"+Lazy! clean" "+Lazy! restore"` in one command.
    `clean` rewrites `lazy-lock.json` from whatever is currently on disk before
    `restore` reads it, so on a machine whose plugins have drifted ahead of the
    lockfile it overwrites the lockfile you just pulled instead of restoring
    from it.
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

Off by default; turn it on with `<leader>tf` (`:FormatToggle`). When on:

- C/C++: only in projects with a `.clang-format` / `_clang-format`; otherwise
  nothing is formatted.
- Rust, Go: `rustfmt`, `gofmt`.
- Other filetypes: the language server's formatter, if it has one.

### Reloading files changed outside Neovim

Buffers reload when Neovim regains focus, e.g. after an agent edits files in
another tmux pane. This needs `focus-events on` in tmux, which
`tmux/.tmux.conf` already sets.
