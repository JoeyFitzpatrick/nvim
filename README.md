This config uses the development version of Neovim (0.10).

### Using this config
1. [Download Neovim](https://github.com/neovim/neovim/releases). You will either need to put it in the standard path for your machine (e.g. usr/local/bin/nvim), or add an alias to use Neovim from a custom path (e.g. alias nvim="~/your-custom-path/bin/nvim")
2. Run `nvim` in your terminal. You should see all of the plugins being installed. After that you should be able to start editing text.

### Neovim in VSCode
 You can use this config from within VSCode by using the [VSCode Neovim extension](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim). After installing the extension, you might need to point the extension at your Neovim path and/or config files, if they aren't in the standard location on your system.

 After that, it should mostly just work. Note that any plugin that relies on a floating terminal (such as Telescope) will NOT work, but VSCode already has a lot of the features that you would be missing from the lack of floating terminal plugins.

 ### Language servers
 The language servers are managed by [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim), which uses [mason](https://github.com/williamboman/mason.nvim). To see what language servers are installed, open Neovim and run `:Mason`. A major exception is the JavaScript/TypeScript language server, which is managed by [typescript-tools](https://github.com/pmizio/typescript-tools.nvim).
