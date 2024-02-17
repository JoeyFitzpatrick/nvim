return {
    "rlane/pounce.nvim",
    keys = {
        { "s", function() require("pounce").pounce({}) end, mode = { "n", "x" } },
        { "gs", function() require("pounce").pounce({}) end, mode = "o" },
    },
}
