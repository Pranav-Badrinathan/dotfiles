return { 
	"m4xshen/autoclose.nvim", 
	config = true, 
	opts = {
		options = {
			-- If next character satisfies the touch regex, don't autoclose.
			disable_when_touch = true,

			-- Alphanumeric, and all opening braces and all quotes.
			touch_regex = "[%w%[%(%{%\'\"<]"
		}
	}
}
