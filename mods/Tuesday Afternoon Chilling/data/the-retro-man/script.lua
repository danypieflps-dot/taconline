function onCreatePost()
    setProperty('camGame.zoom', 0.8)
    --setProperty('camGame.zoom', 0.2)
    setProperty('cameraSpeed', 10)

    --setProperty('camGame.visible', false)
    --setProperty('camHUD.visible', false)

    makeLuaSprite('darkness', 0, -1800, -1800, 720)
    makeGraphic('darkness', 6000, 6000, '000000')
    setObjectCamera('darkness', 'game', false)
    addLuaSprite('darkness')
    setProperty('darkness.alpha', 1)
    setObjectOrder('darkness', 40)

     setProperty('boyf.alpha', 0)
     setProperty('boyf Percent.alpha', 0)

     setProperty('drad.alpha', 0)
     setProperty('drad Percent.alpha', 0)

     setProperty('misses.alpha', 0)
     setProperty('score.alpha', 0)

     noteTweenAlpha('retro note 1', 0, 0, 0.01)
     noteTweenAlpha('retro note 2', 1, 0, 0.01)
     noteTweenAlpha('retro note 3', 2, 0, 0.01)
     noteTweenAlpha('retro note 4', 3, 0, 0.01)

     noteTweenAlpha('barry note 1', 4, 0, 0.01)
     noteTweenAlpha('barry note 2', 5, 0, 0.01)
     noteTweenAlpha('barry note 3', 6, 0, 0.01)
     noteTweenAlpha('barry note 4', 7, 0, 0.01)

    setProperty('dad.alpha', 1)
    setProperty('boyfriend.alpha', 1)
    setProperty('gf.alpha', 0)

    doTweenAlpha('fade out', 'darkness', 0, 9)

    makeLuaSprite('retroslop', 'retro stage/retroslop', 370, 790)
    scaleObject('retroslop', 2, 2)
    setProperty('retroslop.antialiasing', false)
    addLuaSprite('retroslop', false)
    setObjectCamera('retroslop', 'hud')
    setProperty('retroslop.angle', -20)
    setProperty('retroslop.alpha', 0)

    makeLuaSprite('death', 'retro stage/dead', 1740, 550)
    scaleObject('death', 1.2, 1.2)
    setProperty('death.antialiasing', false)
    addLuaSprite('death', false)
    setProperty('death.alpha', 0)
end

