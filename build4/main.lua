-- Template Version 2020.0020
-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020
-- Version: 
-- Project: Tiled
--
display.setDefault("background", 1,1,1)
local function startThisMug()
	local _K = require "Application"
	local function bootstrap()
		display.setStatusBar(display.HiddenStatusBar)
		_K.appName     = ""
		_K.appDir      = ""
				_K.imgDir      = "assets/images/"
		_K.spriteDir   = "assets/sprites/"
		_K.thumbDir    = "assets/thumbnails/"
		_K.audioDir    =  "assets/audios/"
		_K.videoDir    =  "assets/videos/"
		_K.particleDir = "assets/particles/"
		_K.systemDir   = system.ResourceDirectory
		_K.trans       = {}
		_K.gt          = {}
		_K.timerStash   = {}
		_K.allAudios    = {kAutoPlay = 5}
		_K.gtween      = require("extlib.gtween")
		_K.btween      = require("extlib.btween")
		_K.Gesture     = require("extlib.dmc_gesture")
		_K.MultiTouch  = require("extlib.dmc_multitouch")
		_K.syncSound   = require("extlib.syncSound")
		_K.kBidi       = false
		_K.goPage      = 1
		_K.kAutoPlay   = 0
		_K.lang        =""
		_K.layer      = {}
		-- _K.stage       = display.getCurrentStage()
		system.activate("multitouch")
		if "tvOS" == system.getInfo("platform") then
		  system.setIdleTimer( false )
		  _K.DocumentsDir = system.CachesDirectory
		else
		  _K.DocumentsDir = system.DocumentsDirectory
		end
		_K.appInstance = _K:new(_K.appDir)
		_K.randomAction  = {}
		_K.randomAnim  = {}
		_K.kwikDir      = "c:/Users/ymmtny/Documents/Kwik/Tiled"
		_K.asmModel = {
		  sandboxPath = system.pathForFile( nil, system.DocumentsDirectory ),
		  projPath    = _K.kwikDir,
		  APNG        = {},
		  AGIF        = {}
		}
		_K.muteVideos = {}
	end
	--
	bootstrap()
end
--
local function onError(e)
	print("--- unhandledError ---")
	print(e)
	return true
end
--
Runtime:addEventListener("unhandledError", onError)
timer.performWithDelay(100, startThisMug)
-------------------------------------------------
-- build.settings neverStripDebugInfo
-------------------------------------------------
--[[
local log = require("extlib.log")
local path = system.pathForFile("log.db", system.DocumentsDirectory)
db = sqlite3.open(path)
log:set(db, "support@kwiksher.com")
]]
d = {}
d.print = function(num)
	local _num = num or 1
	-- for k, v in pairs(debug.getinfo(1)) do print(k, v) end
	local t = debug.getinfo(2)
	print( t.short_src..":("..t.currentline..")", t.name)
end
d.printT = function()
	print(debug.traceback(""))
end