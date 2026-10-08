
function floatToHex(c) -- copying this
    if c == nil then return "00" end
        hex = string.format("%X", c)
    if hex:sub(1,10) == "FFFFFFFFFF" then
        hex = hex:sub(9)
    end
    if hex:sub(1,2) == "FF" then
        hex = hex:sub(3)
    end
    return hex
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    doTweenColor('timeBar', 'timeBar', floatToHex(getPropertyFromGroup('notes', id, 'rgbShader.r')), 0.2, 'quadInOut');
    runTimer('colorreset', 1)
end
function noteMiss(id, direction, noteType, isSustainNote)
	if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
            doTweenColor('timeBar', 'timeBar', '2B224A', 0.2, 'quadInOut');
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'colorreset' then
        doTweenColor('timeBar', 'timeBar', 'FFFFFF', 1, 'quadInOut');
    end
end