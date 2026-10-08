function onCreatePost()
    setProperty('camGame.zoom', 2.8)
    setProperty('cameraSpeed', 0.07)
    setCameraScroll(700.0, -250.0)

    --setProperty('camGame.visible', false)
    --setProperty('camHUD.visible', false)

    makeLuaSprite('darkness', 0, -1800, -1800, 720)
    makeGraphic('darkness', 6000, 6000, '000000')
    setObjectCamera('darkness', 'game', false)
    addLuaSprite('darkness')
    setProperty('darkness.alpha', 1)
    setObjectOrder('darkness', 40)

    doTweenAlpha('fade out', 'darkness', 0, 9)

    makeLuaSprite('pear', 'tetoSTAGE/pear', 0, 0)
    scaleObject('pear', 4, 2)
    addLuaSprite('pear', false)
    setObjectCamera('pear', 'hud')
    setProperty('pear.alpha', 0)

    makeLuaSprite('nice', 'tetoSTAGE/nice', 0, 0)
    scaleObject('nice', 5, 2.5)
    addLuaSprite('nice', false)
    setObjectCamera('nice', 'hud')
    setProperty('nice.alpha', 0)

    makeLuaSprite('one', 'tetoSTAGE/one', 0, 0)
    scaleObject('one', 2, 2)
    addLuaSprite('one', false)
    setObjectCamera('one', 'hud')
    setProperty('one.alpha', 0)

    makeLuaSprite('two', 'tetoSTAGE/two', 0, 0)
    scaleObject('two', 2, 2)
    addLuaSprite('two', false)
    setObjectCamera('two', 'hud')
    setProperty('two.alpha', 0)

    makeLuaSprite('a', 'Screenshot 2026-02-20 225452', 530, 200)
    scaleObject('a', 1, 1)
    addLuaSprite('a', false)
    setObjectCamera('a', 'hud')
    setProperty('a.alpha', 0)

         setProperty('boyf.alpha', 0)
     setProperty('boyf Percent.alpha', 0)

     setProperty('drad.alpha', 0)
     setProperty('drad Percent.alpha', 0)

     setProperty('misses.alpha', 0)
     setProperty('score.alpha', 0)

     noteTweenAlpha('tet note 1', 0, 0, 0.01)
     noteTweenAlpha('tet note 2', 1, 0, 0.01)
     noteTweenAlpha('tet note 3', 2, 0, 0.01)
     noteTweenAlpha('tet note 4', 3, 0, 0.01)

     noteTweenAlpha('barry note 1', 4, 0, 0.01)
     noteTweenAlpha('barry note 2', 5, 0, 0.01)
     noteTweenAlpha('barry note 3', 6, 0, 0.01)
     noteTweenAlpha('barry note 4', 7, 0, 0.01)

     doTweenX('gi', 'gf', 400, 0.01, 'quadOut')
end

