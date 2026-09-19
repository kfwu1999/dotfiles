# Neovim keymaps

Leader is `<Space>`. Mode is normal unless noted (`v` visual, `x` visual
selection only, `i` insert, `t` terminal).

## General

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>pv` | | File explorer (netrw) |
| `J` / `K` | v | Move selected lines down / up |
| `J` | | Join lines, keep cursor in place |
| `<C-d>` / `<C-u>` | | Half-page down / up, cursor centered |
| `n` / `N` | | Next / previous match, cursor centered |
| `<leader>s` | | Substitute the word under the cursor in the file |
| `Q` | | Disabled |

## Clipboard

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>y` | n, v | Yank to system clipboard |
| `<leader>Y` | | Yank line to system clipboard |
| `<leader>p` | x | Paste over selection without overwriting the register |
| `<leader>d` | n, v | Delete without overwriting the register |
| `<leader>D` | | Delete to end of line into system clipboard |
| `<leader>cf` | | Copy relative file path |
| `<leader>cF` | | Copy absolute file path |
| `<leader>cd` | | Copy directory path |
| `<leader>cl` | n, v | Copy `file:line` (visual: `file:start-end`) |

## Windows

| Key | Action |
| --- | --- |
| `ss` / `sv` | Split horizontally / vertically |
| `sh` `sj` `sk` `sl` | Move to left / down / up / right window |
| `sq` | Close window |
| `sr` | Rotate windows |
| `so` | Close all other windows |

## Files and search (telescope, harpoon)

| Key | Action |
| --- | --- |
| `<leader>pf` | Find files |
| `<C-p>` | Find git-tracked files |
| `<leader>ps` | Grep (prompts for a string) |
| `<leader>pt` | Search TODO/FIXME/... comments |
| `<leader>a` | Harpoon: add current file |
| `<leader>0` | Harpoon: toggle menu |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Harpoon: jump to file 1 / 2 / 3 / 4 |
| `<leader>S` | Search and replace across the project (grug-far); in visual mode, searches the selection |

## LSP and diagnostics

Active when a language server is attached.

| Key | Mode | Action |
| --- | --- | --- |
| `gd` | | Go to definition |
| `K` | | Hover documentation |
| `<leader>vrr` / `grr` | | References |
| `<leader>vrn` / `grn` | | Rename |
| `<leader>vca` / `gra` | n, x | Code action |
| `gri` | | Go to implementation |
| `<leader>vws` | | Workspace symbols |
| `<C-h>` / `<C-s>` | i | Signature help |
| `<leader>vd` | | Show diagnostic under cursor |
| `[d` / `]d` | | Previous / next diagnostic (opens float) |
| `<leader>to` | | Toggle tagbar (symbol outline) |

`K`, `gr*`, `[d`, `]d` and insert `<C-s>` are Neovim defaults.

## Completion (blink.cmp)

| Key | Mode | Action |
| --- | --- | --- |
| `<C-Space>` | i | Show completion / toggle docs |
| `<C-n>` / `<C-p>` | i | Next / previous item |
| `<C-y>` | i | Accept |
| `<C-e>` | i | Cancel (close menu, undo preview) |
| `<C-b>` / `<C-f>` | i | Scroll docs |
| `<Tab>` / `<S-Tab>` | i | Jump to next / previous snippet placeholder |
| `<C-k>` | i | Toggle signature help |

## Editing

| Key | Mode | Action |
| --- | --- | --- |
| `gcc` | | Toggle comment on line |
| `gc{motion}` | n, v | Toggle comment |
| `<leader>u` | | Toggle undotree |
| `<leader>tf` | | Toggle format on save (`:FormatToggle`, `:FormatToggle!` for the current buffer) |

## Git

| Key | Action |
| --- | --- |
| `<leader>gs` | Fugitive status |
| `<leader>gg` | Lazygit |
| `<leader>gd` | Toggle diffview of the working tree |
| `<leader>gh` | Git history of the current file |

Inside diffview and grug-far, press `g?` for their own keymaps.

## Terminal

| Key | Mode | Action |
| --- | --- | --- |
| `<C-\>` | n, i, t | Toggle floating terminal |

## Obsidian

| Key | Action |
| --- | --- |
| `<leader>oo` | Open note in the Obsidian app |
| `<leader>of` | Quick switch note |
| `<leader>os` | Search notes |
| `<leader>og` | Search tags |
| `<leader>ot` | Insert template |
| `<leader>on` | New note |
| `<leader>ob` | Backlinks |
| `gf` | Follow link (in a vault) |
| `<CR>` | Follow link or toggle checkbox (in a vault) |
| `<leader>ch` | Toggle checkbox (in a vault) |
