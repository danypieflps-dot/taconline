clappingThoseCheeks = 0
canJump = false
function onCreatePost()
    makeAnimatedLuaSprite('miku', 'mikuclap', -100, 730)
    addAnimationByPrefix('miku', 'clap', 'clap', 24, true)
    addAnimationByPrefix('miku', 'prep', 'prep', 24, true)
    scaleObject('miku', 0.2, 0.2)
    setObjectCamera('miku', 'hud')
    addLuaSprite('miku', false)
    
    makeAnimatedLuaSprite('neru', 'neruclapkuclap', 540, 730)
    addAnimationByPrefix('neru', 'clap', 'clap', 24, true)
    addAnimationByPrefix('neru', 'prep', 'prep', 24, true)
    scaleObject('neru', 0.2, 0.2)
    setObjectCamera('neru', 'hud')
    addLuaSprite('neru', false)
end

function onBeatHit()
    if clappingThoseCheeks == 1 then
        playAnim('miku', 'prep', true)
        playAnim('neru', 'prep', true)
        clappingThoseCheeks = 0
        if canJump then
            cancelTween('mikudown')
            cancelTween('nerudown')
            doTweenY('mikudown', 'miku', 140, 0.2, 'quadOut')
            doTweenY('nerudown', 'neru', 140, 0.2, 'quadOut')
        end
    else
        playAnim('miku', 'clap', true)
        playAnim('neru', 'clap', true)
        clappingThoseCheeks = 1
        if canJump then
            cancelTween('mikuup')
            cancelTween('neruup')
            doTweenY('mikuup', 'miku', 120, 0.2, 'quadOut')
            doTweenY('neruup', 'neru', 120, 0.2, 'quadOut')
        end
    end
end

function onEvent(event, value1, value2, strumTime)
    if event == 'Clappers' then
        if value1 == 'true' then
            cancelTween('mikuTweenDown')
            cancelTween('mikuTweenDown')
            cancelTween('mikuup')
            cancelTween('mikudown')
            cancelTween('neruup')
            cancelTween('nerudown')
            doTweenY('mikuTweenUp', 'miku', 120, value2, 'quadOut')
            doTweenY('neruTweenUp', 'neru', 120, value2, 'quadOut')
        elseif value1 == 'false' then
            canJump = false
            cancelTween('mikuTweenUp')
            cancelTween('mikuTweenUp')
            cancelTween('mikuup')
            cancelTween('mikudown')
            cancelTween('neruup')
            cancelTween('nerudown')
            doTweenY('mikuTweenDown', 'miku', 730, value2, 'quadOut')
            doTweenY('neruTweenDown', 'neru', 730, value2, 'quadOut')
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'mikuTweenUp' then
        canJump = true
    end
end