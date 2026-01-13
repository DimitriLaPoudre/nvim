return {
	"3rd/image.nvim",
	build = ":ImageInstall",
	config = function()
		require("image").setup({
			backend = "kitty", -- Options : "kitty", "ueberzug", "sixel"
			size = "fit", -- Valeurs possibles : "fit", "stretch", "crop"
			position = "center", -- Options : "top-left", "top-right", "bottom-left", "bottom-right", "center"
			supported_formats = { "png", "jpg", "jpeg", "gif", "svg", "webp", "bmp" },
			auto_open = true, -- Ouvrir automatiquement l'image lors de l'ouverture du fichier
			clear_on_exit = true, -- Effacer l'image lors de la fermeture du buffer
		})
	end,
}
