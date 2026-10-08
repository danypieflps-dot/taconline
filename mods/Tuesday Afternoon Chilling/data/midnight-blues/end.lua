hasEntered = false
canEnter = false
function onEndSong()
    if not hasEntered and isStoryMode then
        makeLuaSprite('end', 'ty', 0, 0)
        setObjectCamera('end', 'other')
        scaleObject('end', 0.776228, 0.785169)
        addLuaSprite('end', true)
        playSound('felinefrenzyjingle')
        canEnter = true
        return Function_Stop
    end
end

function onUpdate(elapsed)
    if canEnter and keyJustPressed('accept') then
        hasEntered = true
        endSong()
    end
end