function onStepHit()
    if curStep == 1 then
        setProperty('camGame.visible', true)
        setProperty('defaultCamZoom', 0.8)
        doTweenZoom('smoothZoom', 'camGame', 0.8, 8.5, 'cubeIn') 
    end
    if curStep == 120 then
        setProperty('one.alpha', 1)
        startTween('big', 'one.scale', {x = 2.1, y = 2.1}, 0.4, {ease = 'cubeOut'})
    end
    if curStep == 124 then
        setProperty('one.alpha', 0)
        setProperty('two.alpha', 1)
        startTween('big', 'two.scale', {x = 2.1, y = 2.1}, 0.4, {ease = 'cubeOut'})
    end
    if curStep == 128 then
        setProperty('two.alpha', 0)
                 setProperty('boyf.alpha', 1)
     setProperty('boyf Percent.alpha', 1)

     setProperty('drad.alpha', 1)
     setProperty('drad Percent.alpha', 1)

     setProperty('misses.alpha', 1)
     setProperty('score.alpha', 1)

     noteTweenAlpha('tet note 1', 0, 1, 0.01)
     noteTweenAlpha('tet note 2', 1, 1, 0.01)
     noteTweenAlpha('tet note 3', 2, 1, 0.01)
     noteTweenAlpha('tet note 4', 3, 1, 0.01)

     noteTweenAlpha('barry note 1', 4, 1, 0.01)
     noteTweenAlpha('barry note 2', 5, 1, 0.01)
     noteTweenAlpha('barry note 3', 6, 1, 0.01)
     noteTweenAlpha('barry note 4', 7, 1, 0.01)

        cameraFlash('hud', '0xFFFFFF', 0.6, false)

        setProperty('cameraSpeed', 1)
    end
    if curStep == 176 then
        setProperty('defaultCamZoom', 1)
        doTweenZoom('smoothZoom', 'camGame', 1, 0.8, 'cubeOut') 
    end
    if curStep == 240 then
        setProperty('defaultCamZoom', 1)
        doTweenZoom('smoothZoom', 'camGame', 1, 0.8, 'cubeOut') 
    end
    if curStep == 252 then
        setProperty('one.alpha', 1)
        startTween('big', 'one.scale', {x = 2.1, y = 2.1}, 0.4, {ease = 'cubeOut'})
    end
    if curStep == 256 then
        setProperty('one.alpha', 0)
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 0.8, 'cubeOut') 
    end
    if curStep == 384 then
        setProperty('defaultCamZoom', 0.8)
        doTweenZoom('smoothZoom', 'camGame', 0.8, 0.8, 'cubeOut') 
    end
    if curStep == 632 then
        setProperty('a.alpha', 0.2)
        setProperty('defaultCamZoom', 0.75)
    end
    if curStep == 634 then
        setProperty('a.alpha', 0.4)
        setProperty('defaultCamZoom', 0.8)
        startTween('big', 'a.scale', {x = 1.2, y = 1.2}, 0.01, {ease = 'cubeOut'})
    end
    if curStep == 636 then
        setProperty('a.alpha', 0.6)
        setProperty('defaultCamZoom', 0.85)
        startTween('big', 'a.scale', {x = 1.5, y = 1.3}, 0.01, {ease = 'cubeOut'})
    end
    if curStep == 638 then
        setProperty('a.alpha', 0.8)
        setProperty('defaultCamZoom', 0.9)
        startTween('big', 'a.scale', {x = 1.8, y = 1.5}, 0.01, {ease = 'cubeOut'})
    end
    if curStep == 640 then
        setProperty('a.alpha', 0)
        setProperty('two.alpha', 1)
        startTween('big', 'two.scale', {x = 2.1, y = 2.1}, 0.4, {ease = 'cubeOut'})
        doTweenAlpha('ha', 'two', 0, 1, 'cubeOut')
    end
    if curStep == 1020 then
        setProperty('one.alpha', 1)
        startTween('big', 'one.scale', {x = 2.1, y = 2.1}, 0.4, {ease = 'cubeOut'})
    end
    if curStep == 1024 then
        setProperty('one.alpha', 0)
    end
    if curStep == 1136 then
        setProperty('defaultCamZoom', 1)
        doTweenZoom('smoothZoom', 'camGame', 1, 0.4, 'cubeOut') 
    end
    if curStep == 1148 then
        setProperty('defaultCamZoom', 1.2)
        doTweenZoom('smoothZoom', 'camGame', 1.2, 0.25, 'cubeIn') 
    end
    if curStep == 1152 then
        setProperty('defaultCamZoom', 0.7)
        doTweenZoom('smoothZoom', 'camGame', 0.7, 1, 'cubeOut') 

        setProperty('bacvk.alpha', 0)
        setProperty('sprite2.alpha', 0)
        setProperty('sprite1.alpha', 0)
        setProperty('stairs.alpha', 0)
        setProperty('sprite3.alpha', 0)
    end
    if curStep == 1280 then
        setProperty('defaultCamZoom', 0.85)
        doTweenZoom('smoothZoom', 'camGame', 0.85, 0.8, 'cubeOut') 
    end
    if curStep == 1404 then
        setProperty('defaultCamZoom', 1)
        doTweenZoom('smoothZoom', 'camGame', 1, 0.26, 'cubeIn') 
    end
    if curStep == 1408 then
        setProperty('defaultCamZoom', 0.7)
        doTweenZoom('smoothZoom', 'camGame', 0.7, 1, 'cubeOut') 

        setProperty('bacvk.alpha', 1)
        setProperty('sprite2.alpha', 1)
        setProperty('sprite1.alpha', 1)
        setProperty('stairs.alpha', 1)
        setProperty('sprite3.alpha', 1)
    end
    if curStep == 1528 then
        setProperty('defaultCamZoom', 0.65)
        doTweenZoom('smoothZoom', 'camGame', 0.65, 0.16, 'cubeOut') 
    end
    if curStep == 1532 then
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 0.16, 'cubeOut') 
    end
    if curStep == 1536 then
        setProperty('defaultCamZoom', 0.7)
        doTweenZoom('smoothZoom', 'camGame', 0.7, 0.6, 'cubeOut') 
    end
    if curStep == 1584 then
        setProperty('defaultCamZoom', 0.73)
        doTweenZoom('smoothZoom', 'camGame', 0.73, 0.16, 'cubeOut') 
    end
    if curStep == 1588 then
        setProperty('defaultCamZoom', 0.76)
        doTweenZoom('smoothZoom', 'camGame', 0.76, 0.16, 'cubeOut') 
    end
    if curStep == 1592 then
        setProperty('defaultCamZoom', 0.79)
        doTweenZoom('smoothZoom', 'camGame', 0.79, 0.16, 'cubeOut') 
    end
    if curStep == 1596 then
        setProperty('defaultCamZoom', 0.85)
        doTweenZoom('smoothZoom', 'camGame', 0.85, 0.26, 'cubeIn') 
    end
    if curStep == 1600 then
        setProperty('defaultCamZoom', 0.7)
        doTweenZoom('smoothZoom', 'camGame', 0.7, 0.8, 'cubeOut') 
    end
    if curStep == 1648 then
        setProperty('defaultCamZoom', 0.73)
        doTweenZoom('smoothZoom', 'camGame', 0.73, 0.16, 'cubeOut') 
    end
    if curStep == 1652 then
        setProperty('defaultCamZoom', 0.76)
        doTweenZoom('smoothZoom', 'camGame', 0.76, 0.16, 'cubeOut') 
    end
    if curStep == 1656 then
        setProperty('defaultCamZoom', 0.79)
        doTweenZoom('smoothZoom', 'camGame', 0.79, 0.16, 'cubeOut') 
    end
    if curStep == 1660 then
        setProperty('defaultCamZoom', 0.85)
        doTweenZoom('smoothZoom', 'camGame', 0.85, 0.26, 'cubeIn') 
    end
    if curStep == 1664 then
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 0.8, 'cubeOut') 
    end
    if curStep == 1916 then
        setProperty('defaultCamZoom', 0.8)
        doTweenZoom('smoothZoom', 'camGame', 0.8, 0.26, 'cubeIn') 
    end
    if curStep == 1920 then
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 0.8, 'cubeOut') 
    end
    if curStep == 1938 then
        setProperty('boyf.alpha', 0)
     setProperty('boyf Percent.alpha', 0)

     setProperty('drad.alpha', 0)
     setProperty('drad Percent.alpha', 0)

     setProperty('misses.alpha', 0)
     setProperty('score.alpha', 0)

     noteTweenAlpha('tet note 1', 0, 0, 0.01)
     noteTweenAlpha('tet note 2', 1, 0, 0.01)
     noteTweenAlpha('tet note 3', 2, 0, 0.01)
     noteTweenAlpha('tet note 4', 3, 0, 0.01)

     noteTweenAlpha('barry note 1', 4, 0, 0.01)
     noteTweenAlpha('barry note 2', 5, 0, 0.01)
     noteTweenAlpha('barry note 3', 6, 0, 0.01)
     noteTweenAlpha('barry note 4', 7, 0, 0.01)

        setProperty('darkness.alpha', 1)
    end



    if curStep == 1968 then
        if misses > 0 then
            doTweenAlpha('you did good', 'pear', 1, 10)
        else
            doTweenAlpha('you did bad', 'nice', 1, 10)
        end
    end
end