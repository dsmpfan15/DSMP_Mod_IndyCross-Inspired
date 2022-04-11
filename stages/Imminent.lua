function onCreatePost()
    setProperty('scoreTxt.visible', true)
    setProperty('timeBar.color', getColorFromHex('ffffff'))
    setProperty('timeTxt.color', getColorFromHex('ffffff'))
    setProperty('scoreTxt.color', getColorFromHex('ffffff'))

    setTextFont('scoreTxt','Bendy.ttf')
    setTextFont('timeTxt','Bendy.ttf')
    setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -35);
    
	if not downscroll then
        setProperty('healthBarBG.visible', false);
        makeLuaSprite('bendyhealthbar', 'Bendy/imminentHealthbar', 0, 566);
        addLuaSprite('bendyhealthbar', true);
		scaleObject('bendyhealthbar', 1.05, 1);
        screenCenter('bendyhealthbar', 'x');
        setObjectCamera('bendyhealthbar', 'camHUD');
        setObjectOrder('bendyhealthbar', getObjectOrder('healthBar') + 1);
        scaleObject('healthBar', 1, 2.5);
        setProperty('healthBar.y', getProperty('healthBar.y') - 1);
        setProperty('iconP1.y', 575)

        makeLuaSprite('bendyhealthbar2', 'Bendy/bendyhealthbar', 0, 566);
        addLuaSprite('bendyhealthbar2', true);
		scaleObject('bendyhealthbar2', 1.05, 1);
        screenCenter('bendyhealthbar2', 'x');
        setObjectCamera('bendyhealthbar2', 'camHUD');
        setObjectOrder('bendyhealthbar2', getObjectOrder('healthBar') + 1);
		setProperty('bendyhealthbar2.visible', false)
    else
        setProperty('healthBarBG.visible', false);
        makeLuaSprite('bendyhealthbar', 'Bendy/imminentHealthbar', 275, 0);
        addLuaSprite('bendyhealthbar', true);
		scaleObject('bendyhealthbar', 1.05, 1);
        setObjectCamera('bendyhealthbar', 'camHUD');
        setObjectOrder('bendyhealthbar', getObjectOrder('healthBar') + 1);
        scaleObject('healthBar', 1, 2.5);
        setProperty('healthBar.y', getProperty('healthBar.y') - 1);
        setProperty('iconP1.y', 10)

		makeLuaSprite('bendyhealthbar2', 'Bendy/bendyhealthbar', 0, 0);
        addLuaSprite('bendyhealthbar2', true);
		scaleObject('bendyhealthbar2', 1.05, 1);
        screenCenter('bendyhealthbar2', 'x');
        setObjectCamera('bendyhealthbar2', 'camHUD');
        setObjectOrder('bendyhealthbar2', getObjectOrder('healthBar') + 1);
		setProperty('bendyhealthbar2.visible', false)
    end

	addCharacterToList('bendy', 'dad')
	addCharacterToList('skepticalBf', 'bf')
end



function onCreate()
	-- background shit
	makeLuaSprite('background', 'Bendy/imminent/BG01', -520, -55);
	setScrollFactor('background', 1, 1);
	scaleObject('background', 0.7, 0.7)

	makeLuaSprite('bendee', 'Bendy/imminent/Boi', 50, 250);
	setScrollFactor('bendee', 1, 0.95);
	scaleObject('bendee', 0.65, 0.65)

	makeLuaSprite('pillar', 'Bendy/imminent/Pillar', 1015, -80);
	setScrollFactor('pillar', 0.95, 0.95);
	scaleObject('pillar', 0.6, 0.6)
	setObjectOrder('pillar','5')

	makeAnimatedLuaSprite('light', 'Bendy/imminent/Light(Add-Blend)', 100, 0);
	addAnimationByPrefix('light', 'flash', 'fezt instance', 24, false);
	objectPlayAnimation('light', 'flash');
	scaleObject('light', 0.65, 0.65)
	setObjectOrder('light','4')

	makeAnimatedLuaSprite('MusicBox', 'Bendy/imminent/MusicBox', 350, 325);
	addAnimationByPrefix('MusicBox', 'booop', 'Music box thingy instance', 24, false);
	objectPlayAnimation('MusicBox', 'booop');
	scaleObject('MusicBox', 0.65, 0.65)
	setObjectOrder('MusicBox','3')

	makeLuaSprite('bgPost', 'Bendy/BG', -300, -220);
	setScrollFactor('bgPost', 0.95, 1);
	scaleObject('bgPost', 0.6, 0.6)
	setProperty('bgPost.visible', false)

	addLuaSprite('bgPost', false);
	addLuaSprite('MusicBox', false);
	addLuaSprite('bendee', true);
	addLuaSprite('pillar', true);
	addLuaSprite('light', true);
	addLuaSprite('background', false);
	
	makeAnimatedLuaSprite('bendyCutout1', 'Bendy/Cutouts/BendyCutouts', 300, -80);
    scaleObject('bendyCutout1', 1.5, 1.5);
    setObjectCamera('bendyCutout1', 'other');
    addLuaSprite('bendyCutout1', true);
    setProperty('bendyCutout1.visible', false)

	addAnimationByPrefix('bendyCutout1', 'jumpscare2', '02 instance', 24, false);
    addAnimationByPrefix('bendyCutout1', 'jumpscare3', '03 instance', 24, false);
    addAnimationByPrefix('bendyCutout1', 'jumpscare4', '04 instance', 24, false);
