local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('Bendy/imminent');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bendydeath')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'Bendy/bendyInitialDeath')
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Bendy/bendydeath')
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Bendy/bendydeathConfirm')
end

function onStartCountdown()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Playing: ' .. 'Imminent Demise ' .. ' against ' .. ' Bendy? ')
    end
    
    function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.title","Friday Night Funkin': Indie Cross")
    end
    
    function onGameOver()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Down the Inkwell..')
    end
    
    function onGameOverConfirm(retry)
    setPropertyFromClass("openfl.Lib", "application.window.title",'Playing: ' .. 'Imminent Demise' .. ' against ' .. ' Bendy? ')
    end