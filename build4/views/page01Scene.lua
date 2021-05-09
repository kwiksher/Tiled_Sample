-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020
-- Version: 
-- Project: Tiled
--
local sceneName = ...
local composer  = require( "composer" )
local scene     = composer.newScene(sceneName)
local _K = require("Application")
scene._composerFileName = nil
scene.classType = "views.page01Scene"
scene.pageUI    = require("components.page01UI").new(scene, nil )
------------------------------------------------------------
------------------------------------------------------------
function scene:create( event )
  local sceneGroup = self.view
  self.pageUI:create(self, event.params)
  Runtime:dispatchEvent({name="onRobotlegsViewCreated", target=self})
end
--
function scene:show( event )
  local sceneGroup = self.view
  if event.phase == "did" then
     self.pageUI:didShow(self, event.params)
    end
end
--
function scene:hide( event )
   if event.phase == "will" then
      if event.parent then
         event.parent.pageUI:resume()
      end
     self.pageUI:didHide(self, event.params)
   elseif event.phase == "did" then
   end
end
--
function scene:destroy( event )
     self.pageUI:destroy(self, event.params)
    Runtime:dispatchEvent({name="onRobotlegsViewDestroyed", target=self})
end
--
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene