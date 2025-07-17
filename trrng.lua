local love = require("love") -- needed if running standalone, ignore if running in love

local trng = {}
trng.a = {} -- a = advanced (MOST ACCURATE AND EFFICIENT)

-- Your cf function (time-based toggle)
trng.a.cf = function(bool)
    local t = love.timer.getTime()
    local cal = math.sin(t * 10000) + math.cos(t * 0.7)
    return cal % 2 > 1 and not bool or bool
end

-- Improved grn function
trng.a.grn = function(min, max, mloops)
    local gn = love.math.random(min, max)        -- random start
    local going_up = love.math.random() > 0.5    -- random initial direction
    local loops = 0

    mloops = (type(mloops) == "number") and mloops or 1000

    while loops < mloops do
        loops = loops + 1

        if going_up then
            gn = gn + 1
            if gn >= max then
                going_up = false
            end
        else
            gn = gn - 1
            if gn <= min then
                going_up = true
            end
        end

        -- Add chance to break out early:
        -- combine your cf with some random chance
        local cf_res = trng.a.cf(love.math.random() > 0.5)
        local rand_chance = love.math.random() > 0.8 -- 20% chance to break

        if not cf_res or rand_chance then
            break
        end
    end

    -- Clamp just in case
    gn = math.max(min, math.min(max, gn))
    return gn
end

trng.b ={} -- b = basic (LEAST ACCURATE)

trng.b.cf = function (bool)
    local gr = love.math.random(1, 10)
    if gr <= 5 then
        return bool == false
    end
    if gr >= 6 then
        return bool == true
    end
end

trng.b.grn = function (min, max, mloops)
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

trng.e = {} -- e = experimental (FULL OF EXPERMENTS, DON'T RELY ON IT)

trng.e.cf = function (bool)
    local bool1 = false
    local dcin = 1
    local mloops = 10 / (love.timer.getDelta() + 0.2)
    local loops = 0
    local dci = {true, false}

    while loops < mloops do
        loops = loops + 1
        if bool1 == false then
            dcin = dcin + 1
            bool1 = true
        elseif bool1 == true then
            dcin = dcin - 1
            bool1 = false
        end
    end

    return bool == dci[dcin]
end

trng.e.grn = function(min, max, mloops)
    local range = max - min + 1
    if type(mloops) ~= "number" then
        mloops = 250
    else
        local dt = love.timer.getDelta() + 0.2
        local t = love.timer.getTime() + dt
        mloops = (max / dt) % max * t
        mloops = math.floor(mloops)
    end

    local offset = mloops % range
    return min + offset
end

return trng