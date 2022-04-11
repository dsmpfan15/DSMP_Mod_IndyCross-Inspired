function onCreatePost()
    setProperty('scoreTxt.visible', true)
    setProperty('timeBar.color', getColorFromHex('f5b342'))
    setProperty('timeTxt.color', getColorFromHex('f5b342'))
    setProperty('scoreTxt.color', getColorFromHex('f5b342'))

    setTextFont('scoreTxt','Bendy.ttf')
    setTextFont('timeTxt','Bendy.ttf')
    setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -35);

    if not downscroll then
        setProperty('healthBarBG.visible', false);
        makeLuaSprite('bendyhealthbar', 'Bendy/bendyhealthbar', 0, 566);
        addLuaSprite('bendyhealthbar', true);
        screenCenter('bendyhealthbar', 'x');
        setObjectCamera('bendyhealthbar', 'camHUD');
        setObjectOrder('bendyhealthbar', getObjectOrder('healthBar') + 1);
        scaleObject('healthBar', 1, 2.5);
        setProperty('healthBar.y', getProperty('healthBar.y') - 1);
        setProperty('iconP1.y', 575)
    else
        setProperty('healthBarBG.visible', false);
        makeLuaSprite('bendyhealthbar', 'Bendy/bendyhealthbar', 0, 0);
        addLuaSprite('bendyhealthbar', true);
        screenCenter('bendyhealthbar', 'x');
        setObjectCamera('bendyhealthbar', 'camHUD');
        setObjectOrder('bendyhealthbar', getObjectOrder('healthBar') + 1);
        scaleObject('healthBar', 1, 2.5);
        setProperty('healthBar.y', getProperty('healthBar.y') - 1);
        setProperty('iconP1.y', 10)
    end

end


function wait(seconds)
    local start = os.clock()
    repeat until os.clock() > start + seconds
end

function onCreate()
	-- background shit

    -- cutout hud
    makeAnimatedLuaSprite('bendyCutout1', 'Bendy/Cutouts/BendyCutouts', 300, -80);
    scaleObject('bendyCutout1', 1.5, 1.5);
    setObjectCamera('bendyCutout1', 'other');
    addLuaSprite('bendyCutout1', true);
    setProperty('bendyCutout1.visible', false)

	addAnimationByPrefix('bendyCutout1', 'jumpscare2', '02 instance', 24, false);
    addAnimationByPrefix('bendyCutout1', 'jumpscare3', '03 instance', 24, false);
    addAnimationByPrefix('bendyCutout1', 'jumpscare4', '04 instance', 24, false);

    makeAnimatedLuaSprite('bendyCutout2', 'Bendy/Cutouts/BendyCutouts', 300, -80);
    scaleObject('bendyCutout2', 2,2);
    setObjectCamera('bendyCutout2', 'game');
    addLuaSprite('bendyCutout2', true);
    setProperty('bendyCutout2.visible', false)

	addAnimationByPrefix('bendyCutout2', 'jumpscare2', '02 instance', 24, false);
    addAnimationByPrefix('bendyCutout2', 'jumpscare3', '03 instance', 24, false);
    addAnimationByPrefix('bendyCutout2', 'jumpscare4', '04 instance', 24, false);
    -- cutout hud

    makeAnimatedLuaSprite('sammy', 'Bendy/SammyBg', 200, 150);
	addAnimationByPrefix('sammy', 'bop', 'Sam instance', 24, false);
	objectPlayAnimation('sammy', 'bop');
    scaleObject('sammy', 0.65, 0.65);
    setObjectOrder('sammy','1')

    makeLuaSprite('midgrounds', 'Bendy/MidGrounUTS', -540, -300);
	setScrollFactor('midgrounds', 0.95, 1);
	scaleObject('midgrounds', 0.6, 0.6);
    setObjectOrder('midgrounds','2')

    makeLuaSprite('foregrounds', 'Bendy/foreground', 750, -300);
	setScrollFactor('foregrounds', 0.95, 0.95);
	scaleObject('foregrounds', 0.6, 0.6);
    setObjectOrder('foregrounds','5')

	makeLuaSprite('introDark', 'Bendy/Darkness', -750, -300);
	setScrollFactor('introDark', 0.95, 1);
	scaleObject('introDark', 10, 10);

    makeLuaSprite('shader', 'Bendy/Shader', -750, -300);
	setScrollFactor('shader', 0.95, 1);
	scaleObject('shader', 10, 10);
    setProperty('shader.alpha', 0)

	makeLuaSprite('stageback', 'Bendy/BG', -540, -300);
	setScrollFactor('stageback', 0.95, 1);
	scaleObject('stageback', 0.6, 0.6);
	
    addLuaSprite('shader', true);
    addLuaSprite('foregrounds', true);
    addLuaSprite('midgrounds', false);
	addLuaSprite('health', true);
    addLuaSprite('sammy', false);
	addLuaSprite('introDark', true);
    addLuaSprite('stageback', false);
	addLuaSprite('intro', true);	


    -- health bar lol
