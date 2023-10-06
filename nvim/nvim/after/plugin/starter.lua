local starter = require('mini.starter')
starter.setup({
	header = "What's your adventure today?",
	items = {
		starter.sections.telescope(),
		starter.sections.recent_files(10, false),
	}
})
