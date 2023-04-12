local config = {
    cmd = {'/Users/fitzpj3/.local/opt/jdtls-launcher/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
      settings = {
        java = {
          configuration = {
            -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
            -- And search for `interface RuntimeOption`
            -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
            runtimes = {
              {
                name = "JavaSE-1.8",
                path = "/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/",
              },
              {
                name = "JavaSE-11",
                path = "/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/",
              },
              {
                name = "JavaSE-17",
                path = "/usr/lib/jvm/java-17-openjdk/",
              },
            }
          }
        }
      }
    }
require('jdtls').start_or_attach(config)
