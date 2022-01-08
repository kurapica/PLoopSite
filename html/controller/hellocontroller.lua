class "HelloController" (function(_ENV)
	inherit "Controller"

	__Action__()
	function index(self)
		self:Text("Hello world")
	end
end)