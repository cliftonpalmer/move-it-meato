-- physics for gripping and releasing cargo

function player_grip_fixture(f)
    local body1 = player.fixture:getBody()
    local body2 = f:getBody()

    local x, y = body1:getWorldCenter()
    player.joint = love.physics.newDistanceJoint(body1, body2, x, y, x + 2, y + 2, true)
    player.joint_created = love.timer.getTime() + 1.0
end
love.handlers.player_grip_fixture = player_grip_fixture

function player_exit(f)
    if player.joint then
        print('Player has cargo')
        love.event.quit()
    end
end
love.handlers.player_exit = player_exit

function beginContact(a, b, co)
    local other_fixture

    if player.fixture == a then
        other_fixture = b
    elseif player.fixture == b then
        other_fixture = a
    else
        return
    end

    -- contact goal
    if other_fixture:getBody() == goal.body then
        love.event.push('player_exit')
        return
    end

    -- contact draggable object
    if love.keyboard.isDown('up')
    and not player.joint
    and other_fixture:getBody():getType() ~= 'static' then
        love.event.push('player_grip_fixture', other_fixture)
        return
    end
end
