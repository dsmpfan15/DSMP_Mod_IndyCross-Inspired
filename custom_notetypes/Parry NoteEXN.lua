function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a blue note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Parry NoteEXN' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_parry'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Parry Note' then
		--donothinglmfao
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Parry Note' then
		playSound('sounds/parry')
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Parry NoteEXN' then
		characterPlayAnim('dad', 'ExN', true);
		setProperty('dad.specialAnim', true);
		playSound('sounds/pre_shoot')
		runTimer('shootthing', 0.33)
	end
end

function onTimerCompleted(tag)
	if tag == 'shootthing' then
		playSound('dodge')
		playSound('dodge')
		playSound('dodge')
		playSound('dodge')
	end
end