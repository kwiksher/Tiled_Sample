print("show")
local visual =  layer.map:getObjects( { name="walker" } )

    -- Keyboard control
    local max, acceleration, left, right, up, down, flip = 10, 0.1, 0, 0, 0, 0,
                                                           0
    local lastEvent = {}
    local function key(event)
        local phase = event.phase
        local name = event.keyName
        if (phase == lastEvent.phase) and (name == lastEvent.keyName) then
            return false
        end -- Filter repeating keys
        print(phase, name)
        if phase == "down" then
            if "left" == name or "a" == name then
                left = -acceleration
                flip = -0.133
            end
            if "right" == name or "d" == name then
                right = acceleration
                flip = 0.133
            elseif "space" == name or "buttonA" == name or "button1" == name then
                -- visual:jump()
            end
            if not (left == 0 and right == 0) and not visual.jumping then
                -- visual:setSequence( "walk" )
                -- visual:play()
            end
            if "up" == name or "w" == name then up = -acceleration end
            if "down" == name or "s" == name then down = acceleration end
        elseif phase == "up" then
            if "left" == name or "a" == name then left = 0 end
            if "right" == name or "d" == name then right = 0 end
            if "up" == name or "w" == name then up = 0 end
            if "down" == name or "s" == name then down = 0 end
            if left == 0 and right == 0 and not visual.jumping then
                -- visual:setSequence("idle")
                visual:setLinearVelocity(0, 0)
                transition.to(visual, {rotation = 0})
            end
        end
        lastEvent = event
    end
    --
    local _FORCE = 500

    local function axis(event)
        local number = event.axis
        local value = event.normalizedValue
        print(number, value)
        if number == 1 then
            if value == 0 then
                visual:setLinearVelocity(0, 0)
                visual.angularVelocity = 0
                transition.to(visual, {rotation = 0})
            elseif value > 0 then
                visual:applyForce(number / _FORCE, 0, visual.x, visual.y)
            else
                visual:applyForce(-number / _FORCE, 0, visual.x, visual.y)
            end
        elseif number == 2 then
            if value == 0 then
                visual:setLinearVelocity(0, 0)
                visual.angularVelocity = 0
                transition.to(visual, {rotation = 0})
            elseif value > 0 then
                visual:applyForce(0, number / _FORCE, visual.x, visual.y)
            else
                visual:applyForce(0, -number / _FORCE, visual.x, visual.y)
            end
        end
    end
    local function enterFrame()
        -- Do this every frame
        local vx, vy = visual:getLinearVelocity()
        local dx = left + right
        local dy = up + down
        if visual.x > display.contentWidth or visual.x < 0 or visual.y > display.contentHeight or visual.y < 0 then
            -- print("out of area")
            visual:setLinearVelocity(0, 0)
        end
        if (dx < 0 and vx > -max) or (dx > 0 and vx < max) then
            --print("dx", dx)
            visual:applyForce(dx or 0, 0, visual.x, visual.y)
        end
        if (dy < 0 and vy > -max) or (dy > 0 and vy < max) then
            --print("dy", dy)
            visual:applyForce(0, dy or 0, visual.x, visual.y)
        end
        -- Turn around
        visual.xScale = math.min(1, math.max(visual.xScale + flip, -1))
    end
    ---------------------------
    -- Add our key/joystick listeners
    Runtime:addEventListener( "key", key )
    Runtime:addEventListener( "enterFrame", enterFrame )

    --Runtime:addEventListener("axis", axis)
    UI.enterFrame = enterFrame
    UI.key = key
    UI.axis = axis
