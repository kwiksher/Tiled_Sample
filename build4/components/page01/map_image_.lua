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
local imageWidth             = 1920/4
local imageHeight            = 1280/4
local mX, mY                 = _K.ultimatePosition(960, 640, "")
local oriAlpha = 1
--
local imageName = "/map.png"
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
    layer.map = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.map = newImageRect(map, imageWidth, imageHeight )
    if layer.map == nil then return end
    layer.map.imagePath = imagePath
    layer.map.x = mX
    layer.map.y = mY
    layer.map.alpha = oriAlpha
    layer.map.oldAlpha = oriAlpha
    layer.map.blendMode = ""
    layer.map.oriX = layer.map.x
    layer.map.oriY = layer.map.y
    layer.map.oriXs = layer.map.xScale
    layer.map.oriYs = layer.map.yScale
    layer.map.name = "map"
    sceneGroup.map = layer.map
          sceneGroup:insert( layer.map)
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