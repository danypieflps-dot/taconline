function onCreatePost()
    setProperty('camGame.zoom', 1.2)

    setCameraScroll(1000.0, 250.0)
    setProperty('cameraSpeed', 0.08)
    setProperty('camGame.visible', false)
    setProperty('camHUD.visible', false)

    makeLuaSprite('darkness', 0, -1800, -1800, 720)
    makeGraphic('darkness', 6000, 6000, '000000')
    setObjectCamera('darkness', 'game', false)
    addLuaSprite('darkness')
    setProperty('darkness.alpha', 1)
    setObjectOrder('darkness', 30)

    doTweenAlpha('fade out', 'darkness', 0, 9)
end

function onStepHit()
    if curStep == 1 then
        setProperty('camGame.visible', true)
    end
    if curStep == 128 then
        setProperty('cameraSpeed', 1)
        setProperty('camHUD.visible', true)
        cameraFlash('hud', '0xFFFFFF', 0.6, false) 
    end
    if curStep == 130 then
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 8) 
    end
    if curStep == 250 then
        setProperty('cameraSpeed', 1.4)
    end
    if curStep == 257 then
        setProperty('cameraSpeed', 1)
    end
    if curStep == 384 then
        doTweenX('move', 'camFollow', 1700, 0.01)
        setProperty('cameraSpeed', 2)
    end
    if curStep == 388 then
        setProperty('cameraSpeed', 1)
    end
    if curStep == 512 then
        setProperty('cameraSpeed', 1.4)
    end
    if curStep == 668 then
        doTweenX('move', 'camFollow', 1700, 0.01)
        setProperty('cameraSpeed', 8)
    end
    if curStep == 673 then
        setProperty('cameraSpeed', 1.4)
    end
    if curStep == 732 then
        doTweenX('move', 'camFollow', 800, 0.01)
        setProperty('cameraSpeed', 8)
    end
    if curStep == 737 then
        setProperty('cameraSpeed', 1.4)
    end
    if curStep == 752 then
        setProperty('cameraSpeed', 1)
    end
    if curStep == 760 then
        doTweenAlpha('fade in', 'darkness', 1, 0.6, 'sineIn')
    end
    if curStep == 770 then
        doTweenAlpha('fade out', 'darkness', 0.8, 10, 'smoothStepOut')
    end
    if curStep == 826 then
        setProperty('cameraSpeed', 1.6)
        doTweenX('move', 'camFollow', 1700, 0.01)
    end
    if curStep == 832 then
        setProperty('cameraSpeed', 1)
    end
    if curStep == 896 then
        doTweenAlpha('fade out', 'darkness', 0, 10, 'smoothStepIn')
    end
    if curStep == 1408 then
        doTweenX('move', 'camFollow', 1700, 0.01)
        setProperty('cameraSpeed', 2)
    end
    if curStep == 1412 then
        setProperty('cameraSpeed', 1)
    end
    if curStep == 1530 then
        doTweenX('move', 'camFollow', 800, 0.02)
    end
    if curStep == 1572 then
        doTweenX('move', 'camFollow', 1700, 0.13)
    end
    if curStep == 1636 then
        doTweenX('move', 'camFollow', 800, 0.13)
    end
    if curStep == 1824 then
        doTweenAlpha('fade away again', 'darkness', 1, 20)
    end
end
