-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020
-- Version: 
-- Project: Tiled
--
local Context = require "extlib.robotlegs.Context"
local _Class = {}
--
function _Class:new()
	local context = Context:new()
	context.Router = {}
	_Class.page01Context = require("contexts.page01Context")
--
	function context:init()
		------------------------------------------------------------
		------------------------------------------------------------
		    self.context01 = _Class.page01Context:new(self)
	    self.context01:init()
	-- app init command
		self:mapCommand("app.Ads",          "commands.app.Ads")
		self:mapCommand("app.bookmark",     "commands.app.bookmark")
		-- self:mapCommand("app.coronaViewer", "commands.app.coronaViewer")
		self:mapCommand("app.droidHWKey",   "commands.app.droidHWKey")
		-- self:mapCommand("app.expDir",       "commands.app.expDir")
		self:mapCommand("app.extCodes",     "commands.app.extCodes")
		self:mapCommand("app.kwkVar",       "commands.app.kwkVar")
		-- self:mapCommand("app.loadLib",      "commands.app.loadLib")
		-- self:mapCommand("app.memoryCheck",  "commands.app.memoryCheck")
		self:mapCommand("app.statusBar",    "commands.app.statusBar")
		self:mapCommand("app.suspend",      "commands.app.suspend")
		-- self:mapCommand("app.variables",    "commands.app.variables")
		-- self:mapCommand("app.versionCheck", "commands.app.versionCheck")
		--
		self:mapMediator("Application", "mediators.ApplicationMediator")
		--
		Runtime:dispatchEvent({name="startup"})
	end
  --
  function context:addInitializer(t)
  	local t = require(t)
  	for k,v in pairs(t) do self.Router[k] = v end
  end
  --
	return context
end
--
return _Class