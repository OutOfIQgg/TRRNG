local love = require("love") -- needed if running standalone, ignore if running in love

local trng = {}

trng.cf = function (bool)
    local gr = love.math.random(1, 10)
    if gr <= 5 then
        return bool == false
    end
    if gr >= 6 then
        return bool == true
    end
end

trng.grn = function (min, max, mloops)
    local gn = love.math.random(min, max) + 5
    local count = true
    local loops = 0

    if type(mloops) ~= "number" then
        mloops = 250
    else
        local dt = love.timer.getDelta() + 0.4
        local t = love.timer.getTime() + dt
        mloops = max / dt % max * t
    end

    while loops < mloops do
        loops = loops + 1
        if count == true then
            gn = gn + 1
            if gn == max + 1 then
                count = false
            end
        else
            gn = gn - 1
            if gn == min then
                count = true
            end
        end
    end

    if loops >= mloops then
        if gn >= max + 1 then
            gn = max
            return math.floor(gn)
        else
            return math.floor(gn)
        end
    end
end

return trng
