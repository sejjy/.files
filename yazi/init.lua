require("full-border"):setup({
	type = ui.Border.PLAIN,
})

th.git = th.git or {}
th.git.modified_sign = " M"
th.git.added_sign = " A"
th.git.untracked_sign = "??"
th.git.ignored_sign = "!!"
th.git.deleted_sign = " D"
th.git.updated_sign = " U"

require("git"):setup()
require("no-status"):setup()
