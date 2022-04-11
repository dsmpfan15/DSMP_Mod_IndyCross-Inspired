local OpponentSing = false;

function opponentNoteHit(id, direction, noteType, isSustainNote)
    health = getProperty('health')
    if OpponentSing == true then
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.05);
        end
    end    
end

function onEvent(name, value1, value2)
    if name == 'Opponent Sing' then
        if value1 == 'true' then
            OpponentSing = true;
        end
        if value1 == 'false' then
            OpponentSing = false;
        end
    end
end