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
local imageWidth             = 130/4
local imageHeight            = 130/4
local mX, mY                 = _K.ultimatePosition(614, 391, "")
local oriAlpha = 1
--
local imageName = "/tileset.png"
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
    layer.tileSet = display.newImageRect( _K.imgDir..imagePath, _K.systemDir, imageWidth, imageHeight)
    -- layer.tileSet = newImageRect(tileset, imageWidth, imageHeight )
    if layer.tileSet == nil then return end
    layer.tileSet.imagePath = imagePath
    layer.tileSet.x = mX
    layer.tileSet.y = mY
    layer.tileSet.alpha = oriAlpha
    layer.tileSet.oldAlpha = oriAlpha
    layer.tileSet.blendMode = ""
    layer.tileSet.oriX = layer.tileSet.x
    layer.tileSet.oriY = layer.tileSet.y
    layer.tileSet.oriXs = layer.tileSet.xScale
    layer.tileSet.oriYs = layer.tileSet.yScale
    layer.tileSet.name = "tileSet"
    sceneGroup.tileSet = layer.tileSet
          sceneGroup:insert( layer.tileSet)
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