end

function onSongStart()
	doTweenAlpha('introDarkSign', 'introDark', 0, 5, 'linear')
end

function onBeatHit() -- SAMMY'S FUNCTIONALITY
	if curBeat % 1 == 0 then
		objectPlayAnimation('sammy', 'bop');
	end
end

contrastShade = false

function onStepHit()
	if curStep == 35 then
		doTweenAlpha('introSign', 'intro', 0, 2, 'backOut')
    end

    if curStep == 574 then
        doTweenZoom('BendySingBreak', 'camGame', 1.4, 6.5, 'quadOut')
    end

	if curStep == 1151 then
        WindowMove = true
		doTweenAlpha('breakdownDark', 'introDark', 0.85, 0.1, 'bounceOut')
        doTweenAlpha('breakdownHealthBar', 'bendyhealthbar', 0, 0.1, 'bounceOut')
		setProperty('health', 0.4)
		playSound('Bendy/click', 5)
		

		noteTweenAlpha('BreakdownBendy0', 0, 0.2, 0.2, 'bounce')
		noteTweenAlpha('BreakdownBendy1', 1, 0.2, 0.2, 'bounce')
		noteTweenAlpha('BreakdownBendy2', 2, 0.2, 0.2, 'bounce')
		noteTweenAlpha('BreakdownBendy3', 3, 0.2, 0.2, 'bounce')

		noteTweenAlpha('BreakdownBf0', 4, 0.2, 0.2, 'bounce')
		noteTweenAlpha('BreakdownBf1', 5, 0.2, 0.2, 'bounce')
		noteTweenAlpha('BreakdownBf2', 6, 0.2, 0.2, 'bounce')
		noteTweenAlpha('BreakdownBf3', 7, 0.2, 0.2, 'bounce')

		doTweenZoom('breakdownCamZoom', 'camGame', 1.5, '26', 'quadIn')

        setProperty('scoreTxt.visible', false)
        setProperty('timeBar.visible', false)
	    setProperty('timeBarBG.visible', false)
    	setProperty('timeTxt.visible', false)
        setProperty('healthBar.visible', false)
    	setProperty('healthBarBG.visible', false)
    	setProperty('iconP1.visible', false)
    	setProperty('iconP2.visible', false)
    end

	if curStep == 1343 then
		setProperty('health', 2)
	end

	if curStep == 1536 then
        WindowMove = false
		doTweenAlpha('breakdownDark2', 'introDark', 0, 5, bounce)
        doTweenAlpha('breakdownHealthBar', 'bendyhealthbar', 1, 0.1, 'bounceOut')

		noteTweenAlpha('BreakdownBendy0o', 0, 1, 5, 'bounceOut')
		noteTweenAlpha('BreakdownBendy1o', 1, 1, 5, 'bounceOut')
		noteTweenAlpha('BreakdownBendy2o', 2, 1, 5, 'bounceOut')
		noteTweenAlpha('BreakdownBendy3o', 3, 1, 5, 'bounceOut')

		noteTweenAlpha('BreakdownBf0o', 4, 1, 5, 'bounceOut')
		noteTweenAlpha('BreakdownBf1o', 5, 1, 5, 'bounceOut')
		noteTweenAlpha('BreakdownBf2o', 6, 1, 5, 'bounceOut')
		noteTweenAlpha('BreakdownBf3o', 7, 1, 5, 'bounceOut')

        setProperty('scoreTxt.visible', true)
        setProperty('timeBar.visible', true)
	    setProperty('timeBarBG.visible', true)
    	setProperty('timeTxt.visible', true)
        setProperty('healthBar.visible', true)
    	setProperty('healthBarBG.visible', true)
    	setProperty('iconP1.visible', true)
    	setProperty('iconP2.visible', true)
    end

    -- CUTOUT EVENTS

    if curStep == 384 then
        setProperty('bendyCutout2.visible', true)
        objectPlayAnimation('bendyCutout2', 'jumpscare2');
        playSound('Bendy/cutout', 1)


        runTimer('turnoffCutout', 5, 0)
    end

    if curStep == 1149 then
        setProperty('bendyCutout1.visible', true)
        objectPlayAnimation('bendyCutout1', 'jumpscare4');
        playSound('Bendy/cutout', 1)

        runTimer('turnoffCutout', 5, 0)
    end

    if curStep == 1920 then
        setProperty('bendyCutout1.visible', true)
        objectPlayAnimation('bendyCutout1', 'jumpscare3');
        playSound('Bendy/cutout', 1)


        runTimer('turnoffCutout', 5, 0)
    end


