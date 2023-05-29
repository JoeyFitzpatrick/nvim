local home = "/Users/fitzpj3"
local jdtls = require("jdtls")
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- local workspace_folder = home .. '/.local/share/eclipse/' .. project_name
local workspace_folder = home .. '/Tools/nvim-eclipse-workspaces/' .. project_name
-- vim.keymap.set('n', '<leader>i', function() print(workspace_folder) end)

local config = {
    flags = {
        debounce_text_changes = 80,
    },
    root_dir = root_dir, -- Set the root directory to our found root_marker
    init_options = {
      extendedClientCapabilities = extendedClientCapabilities,
    },
    settings = {
        java = {
            format = {
                settings = {
                    -- Use Google Java style guidelines for formatting
                    -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
                    -- and place it in the ~/.local/share/eclipse directory
                    url = "/.local/share/eclipse/eclipse-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
            -- Specify any completion options
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
            },
            -- Specify any options for organizing imports
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            -- How code generation should act
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = "/Users/fitzpj3/Tools/java-stuff/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home",
                    },
                    {
                        name = "JavaSE-11",
                        path = "/Users/fitzpj3/Tools/java-stuff/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home",
                    },
                    {
                        name = "JavaSE-17",
                        path = "/Users/fitzpj3/Tools/java-stuff/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home",
                    },
                },
            },
        },
    },
    cmd = {
        "java",
        -- "/Users/fitzpj3/Tools/java-stuff/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:/Users/fitzpj3/.config/nvim/dependencies/lombok.jar",
        -- "-Xbootclasspath/a:/Users/fitzpj3/.config/nvim/dependencies/lombok.jar",
        "-Xmx4g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        '--add-opens', "java.base/java.lang=ALL-UNNAMED",

        -- The jar file is located where jdtls was installed. This will need to be updated
        -- to the location where you installed jdtls
        "-jar",
        vim.fn.glob("/Users/fitzpj3/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_*.jar"),

        -- The configuration for jdtls is also placed where jdtls was installed. This will
        -- need to be updated depending on your environment
        "-configuration",
        "/Users/fitzpj3/jdt-language-server-1.9.0-202203031534/config_mac",

        -- Use the workspace_folder defined above to store data for this project
        "-data",
        workspace_folder,
    },
}

-- Finally, start jdtls. This will run the language server using the configuration we specified,
-- setup the keymappings, and attach the LSP client to the current buffer
jdtls.start_or_attach(config)
