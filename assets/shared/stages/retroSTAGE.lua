luaDebugMode = true
function onCreate()
    makeLuaSprite('sky', 'retro stage/sky', -4737, -2719)
    scaleObject('sky', 7, 7)
    setProperty('sky.antialiasing', false)
    addLuaSprite('sky', false)
    makeLuaSprite('hill', 'retro stage/hill', 709, -153)
    scaleObject('hill', 0.9, 0.9)
    setScrollFactor('hill', 1.1, 0.9)
    setProperty('hill.antialiasing', false)
    addLuaSprite('hill', false)
    makeLuaSprite('slug', 'retro stage/floor', -3738, 221)
    scaleObject('slug', 3, 2.4)
    setProperty('slug.antialiasing', false)
    addLuaSprite('slug', false)
    makeLuaSprite('clog', 'retro stage/cloud', 2266, -19)
    scaleObject('clog', 0.4, 0.4)
    setScrollFactor('clog', 1.1, 1.05)
    setProperty('clog.antialiasing', false)
    addLuaSprite('clog', false)
    makeLuaSprite('president', 'retro stage/bush', 1405, 396)
    setProperty('president.antialiasing', false)
    addLuaSprite('president', false)
    makeLuaSprite('bronk', 'retro stage/qeustion mark', 1745, -61)
    scaleObject('bronk', 0.3, 0.3)
    setScrollFactor('bronk', 1.25, 1.3)
    setProperty('bronk.antialiasing', false)
    addLuaSprite('bronk', true)


    makeAnimatedLuaSprite('FIREHOT', 'retro stage/Fire', 0, 159 + 1961)
    addAnimationByPrefix('FIREHOT', 'fire', 'fire', 24, true)
    playAnim('FIREHOT', 'fire', true)
    setObjectCamera('FIREHOT', 'other')
    setObjectOrder('FIREHOT', 10)
    addLuaSprite('FIREHOT', true)
    setProperty('FIREHOT.alpha', 0.8)

    if downscroll then
        setProperty('FIREHOT.y', 0 - 561)
        setProperty('FIREHOT.flipY', true)
    end
end


function onEvent(event, value1, value2, strumTime)
    if event == 'fire' then
        if string.lower(value1) == 'on' then 
            if downscroll then
                doTweenY('Firetime', 'FIREHOT', -390, value2, 'linear')
            else
                doTweenY('Firetime', 'FIREHOT', 189, value2, 'linear')
            end
            doTweenAlpha('skytween', 'sky', 0, value2, 'linear')
        elseif string.lower(value1) == 'off' then
            if downscroll then
                doTweenY('Firetime', 'FIREHOT', 0 - 561, value2, 'linear')
            else
                doTweenY('Firetime', 'FIREHOT', 159 + 561, value2, 'linear')
            end
            doTweenAlpha('skytween', 'sky', 0, value2, 'linear')
        end
    end
end