end

function onUpdatePost()
	update_tweens()

	if get_tween_value("introZoom1") then
		triggerEvent("Camera Follow Pos", get_tween_value("introZoom1"), 300)
	end
end

function onStepHit()
	objectPlayAnimation('light', 'flash');

	if curStep == 2234 then --2234
		setProperty('bendyCutout1.visible', true)
        objectPlayAnimation('bendyCutout1', 'jumpscare4');
        playSound('Bendy/cutout', 1)
	end
	-- THE BIG CHANGE
	if curStep == 1074 then --1074
		thebigchange = true
	end
	-- THE BIG CHANGE
	-------------------- INTRO ZOOMS LOL
	
	if curStep == 117 then
		doTweenZoom('introZoom1', 'camGame', 1.1, '0.1', 'backOut')
		tween_value("BendyIntro", 200, 0, 1, "backOut")
	end


	if curStep == 119 then
		doTweenZoom('introZoom1', 'camGame', 1.2, '0.1', 'backOut')
	end

	if curStep == 123 then
		doTweenZoom('introZoom1', 'camGame', 1.3, '0.1', 'backOut')
	end

	if curStep == 127 then
		doTweenZoom('introZoom1', 'camGame', 1.4, '0.1', 'backOut')
	end

	if curStep == 129 then
		doTweenZoom('introZoom1', 'camGame', 1.5, '0.1', 'backOut')
	end

	if curStep == 133 then
		doTweenZoom('introZoom1', 'camGame', 1, '0.5', 'backOut')
	end
	-------------------- INTRO ZOOMS LOL
	-- more zooms --
	if curStep == 352 then
		doTweenZoom('Zoom1', 'camGame', 1.1, '0.1', 'backOut')
	end

	if curStep == 356 then
		doTweenZoom('Zoom1', 'camGame', 1.2, '0.1', 'backOut')
	end

	if curStep == 359 then
		doTweenZoom('Zoom1', 'camGame', 1.1, '0.1', 'backOut')
	end

	if curStep == 362 then
		doTweenZoom('Zoom1', 'camGame', 1.11, '0.1', 'backOut')
	end

	if curStep == 364 then
		doTweenZoom('Zoom1', 'camGame', 1, '0.1', 'backOut')
	end

	if curStep == 368 then
		doTweenZoom('Zoom1', 'camGame', 0.9, '0.1', 'backOut')
	end

	if curStep == 370 then
		doTweenZoom('Zoom1', 'camGame', 0.8, '0.1', 'backOut')
	end

	if curStep == 372 then
		doTweenZoom('Zoom1', 'camGame', 0.9, '0.1', 'backOut')
	end

	if curStep == 375 then
		doTweenZoom('Zoom1', 'camGame', 1, '0.1', 'backOut')
	end

	if curStep == 377 then
		doTweenZoom('Zoom1', 'camGame', 1.1, '0.1', 'backOut')
	end

	if curStep == 380 then
		doTweenZoom('Zoom1', 'camGame', 0.9, '0.1', 'backOut')
	end

	if curStep == 391 then
		stare = true
		doTweenZoom('musicboxzoom', 'camGame', 2.3, '8', 'quadOut')
	end

	if curStep == 510 then
		stare = false
		doTweenZoom('musicboxzoom2', 'camGame', 0.9, '1', 'quadOut')
	end

	if curStep == 640 then
		doTweenZoom('Zoom1', 'camGame', 1, '0.2', 'backOut')
	end

	if curStep == 652 then
		doTweenZoom('Zoom1', 'camGame', 1.1, '0.2', 'backOut')
	end

	if curStep == 664 then
		doTweenZoom('Zoom1', 'camGame', 1.2, '0.2', 'backOut')
	end

	if curStep == 668 then
		doTweenZoom('Zoom1', 'camGame', 1.3, '0.2', 'backOut')
	end

	if curStep == 672 then
		doTweenZoom('Zoom1', 'camGame', 0.9, '0.2', 'backOut')
	end



	if curStep == 675 then
		stare = true
		doTweenZoom('Zoom1', 'camGame', 1.25, '1', 'backOut')
	end

	if curStep == 731 then 
		stare = false
		doTweenZoom('Zoom1', 'camGame', 0.9, '1', 'backOut')
	end

	if curStep == 803 then
		stare = true
		doTweenZoom('Zoom1', 'camGame', 1.25, '1', 'backOut')
	end

	if curStep == 860 then
		stare = false
		doTweenZoom('Zoom1', 'camGame', 0.9, '1', 'backOut')
	end

	if curStep == 910 then
		doTweenZoom('Zoom1', 'camGame', 1.25, '3', 'backOut')
	end

	if curStep == 940 then
		doTweenZoom('Zoom1', 'camGame', 0.9, '1', 'backOut')
	end
	-- more zooms --
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('MusicBox', 'booop');
	end
