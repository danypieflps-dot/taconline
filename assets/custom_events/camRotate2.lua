function onEvent(event, value1, value2, strumTime)
    if event == "camRotate2" then
            setProperty('camHUD.angle', value1)
            doTweenAngle('tween back', 'camHUD', 0, value2, 'cubeOut')

            setProperty('camHUD.zoom', 1.07)
            doTweenZoom('hud huh', 'camHUD', 1, value2, 'cubeOut')
    end
end