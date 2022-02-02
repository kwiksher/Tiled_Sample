print("create")

local YOUR_MAP_LUA = 'page01_map' -- it should be placed in buid4/components/tiledmap folder 

local isSimulator = "simulator" == system.getInfo( "environment" )
local isMobile = ( "ios" == system.getInfo("platform") ) or ( "android" == system.getInfo("platform") )

-------------
requireKwik( "components.tiledmap.com.ponywolf.joykey" ).start()
if isMobile or isSimulator then
    local vjoy = requireKwik( "components.tiledmap.com.ponywolf.vjoy" )
    local stick = vjoy.newStick(1, _K.imgDir.."/p1/innerradius.png", _K.imgDir.."/p1/outerradius.png", _K.systemDir)
    stick.x, stick.y = display.contentCenterX, display.contentHeight - 24
    layer.stick = stick
end
-------------

local berry = requireKwik( 'components.tiledmap.ldurniat.berry' )
local physics = require( "physics" )

physics.start( )
physics.setDrawMode( 'hybrid' )
physics.setGravity(0,0)

if _G and _G.appName then
    -- For BookShelFEmbedded project
    layer.map = berry:new(
        "App.".._G.appName..'.components.tiledmap.'..YOUR_MAP_LUA, 
        _G.appName, -- tilesets_dir in system.ApplicationSupportDirectory. Need to remove asssets from '../assets/images/p1/'
        nil, -- tecture packer dir
        "App.".._G.appName..'.components.tiledmap.', -- lua_dir
        _K.systemDir )
else
    layer.map = berry:new( 
        'components.tiledmap.'..YOUR_MAP_LUA,
        'assets', --tilesets_dir
        nil, --texture packer dir
        'components.tiledmap.', --lua_dir
        _K.systemDir ) 
end

---------------
-- use walker in the tiled map. waker and tileSet are replaced with  the ones in the tiled map
--
layer.walker.alpha = 0 -- or removeSelf()
layer.tileSet.alpha = 0

---------------
-- use the block animation of Kwik. the centerBlock of the tiled map is disabled
--
local block = layer.map:getObjects( { name="centerBlock" } )
block.alpha = 0 -- or removeSelf()
layer.block.x, layer.block.y = block:localToContent(0,0)
