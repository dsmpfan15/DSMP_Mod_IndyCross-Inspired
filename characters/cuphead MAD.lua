-- Event notes hooks
local yy = 0;
local xx = 0;
local ofs = 80;
local fy = 0;
local fx = 0;
local camSpeed = 1;
local u = 2
local e = ''
local tx = 0
local ty = 0

function onCreate()
    bfShootDodge = false
    makeAnimatedLuaSprite('Bullet', 'bull/Cuphead Hadoken', 350, 620)
    luaSpriteAddAnimationByPrefix('Bullet', 'Bullet', 'Hadolen instance 1', 24, true)
    luaSpriteAddAnimationByPrefix('Bullet', 'Burst', 'BurstFX instance 1', 24, false)
    addLuaSprite('Bullet', true)
    scaleObject('Bullet', 0.55, 0.55)
    setProperty('Bullet.alpha', 0)
    makeAnimatedLuaSprite('Bullet2', 'bull/Roundabout', 350, 620)
    luaSpriteAddAnimationByPrefix('Bullet2', 'Bullet', 'Roundabout instance 1', 24, true)
    addLuaSprite('Bullet2', true)
    setProperty('Bullet2.alpha', 0)
    e = 'Extended'
    tx = 900
    ty = 600
end


local bfDodge = false;
local bfShootDodge = false;
function onUpdate(elapsed)
    fy= fy-0.1;
    fx= fx+0.04;
    yy = getProperty('Bullet2.y')

    setProperty('Bullet2.y',yy+math.sin(fy)*2)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and bfShootDodge then
        bfDodge = true;
        characterPlayAnim('boyfriend', 'dodge', true);
        setProperty('boyfriend.specialAnim', true);
    end
end

function onEvent(name, value1, value2)
    if name == 'exN' then
        setProperty('Bullet.alpha', 0.85)
        doTweenX('BulletTween', 'Bullet', 1470, 1.45, 'linear')
        bfDodge = false;
        bfShootDodge = true
        runTimer('exN', 0.5)
    end
    if name == 'KNOCKOUTEX' then
        setProperty('Bullet.alpha', 0.85)
        doTweenX('BulletTween2', 'Bullet', 860, 0.8, 'linear')
        bfDodge = false;
        bfShootDodge = true
    end
    if name == 'exR' then
        setProperty('Bullet2.alpha', 0.85)
        doTweenX('Bullet2Tween1', 'Bullet2', 1770, 0.8, 'linear')
        bfDodge = false;
        bfShootDodge = true
        runTimer('exR', 0.53)
    end
end

function onTimerCompleted(popuptimer)
    -- A loop from a timer you called has been completed, value "tag" is it's tag
    -- loops = how many loops it will have done when it ends completely
    -- loopsLeft = how many are remaining
    if popuptimer == 'exN' then
        if bfDodge == true then
            bfShootDodge = false
        elseif bfDodge == false then
            setProperty('health', getProperty('health') - 2)
            bfShootDodge = false
        end
    end
    if popuptimer == 'exR' then
        if bfDodge == true then
            bfShootDodge = false
        elseif bfDodge == false then
            setProperty('health', getProperty('health') - 2)
            bfShootDodge = false
        end
    end
    if popuptimer == 'exR2' then
        if bfDodge == true then
            bfShootDodge = false
        elseif bfDodge == false then
            setProperty('health', getProperty('health') - 2)
            bfShootDodge = false
        end
    end
    if popuptimer == 'exR3' then
        bfDodge = false;
        bfShootDodge = true
        doTweenX('Bullet2Tween2', 'Bullet2', 150, 1.1, 'linear')
        runTimer('exR2', 0.23)
    end
    if popuptimer == 'aaaaa' then
        setProperty('Bullet.alpha', 0)
        setProperty('Bullet.x', 350)
        setProperty('Bullet.y', 620)
        objectPlayAnimation('Bullet', 'Bullet', true)
    end
end

function onTweenCompleted(tag)
    if tag == 'BulletTween' then
        setProperty('Bullet.alpha', 0)
        setProperty('Bullet.x', 350)
    end
    if tag == 'BulletTween2' then
        objectPlayAnimation('Bullet', 'Burst', true)
        setProperty('Bullet.y', 420)
        if bfDodge == true then
            bfShootDodge = false
            runTimer('aaaaa', 0.13)
        elseif bfDodge == false then
            setProperty('health', getProperty('health') - 2)
            bfShootDodge = false
        end
    end
    if tag == 'Bullet2Tween1' then
        runTimer('exR3', 0.34)
    end
    if tag == 'Bullet2Tween2' then
        setProperty('Bullet2.alpha', 0)
        setProperty('Bullet2.x', 350)
    end
end