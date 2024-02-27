return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
}
-- return {
-- 	"goolord/alpha-nvim",
-- 	opts = function()
-- 		local header = { opts = { hl = "Type", position = "center" }, type = "text", val = {} }
-- 		header.val = {
-- 			"",
-- 			"",
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⡶⣶⣶⣤⣀⣤⣤⣤⣤⡴⡶⢶⢶⣚⢿⣩⢳⡍⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣾⣿⣷⣻⡝⣿⣿⣿⣿⣻⢷⡹⣏⢷⡹⣎⢷⣣⣟⡆⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣗⡿⣿⠿⣷⣹⣳⡟⣧⢿⣏⢷⡻⣜⢏⠷⣙⡞⣻⣿⣿⡀⢟⠄⠀⠀⠀Fuck those idiots.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⢮⣿⣛⣾⣿⣳⢿⡽⣾⣹⢞⡷⢍⢎⡱⢣⣜⡱⣊⠷⣌⠃⠨⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣾⣿⣿⣿⣳⢯⣳⢏⣷⡯⠿⢞⣺⣒⣷⣋⡜⢧⢎⣕⠚⡠⣸⣿⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡿⣾⡷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡿⣟⣿⣿⣿⣿⢿⣟⡷⢯⡻⠼⣯⣷⣦⣿⣿⣿⣿⣿⣷⣌⣎⢣⣜⣧⡔⢻⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠠⡏⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣻⡽⢛⣴⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡹⢯⣷⢯⡟⣞⣯⢾⡹⢣⠍⡘⠉⠈⠙⠿⣿⣿⣿⣿⠟⣿⣿⣿⣿⣶⣿⣷⣟⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣦⡀⣧⣄⣀⣀⣀⡀⠀⠀⠀⢠⣾⡿⣯⡿⣟⣶⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣟⡾⣟⣧⢻⣾⢽⣺⡼⢣⢣⠁⠄⠀⠀⠀⠀⠀⠞⠯⠟⠁⠂⠸⢿⡿⣿⣿⣿⣿⣿⣾⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⡀⠀⠀⠈⠻⣷⡈⠉⠩⠉⠄⠀⢀⣼⣿⢯⣷⢟⣽⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⡿⣟⣯⣟⡾⣟⣿⣞⡿⣞⣯⣷⢻⣍⠦⢩⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣥⢻⢍⠻⣹⢾⣽⣿⣿⣿⣿⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠳⣄⠀⠀⠀⠈⠛⠃⠀⠀⢀⣴⣿⣿⡟⣟⣵⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⢿⣹⢟⣯⢷⢯⢿⡽⣾⣟⣿⣽⡶⣯⡟⣼⢫⢆⠳⣀⠐⠀⠀⠠⠄⠀⣀⣴⡀⢞⣮⢦⢃⡜⢋⡿⣿⣿⣿⣿⣿⣧⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⢷⡶⠶⢤⣬⣷⣄⡀⠀⠀⠀⢀⣴⣿⣿⢏⣟⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣛⣾⣹⡞⣽⣚⢿⣺⣽⣳⢿⣻⣿⣟⡷⣿⢯⣟⣮⢻⡡⣙⠀⠀⡗⢀⣿⢭⣿⣷⡾⢟⡂⢏⢣⢳⢿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⢦⡀⠀⠈⠉⠀⠀⠀⣠⣾⣿⣛⣞⣯⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣼⣳⢽⣣⢯⢷⣣⢯⡝⣯⠿⣽⢿⣻⣽⣯⣟⣾⣳⢿⡬⣍⠂⢅⡎⢿⣿⣿⣿⣿⣷⡿⣼⣏⣧⣋⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⣾⠛⠳⢦⡀⠀⠀⠈⠛⠁⠠⠂⠀⣠⣾⣿⢟⣧⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⢀⣸⣿⣿⣿⣿⣿⣿⣭⣷⡹⢎⢷⣊⠶⡹⢎⢻⡹⢞⣳⢛⢾⡹⣞⠽⣎⠳⠆⠂⠀⠘⠣⢞⡽⢻⠿⣿⣿⣿⣿⣾⣿⠿⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢸⡌⠀⠀⠈⢻⡄⠀⠀⠀⠀⠀⢀⣶⣿⡿⢮⣿⠿⠋⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⣾⣿⣿⣿⣿⣾⢿⣻⣿⣿⣿⣝⣎⠧⡓⢭⡘⠤⡑⢊⠔⠩⠆⠱⢌⠛⡌⠓⡌⠀⠀⠀⠀⠀⠈⠣⢟⡶⡹⢜⡩⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠙⢶⣤⣤⠞⠀⠀⠀⠀⢀⣴⣿⡟⣵⣟⣯⣿⣶⣶⣶⣶⣾⣿⣿⣷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⠀⣰⣿⢧⡿⣿⣿⣿⣿⣟⣿⣽⣻⢿⡾⣯⡝⢦⡘⢤⠉⠄⠠⢀⠐⠀⠂⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⠐⠓⠈⠑⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⣠⡿⠉⢹⣗⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⢟⣧⣟⣻⣾⣿⣻⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⠀⢠⣿⣿⢯⡿⣽⢿⣿⣿⣿⣿⢾⣯⡻⣵⢣⡛⢦⡙⢦⠙⡢⢑⠢⠄⠠⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣴⠟⠉⢹⡏⠀⠀⠀⠀⠀⢀⣴⡿⣋⣿⣾⢻⡴⣫⣟⣾⣷⣯⣿⣿⣾⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠀⢀⣿⣿⣿⡿⣾⣽⣻⢿⣿⣿⣿⣿⣳⢿⣽⡖⡩⢆⠈⢂⠱⠀⢃⠐⠈⠁⠈⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣦⡿⠁⠀⠀⠀⠀⢰⣿⢫⣵⣿⡿⣼⣳⣿⣿⣿⢟⠻⠍⠀⢻⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⢀⣾⣿⣿⣿⣟⣷⣻⣞⡿⣿⣿⣿⣷⣿⣻⣾⣿⡱⣀⠈⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡄⠆⡄⠀⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⣰⡟⣧⢿⣽⣷⣿⣿⣿⣿⠿⡍⠄⠂⠀⠀⠢⢝⣾⣻⣿⣿⣿⣿⣿⣿⣿⣿⣻⣽⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⢸⣿⣿⣿⣿⣿⣿⡷⣯⣟⣿⣻⣿⣽⣾⣟⡾⣽⣻⣶⣌⠄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢀⠁⡄⡠⢀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⣿⣼⣿⣿⣿⣿⣿⡿⣟⢯⡟⣘⢦⠡⡀⠀⠐⡈⢶⢻⡷⣟⣿⣾⣟⣿⣯⣿⢿⣟⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⢸⣿⣿⣿⣿⣿⣿⣽⡿⣽⣳⣟⣿⣯⣷⣿⣻⣗⣯⣿⣻⡴⢐⡀⠀⠀⠀⠀⠀⠀⡀⠠⠀⠀⠀⡠⠀⠀⠀⢠⠦⢏⠠⢑⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣼⣟⣳⣿⣿⣿⣿⣿⣟⢯⡽⣹⢮⡽⣽⣎⠇⡔⠀⢂⠱⢌⡳⣽⣻⣞⡷⣿⣯⣷⡿⣿⣻⣿⢿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀]],
-- 			[[⢸⣿⣯⣿⣿⣿⣾⣟⡿⣷⣟⣾⢯⣿⣿⣿⢷⣻⣾⣳⣿⣹⣧⡜⢧⣌⢀⠃⠌⡐⢀⠂⠌⠐⠀⠁⢀⠄⠚⢀⠂⠄⠂⣌⠸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣽⣿⣿⣿⣿⣿⣳⢏⡾⣱⢯⣷⣿⣿⣏⠖⠀⠈⡀⢊⠲⣹⢖⡿⣞⣿⣟⣾⣯⣿⣟⣯⣿⣿⣿⣿⣿⣀⠀⠀⠀⠀⠀⠀]],
-- 			[[⠸⣿⣿⣷⣿⣷⣿⣯⣿⡷⣯⣿⣻⣽⣿⣿⣿⢯⣟⡷⣯⢷⡻⣞⣧⢞⣦⡉⢂⠐⠠⠈⢄⠂⡔⡈⢤⠈⠄⠁⠀⠀⠡⠀⢃⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠏⣽⣿⣿⣿⣿⣿⣧⣛⢮⡳⢯⣿⣿⣿⡿⢎⠄⠀⠠⠐⡈⡕⣣⢏⡿⣽⢿⣾⣿⣽⣷⣿⣻⣿⣯⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀]],
-- 			[[⠀⢻⣿⣿⣿⣿⣯⣿⣿⣿⣟⣷⣿⣽⣿⣿⣿⣿⣿⡿⣽⣫⠷⣯⢷⡋⡔⣳⠀⣦⠇⡱⢈⢆⣗⣫⣶⣯⠑⠀⠀⠐⠀⠁⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠟⠁⠀⣿⣿⣿⣿⣿⣿⢶⣫⣞⣽⣿⣿⣿⣿⡻⢌⠀⠀⠀⠡⡒⢥⣋⠾⣽⢯⣿⣯⣿⣿⣾⣿⡿⣿⣽⣷⣿⣻⣿⣿⣆⡀⠀⠀⠀]],
-- 			[[⠀⠀⢻⣿⣷⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⣏⢿⡜⣧⢓⠰⣀⣾⢯⠲⣭⢷⡺⣼⣿⣿⣟⣦⠀⠀⠀⠀⠁⠰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡟⠁⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⢿⡑⢂⠀⠀⠈⡐⢡⢓⡼⣻⣭⣟⣷⡿⣯⣷⣿⣿⣿⣿⣿⣯⣿⢿⣽⡿⣿⡄⠀⠀⠀]],
-- 			[[⠀⠀⠀⠘⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⡽⣎⡜⡳⢌⠂⣼⣿⢎⡱⡎⣖⣻⣿⣿⣿⣿⣿⢸⠀⠀⡆⠀⠂⣷⣘⡳⢶⡤⢤⣄⣀⡀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡿⠁⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⢿⣿⣿⣿⣿⡟⡿⡜⠣⠘⠀⠀⢈⠀⢌⡱⢎⡵⣳⣻⢾⣽⣿⣿⣿⣿⣿⣿⡿⣷⡿⣯⣿⣯⣿⢿⣿⠀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣟⡾⣱⢎⠵⣹⠀⢼⡗⢪⠱⢹⠹⠿⣿⣿⣿⣿⣿⢿⡀⠀⢄⡀⢄⣸⠷⠯⣷⣽⣧⣶⣤⣘⣍⡑⣲⡄⢀⣾⣿⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⣽⡞⣝⠒⠩⠄⠂⠁⡀⠂⢌⢢⣙⢮⣳⢯⣿⣿⣟⣿⣾⣿⣿⣿⢿⣿⡿⣽⢯⣷⣻⡾⣿⣿⡀⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣝⢮⣒⠹⡀⠋⢌⠐⠡⢂⡙⠒⢡⠘⡽⣿⣻⣿⣵⡠⣸⡇⠀⢼⡀⠀⠀⠀⠀⠉⠉⠛⠟⠓⢻⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⡰⠙⡄⢉⠐⡐⡀⢂⠡⣉⠤⣓⢮⣳⢯⣿⣿⣿⣿⣿⣿⣿⣿⢿⡿⣯⣿⢯⣿⢾⣽⣟⣿⣿⣷⠀⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣷⣿⣯⣿⢾⣃⡓⠤⢉⠀⠈⠀⠀⠀⠀⠁⠌⠐⢣⢿⣽⣾⣳⡏⢠⠱⠘⣷⣄⡀⠀⠀⠀⠀⠀⣀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢆⠭⢡⠐⡈⡐⢠⠐⣡⠲⣌⠶⣭⢿⣻⣿⣿⣯⣿⣟⣿⣿⣟⣿⡿⣟⣿⡽⣟⣾⣟⣾⣽⣷⣿⣿⡄⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⢿⣿⣿⣻⣿⣿⣫⠷⣉⠖⠡⣾⣄⣄⣰⣂⣤⠅⠀⠀⢀⠠⠿⠿⠗⠻⣽⡂⢂⡐⡏⢿⢷⡶⣶⢦⣴⣿⣿⣋⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡈⢎⢂⠡⠄⡑⠂⠉⠤⡓⢼⣙⣾⣻⢿⣽⣾⢿⣻⡿⣯⢿⡽⣯⣟⡿⣞⣽⣻⢾⣽⣾⣿⣿⣿⣿⡇⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣽⣏⠶⡉⣽⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠻⣤⡉⣀⠂⠈⠹⠿⠦⣀⠒⠼⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡐⡀⠢⡐⡀⠂⠉⠄⠃⠜⡱⢺⡜⣯⢻⠷⣯⢿⡝⣿⢽⣫⡝⡧⢏⡷⣫⢾⣽⣻⣾⣿⣿⣿⣿⣿⣧⠀]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⢺⡏⡔⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢷⣄⣠⠐⢊⠄⣄⡋⢾⣵⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠁⡄⠡⠐⠡⠀⠁⠀⠂⢈⠒⡡⠞⣥⡛⢿⡸⢣⡛⣬⠓⡶⠹⡜⡭⣞⣽⣻⣾⢿⣿⣿⣿⣿⣿⣿⣿⡄]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣯⢧⣻⠔⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠯⠽⠿⠤⠿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠄⠡⠈⠄⠡⠈⠀⠀⠂⢌⠰⣉⠖⡙⢎⡱⢃⠱⡂⡝⡰⢩⢳⡹⡼⣞⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣎⠗⣚⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣭⣤⣥⣬⣤⣥⣣⢬⡤⣤⣆⣴⣤⢎⣭⢦⣴⣥⣶⣵⣬⣵⣻⣮⣷⣿⣽⣯⡿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
-- 			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡷⢾⡱⠬⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- 		}
-- 		local footer = { opts = { hl = "Special", position = "center" }, type = "text", val = {} }
-- 		local lazystats = { opts = { spacing = 1 }, type = "group", val = {} }
-- 		return {
-- 			layout = {
-- 				header,
-- 				{ type = "padding", val = 1 },
-- 				footer,
-- 				{ type = "padding", val = 1 },
-- 				lazystats,
-- 			},
-- 			section = {
-- 				header = header,
-- 				footer = footer,
-- 				lazystats = lazystats,
-- 			},
-- 		}
-- 	end,
-- 	config = function(_, opts)
-- 		require("alpha").setup(opts)
-- 	end,
-- }