end



function onTimerCompleted(tag)
	if tag == 'turnoffCutout' then
        setProperty('bendyCutout1.visible', false)
        setProperty('bendyCutout2.visible', false)
    end
end













function opponentNoteHit() -- Code for the opponent to drain your health when he sings
    health = getProperty('health')
    if getProperty('health') > 0.2 then --This is the maximum that the enemy will drain your health, then do nothing.
        setProperty('health', health- 0.020); -- How much health does the enemy drain from you, the more, the more health and the less, the less health
    end
end

local xx = 200; -- Code to change the position of the camera to the left or right for your opponent, Less = Left (They can be negative numbers), More = Right
local yy = 200; -- Code to change the position of the camera up or down for the enemy Less = Down (They can be negative numbers), More = Up
local xx2 = 500; -- Same code as above, but for boyfriend left, right
local yy2 = 450; -- Same code as above, but for boyfriend up, down
local xx3 = 520; -- Same code as above, but for girlfriend left, right
local yy3 = 450; -- Same code as above, but for girlfriend, up, down
local ofs = 50; -- Code to adjust the intensity with which the camera moves, the more numbers, the more intense, and the fewer numbers, less intense
local followchars = true; -- This code is necessary for the script to work, don't even think about deleting it!
local del = 0;
local del2 = 0;


function onUpdate() -- The Main Code
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if gfSection == true then -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then -- Credits to Serebeat and company for their Slaybells mod,
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)              -- That's where I got the gf code from.
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
				end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        else
                 -- Code for the camera to follow the poses of boyfriend
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- Self explanatory
    end
    
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType~='No Animation' then
		if direction==0 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.angle', -2)
			doTweenAngle('revert', 'camHUD', 0, 0.3, 'CircOut')
		
		elseif direction==1 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.y', 1)
			doTweenY('revert', 'camHUD', 0, 0.3, 'CircOut')
		
		elseif direction==2 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.y', -5)
			doTweenY('revert', 'camHUD', 0, 0.3, 'CircOut')
		
		elseif direction==3 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.angle', 2)
			doTweenAngle('revert', 'camHUD', 0, 0.3, 'CircOut')
		
		end
		cameraShake('game', 0.001, 0.1)
	end
end

defaultWindowPos = {128,64};

function onUpdatePost(elapsed)
    if WindowMove == true then
        setPropertyFromClass("openfl.Lib", "application.window.x", defaultWindowPos[1] + 50 * math.sin(((getSongPosition() / 1000)*(bpm/60) * 0.1) * math.pi))
	    setPropertyFromClass("openfl.Lib", "application.window.y", defaultWindowPos[2] + 10 * math.cos(((getSongPosition() / 1000)*(bpm/60) * 0.2) * math.pi))
	    setPropertyFromClass("FlxG", "fullscreen", false)
    else
        setPropertyFromClass("openfl.Lib", "application.window.x", "128,64")
    end
end