function onStepHit()
    if curStep == 64 then
     noteTweenAlpha('retro note 1', 0, 1, 0.01)
     noteTweenAlpha('retro note 2', 1, 1, 0.01)
     noteTweenAlpha('retro note 3', 2, 1, 0.01)
     noteTweenAlpha('retro note 4', 3, 1, 0.01)

     noteTweenAlpha('barry note 1', 4, 1, 0.01)
     noteTweenAlpha('barry note 2', 5, 1, 0.01)
     noteTweenAlpha('barry note 3', 6, 1, 0.01)
     noteTweenAlpha('barry note 4', 7, 1, 0.01)

     setProperty('boyf.alpha', 1)
     setProperty('boyf Percent.alpha', 1)

     setProperty('drad.alpha', 1)
     setProperty('drad Percent.alpha', 1)

     setProperty('misses.alpha', 1)
     setProperty('score.alpha', 1)

    end
        if curStep == 120 then
            setProperty('camHUD.zoom', 0.8)
            setProperty('camHUD.angle', 8)
            doTweenZoom('hud huh', 'camHUD', 0.9, 1, 'cubeOut')
            doTweenAngle('hud huh rotate', 'camHUD', 0, 1, 'cubeOut')

     setProperty('boyf.alpha', 0)
     setProperty('boyf Percent.alpha', 0)

     setProperty('drad.alpha', 0)
     setProperty('drad Percent.alpha', 0)

     setProperty('misses.alpha', 0)
     setProperty('score.alpha', 0)

    end
    if curStep == 124 then
        doTweenZoom('hud huh', 'camHUD', 1.1, 0.45, 'cubeIn')
        setProperty('defaultCamZoom', 0.8)
        doTweenZoom('smoothZoom', 'camGame', 0.8, 0.45, 'cubeIn') 
    end
    if curStep == 128 then
        doTweenZoom('hud huh', 'camHUD', 1, 4, 'cubeOut')
        setProperty('cameraSpeed', 2)
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 2, 'cubeOut') 

        setProperty('boyf.alpha', 1)
     setProperty('boyf Percent.alpha', 1)

     setProperty('drad.alpha', 1)
     setProperty('drad Percent.alpha', 1)

     setProperty('misses.alpha', 1)
     setProperty('score.alpha', 1)

     -- hi there, im logo thing hi they are fighting yes hi
     doTweenY('hi', 'retroslop', 170, 2, 'cubeOut')
    doTweenAngle('rotatey', 'retroslop', 0, 2, 'cubeOut')
    setProperty('retroslop.alpha', 1)
    end
    if curStep == 140 then
        doTweenY('hi', 'retroslop', -770, 3, 'cubeIn')
    doTweenAngle('rotatey', 'retroslop', 20, 3, 'cubeIn')
    end
    if curStep == 176 then
        setProperty('retroslop.alpha', 0)
    end
    if curStep == 366 then
        setProperty('cameraSpeed', 0.4)
    end
    if curStep == 368 then
        setProperty('defaultCamZoom', 0.8)
        doTweenZoom('smoothZoom', 'camGame', 0.8, 2.2, 'cubeIn')
    end
    if curStep == 384 then
        doTweenAlpha('sky uhh', 'sky', 0.6, 1, 'cubeOut')
        setProperty('defaultCamZoom', 0.9)
        doTweenZoom('smoothZoom', 'camGame', 0.9, 1, 'cubeOut')
    end
    if curStep == 448 then
        noteTweenAlpha('retro note 1', 0, 0, 0.9, 'cubeOut')
     noteTweenAlpha('retro note 2', 1, 0, 0.9, 'cubeOut')
     noteTweenAlpha('retro note 3', 2, 0, 0.9, 'cubeOut')
     noteTweenAlpha('retro note 4', 3, 0, 0.9, 'cubeOut')
    end
    if curStep == 490 then
        setProperty('defaultCamZoom', 0.95)
        doTweenZoom('smoothZoom', 'camGame', 0.95, 0.1, 'cubeOut')
    end
    if curStep == 495 then
        setProperty('defaultCamZoom', 1.05)
        doTweenZoom('smoothZoom', 'camGame', 1.05, 0.1, 'cubeOut')
    end
    if curStep == 499 then
        setProperty('defaultCamZoom', 0.95)
        doTweenZoom('smoothZoom', 'camGame', 0.95, 0.1, 'cubeOut')
    end
    if curStep == 504 then
        setProperty('defaultCamZoom', 0.75)
        doTweenZoom('smoothZoom', 'camGame', 0.75, 0.9, 'cubeIn')
    end
    if curStep == 512 then
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 2, 'cubeOut')

        noteTweenAlpha('retro note 1', 0, 1, 0.9, 'cubeOut')
     noteTweenAlpha('retro note 2', 1, 1, 0.9, 'cubeOut')
     noteTweenAlpha('retro note 3', 2, 1, 0.9, 'cubeOut')
     noteTweenAlpha('retro note 4', 3, 1, 0.9, 'cubeOut')
    end
    if curStep == 766 then
        setProperty('death.alpha', 1)
        setProperty('boyfriend.alpha', 0)
        doTweenY('up', 'death', 400, 0.2, 'cubeInOut')
    end
    if curStep == 768 then
        setProperty('defaultCamZoom', 1)
        doTweenZoom('smoothZoom', 'camGame', 1, 0.9, 'cubeOut')

        doTweenAlpha('fade in', 'darkness', 1, 1.1, 'cubeOut')

        doTweenY('fall', 'death', 1000, 0.9, 'cubeInOut')
    end
    if curStep == 776 then
        doTweenAlpha('bye bye hud', 'camHUD', 0, 0.9, 'cubeOut')
    end
    if curStep == 848 then
        setProperty('darkness.alpha', 0)
        setProperty('sky.alpha', 1)
    end
     if curStep == 871 then

        startTween('haha big', 'dad.scale', {x = 0.7, y = 1.8}, 1, {ease = 'cubeOut'})
    end
    if curStep == 922 then
        cameraShake('game', 0.025, 1)
        doTweenY('ha farty fart', 'dad', 400, 0.5, 'cubeOut')
        startTween('haha big', 'dad.scale', {x = 3.7, y = 1.8}, 1, {ease = 'cubeOut'})
    end
end