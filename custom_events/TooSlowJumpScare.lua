function onEvent(n,v1,v2)
	if n == "TooSlowJumpScare" then
		runTimer("simplejumpscare",0.20,1)
        addLuaSprite('sonicscreen',true)
		addLuaSprite('spookystatic',true)
		objectPlayAnimation('spookystatic','spookything')
		playSound('staticBUZZ')
        playSound('sppok')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'simplejumpscare' then
		removeLuaSprite('sonicscreen',false)
		removeLuaSprite('spookystatic',false)
    end
end
