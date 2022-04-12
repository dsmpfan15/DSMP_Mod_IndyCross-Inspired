function onCreate()
    makeAnimatedLuaSprite('Hadouken', 'Cuphead/bull/Cuphead Hadoken', 350, 620)
    luaSpriteAddAnimationByPrefix('Hadouken', 'Bullet', 'Hadolen instance 1', 24, true)
    luaSpriteAddAnimationByPrefix('Hadouken', 'Burst', 'BurstFX instance 1', 24, false)
    addLuaSprite('Hadouken', true)
    scaleObject('Hadouken', 0.55, 0.55)
    setProperty('Hadouken.alpha', 0)

    makeAnimatedLuaSprite('CupheadShoot', 'Cuphead/Cuphead Pissed', 320, 490)
    luaSpriteAddAnimationByPrefix('CupheadShoot', 'Shoot', 'Hadoken!! instance', 24, true)
    addLuaSprite('CupheadShoot', true)
    scaleObject('CupheadShoot', 1, 1)
    setProperty('CupheadShoot.visible', false)
end

bfdodge = false;
bfcandodge = false
hadouken = false;

function onStepHit()
    if curStep == 142 then
        hadouken = true
        bfcandodge = true
        runTimer('HadoukenHit', 0.5)
    end

    if curStep == 397 then
        hadouken = true
        bfcandodge = true
        runTimer('HadoukenHit', 0.5)
    end

    if curStep == 500 then
        hadouken = true
        bfcandodge = true
        runTimer('HadoukenHit', 0.5)
    end

    if curStep == 646 then
        hadouken = true
        bfcandodge = true
        runTimer('HadoukenHit', 0.5)
    end

    if curStep == 771 then
        hadouken = true
        bfcandodge = true
        runTimer('HadoukenHit', 0.5)
    end

    if curStep == 1168 then
        hadouken = true
        bfcandodge = true
        runTimer('HadoukenHit', 0.5)
    end

    if hadouken == true then
        doTweenAlpha('HadoukenAlpha', 'Hadouken', 1, 0.2, 'linear');
        doTweenX('HadoukenTween', 'Hadouken', 2400, 2, 'linear')
        playSound('Cuphead/SNAP', 1)
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        objectPlayAnimation('CupheadShoot', 'shoot', true)
    end
end

function onTimerCompleted(timerEnd)
    if timerEnd == 'HadoukenHit' then
        if bfdodge == true then
            bfcandodge = false
            hadouken = false
            runTimer('HadoukenReset', 1)
            setProperty('dad.visible', true)
            setProperty('CupheadShoot.visible', false)
        else
            setProperty('health', getProperty('health') - 2)
        end
    end

    if timerEnd == 'HadoukenReset' then
        doTweenAlpha('HadoukenAlpha2', 'Hadouken', 0, 0.2, 'linear');
        doTweenX('HadoukenTween2', 'Hadouken', 355, 1, 'linear')
    end
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        if bfcandodge == true then
            bfdodge = true
            characterPlayAnim('boyfriend', 'dodge', true);
            setProperty('boyfriend.specialAnim', true);
            playSound('Cuphead/dodge', 1)
        end
    end
end