function onEvent(event, value1, value2, strumTime)
    if event == "flashEvent" then
        makeLuaSprite('white', 0, 0, 0, 720)
    makeGraphic('white', screenWidth, screenHeight, 'FFFFFF')
    setObjectCamera('white', 'other', false)
    addLuaSprite('white')
    setProperty('white.alpha', 0)

        setProperty('white.alpha', value1)
        doTweenAlpha('yo tween thing', 'white', 0, value2, 'cubeOut')
    end
end