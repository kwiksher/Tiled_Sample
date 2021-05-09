-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020
-- Version: 
-- Project: Tiled
--
require("extlib.Deferred")
require("extlib.Callbacks")
_W = display.contentWidth
_H = display.contentHeight
function requireKwik(mod)
    if _G and _G.appName then
        return require("App.".._G.appName.."."..mod)
    else
        return require(mod)
    end
end
local AppContext  = require("contexts.ApplicationContext")
local composer = require("composer")
------------------------------------------------------
------------------------------------------------------
local Application = {}
-- Calculates anchor points
Application.repositionAnchor = function( object, newAnchorX, newAnchorY )
     local origX = object.x; local origY = object.y
     if object.repositionDone == nil then
	     	object.repositionDone = true;
	     if newAnchorX ~= 0.5 or newAnchorY ~= 0.5 then
	         local width = object.width; local height = object.height
	         local xCoord = width * (newAnchorX - .5)
	         local yCoord = height * (newAnchorY - .5)
	         object.x = origX + xCoord; object.y = origY + yCoord
	         object.oriX = object.x; object.oriY = object.y
	     end
	   end
end
--
function Application:new(appDir)
	local application = display.newGroup()
	application.classType       = "Application"
	application.currentView     = nil
	application.currentViewName = nil
    application.appDir          = appDir
	--
	function application:init()
		self.context = AppContext:new()
		self.context:init()
		--
    Runtime:dispatchEvent({name="app.variables", event="init"})
		--
    Runtime:dispatchEvent({name="app.loadLib", event="init"})
		--
    Runtime:dispatchEvent({name="app.statsuBar", event="init"})
		--
		--
    Runtime:dispatchEvent({name="app.versionCheck", event="init"})
		--
    Runtime:dispatchEvent({name="app.expDir", event="init"})
		--
		--
	  Runtime:dispatchEvent({name="app.droidHWKey", event="init"})
		--
	  Runtime:dispatchEvent({name="app.kwkVar", event="init"})
		--
	  Runtime:dispatchEvent({name="app.bookmark", event="init", bookmark =false })
		--
		--
		--
		-- ApplicationMediator.onRegister shows the top page
		Runtime:dispatchEvent({name="onRobotlegsViewCreated", target=self})
	end
	--
	function application:orientation(event)
	end
	--
	function application:whichViewToShowBasedOnOrientation()
		local t = self.lastKnownOrientation
		if t == "landscapeLeft" or t == "landscapeRight" then
		else
		end
	end
	--
	function application:showView(name, params)
		print("Application::name:", name, ", currentViewName:", self.currentViewName)
		if name == self.currentViewName then
			print("same scene")
			-- return true
		end
		self.currentViewName = name
        composer.gotoScene(self.appDir..name, {params = params})
    end
    --
    function application:destroy()
        self.context:destroy()
    end
    	--
	function application:trigger(url, params)
		self.currentViewName = self.context.Router[url]
		if self.currentViewName == nil then
			print("### error "..url.." not routed ###")
		else
			composer.gotoScene(self.currentViewName, params)
		end
	end
	--
	application:init()
	--
	return application
end
	--
function Application.cancelAllTweens()
    local k, v
    for k,v in pairs(Application.gt) do
        v:pause();
        v = nil; k = nil
    end
    Application.gt = nil
    Application.gt = {}
end
--
function Application.cancelAllTimers()
    local k, v
    for k,v in pairs(Application.timerStash) do
        timer.cancel( v )
        v = nil; k = nil
    end
    Application.timerStash = nil
    Application.timerStash = {}
end
--
function Application.cancelAllTransitions()
    local k, v
    for k,v in pairs(Application.trans) do
        transition.cancel( v )
        v = nil; k = nil
    end
    Application.trans = nil
    Application.trans = {}
end
--
function Application.ultimatePosition(x,y, align)
		local w, h = 480, 320
	local mX = x and display.contentWidth/2 + (x*0.25 - w*0.5) or 0
	local mY = y and display.contentHeight/2 + (y*0.25 - h*0.5) or 0
    if align == "left" then
        mX = mX - (display.safeActualContentWidth - w)/2 
    elseif align == "right" then
        mX = mX + (display.safeActualContentWidth - w)/2 
    elseif align == "top" then
        mY = mY - (display.safeActualContentHeight - h)/2
    elseif align == "bottom" then
        mY = mY + (display.safeActualContentHeight - h)/2 
    elseif align == "topLeft" then
        mX = mX - (display.safeActualContentWidth - w)/2 
        mY = mY - (display.safeActualContentHeight - h)/2 
    elseif align == "topRight" then
        mX = mX + (display.safeActualContentWidth - w)/2 
        mY = mY - (display.safeActualContentHeight - h)/2 
    elseif align == "bottomLeft" then
        mX = mX - (display.safeActualContentWidth - w)/2 
        mY = mY + (display.safeActualContentHeight - h)/2 
    elseif align == "bottomRight" then
        mX = mX + (display.safeActualContentWidth - w)/2 
        mY = mY + (display.safeActualContentHeight - h)/2 
    end
	return mX, mY
end
--
function Application.isUltimateConfig()
		return true
	end
	--
return Application