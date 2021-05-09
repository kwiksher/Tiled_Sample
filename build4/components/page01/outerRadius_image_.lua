-- Code created by Kwik - Copyright: kwiksher.com 2016, 2017, 2018, 2019, 2020
-- Version: 
-- Project: Tiled
--
local _M = {}
--
local _K = require "Application"
--
function _M:myMain()
end
-- not
local imageWidth             = 152/4
local imageHeight            = 152/4
local mX, mY                 = _K.ultimatePosition(960, 1191, "")
local oriAlpha = 1
--
local imageName = "/outerradius.png"
--
function _M:localVars(UI)
		local imagePath = "p"..UI.imagePage ..imageName
   end
--
--[[
local info     = require ("assets.sprites.".."page1")
local sheet    = graphics.newImageSheet ( _K.spriteDir.."page1.png", _K.systemDir, info:getSheet() )
local sequence = {start=1, count= #info:getSheet().frames }
function newImageRect(name, width, height)
  local image
  if string.find(name, "background") == nil then
      image = display.newSprite(sheet, sequence)
      image.name = name
      image:setFrame (info:getFrameIndex (name))
      image.width, image.height = width, height
      else
       image = display.newImageRect(_K.imgDir..name.."."..png, _K.systemDir, width, height)
      end
   return image
end
--]]
--
function _M:localPos(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
		local imagePath = "p"..UI.imagePage ..imageName
    local function myNewImage()
    layer.outerRadius = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.outerRadius = newImageRect(outerradius, imageWidth, imageHeight )
    if layer.outerRadius == nil then return end
    layer.outerRadius.imagePath = imagePath
    layer.outerRadius.x = mX
    layer.outerRadius.y = mY
    layer.outerRadius.alpha = oriAlpha
    layer.outerRadius.oldAlpha = oriAlpha
    layer.outerRadius.blendMode = ""
    layer.outerRadius.oriX = layer.outerRadius.x
    layer.outerRadius.oriY = layer.outerRadius.y
    layer.outerRadius.oriXs = layer.outerRadius.xScale
    layer.outerRadius.oriYs = layer.outerRadius.yScale
    layer.outerRadius.name = "outerRadius"
    sceneGroup.outerRadius = layer.outerRadius
          sceneGroup:insert( layer.outerRadius)
    --
    end
    myNewImage()
end
--
function _M:didShow(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
      end
--
function _M:toDispose(UI)
  local sceneGroup  = UI.scene.view
  local layer       = UI.layer
      end
--
function  _M:toDestory()
end
--
return _M