end

function onUpdate()
	if stare == true then
		triggerEvent('Camera Follow Pos', '120', '450')

		noteTweenAlpha('StareCutout0', 0, 0, 0.2, 'bounce')
		noteTweenAlpha('StareCutout1', 1, 0, 0.2, 'bounce')
		noteTweenAlpha('StareCutout2', 2, 0, 0.2, 'bounce')
		noteTweenAlpha('StareCutout3', 3, 0, 0.2, 'bounce')

		noteTweenAlpha('StareBF0', 4, 0, 0.2, 'bounce')
		noteTweenAlpha('StareBF1', 5, 0, 0.2, 'bounce')
		noteTweenAlpha('StareBF2', 6, 0, 0.2, 'bounce')
		noteTweenAlpha('StareBF3', 7, 0, 0.2, 'bounce')

		setProperty('bendyhealthbar.visible', false)
		setProperty('scoreTxt.visible', false)
        setProperty('timeBar.visible', false)
	    setProperty('timeBarBG.visible', false)
    	setProperty('timeTxt.visible', false)
        setProperty('healthBar.visible', false)
    	setProperty('healthBarBG.visible', false)
    	setProperty('iconP1.visible', false)
    	setProperty('iconP2.visible', false)
	else
		triggerEvent('Camera Follow Pos', '', '')
		noteTweenAlpha('StareCutout0', 0, 1, 0.01, 'bounce')
		noteTweenAlpha('StareCutout1', 1, 1, 0.01, 'bounce')
		noteTweenAlpha('StareCutout2', 2, 1, 0.01, 'bounce')
		noteTweenAlpha('StareCutout3', 3, 1, 0.01, 'bounce')

		noteTweenAlpha('StareBF0', 4, 1, 0.01, 'bounce')
		noteTweenAlpha('StareBF1', 5, 1, 0.01, 'bounce')
		noteTweenAlpha('StareBF2', 6, 1, 0.01, 'bounce')
		noteTweenAlpha('StareBF3', 7, 1, 0.01, 'bounce')

		setProperty('bendyhealthbar.visible', true)
		setProperty('scoreTxt.visible', true)
        setProperty('timeBar.visible', true)
	    setProperty('timeBarBG.visible', true)
    	setProperty('timeTxt.visible', true)
        setProperty('healthBar.visible', true)
    	setProperty('healthBarBG.visible', true)
    	setProperty('iconP1.visible', true)
    	setProperty('iconP2.visible', true)
	end

	if thebigchange == true then
		triggerEvent('Change Character', 'dad', 'Bendy')
		triggerEvent('Change Character', 'bf', 'skepticalBf')

		setProperty('background.visible', false)
		setProperty('bendee.visible', false)
		setProperty('pillar.visible', false)
		setProperty('light.visible', false)
		setProperty('MusicBox.visible', false)
		setProperty('bendyhealthbar.visible', false)

		setProperty('bendyhealthbar2.visible', true)
		setProperty('bgPost.visible', true)

		setProperty('scoreTxt.visible', true)
		setProperty('timeBar.color', getColorFromHex('f5b342'))
		setProperty('timeTxt.color', getColorFromHex('f5b342'))
		setProperty('scoreTxt.color', getColorFromHex('f5b342'))
	end
end

function opponentNoteHit() -- Code for the opponent to drain your health when he sings
    health = getProperty('health')
    if getProperty('health') > 0.2 then --This is the maximum that the enemy will drain your health, then do nothing.
        setProperty('health', health- 0.020); -- How much health does the enemy drain from you, the more, the more health and the less, the less health
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
