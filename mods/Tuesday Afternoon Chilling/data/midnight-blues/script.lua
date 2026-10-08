
function onCreatePost()
    setProperty('camGame.zoom', 1.4)
    setProperty('cameraSpeed', 0.5)

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

     noteTweenAlpha('martha note 1', 0, 0, 0.01)
     noteTweenAlpha('martha note 2', 1, 0, 0.01)
     noteTweenAlpha('martha note 3', 2, 0, 0.01)
     noteTweenAlpha('martha note 4', 3, 0, 0.01)

     noteTweenAlpha('barry note 1', 4, 0, 0.01)
     noteTweenAlpha('barry note 2', 5, 0, 0.01)
     noteTweenAlpha('barry note 3', 6, 0, 0.01)
     noteTweenAlpha('barry note 4', 7, 0, 0.01)

    setObjectOrder('dad', 50)
    setObjectOrder('boyfriend', 50)
    setObjectOrder('gf', 46)

    setProperty('dad.alpha', 0)
    setProperty('boyfriend.alpha', 0)
    setProperty('gf.alpha', 0)
end

function onStepHit()
    if curStep == 4 then
        doTweenAlpha('martha appear', 'dad', 1, 2)

        doTweenAlpha('woah image of martha', 'drad', 1, 4, 'cubeOut')
     doTweenAlpha('woah health of martha', 'drad Percent', 1, 4, 'cubeOut')

     noteTweenAlpha('martha note 1', 0, 1, 4, 'cubeOut')
     noteTweenAlpha('martha note 2', 1, 1, 4, 'cubeOut')
     noteTweenAlpha('martha note 3', 2, 1, 4, 'cubeOut')
     noteTweenAlpha('martha note 4', 3, 1, 4, 'cubeOut')
    end
    if curStep == 56 then
        setProperty('cameraSpeed', 0.7)
        doTweenAlpha('barry appear', 'boyfriend', 1, 2)

        doTweenAlpha('woah image of barry', 'boyf', 1, 2, 'cubeOut')
     doTweenAlpha('woah health of barry', 'boyf Percent', 1, 2, 'cubeOut')
     doTweenAlpha('wait theres misses', 'misses', 1, 2, 'cubeOut')
     doTweenAlpha('oh and score', 'score', 1, 2, 'cubeOut')

     noteTweenAlpha('barry note 1', 4, 1, 2, 'cubeOut')
     noteTweenAlpha('barry note 2', 5, 1, 2, 'cubeOut')
     noteTweenAlpha('barry note 3', 6, 1, 2, 'cubeOut')
     noteTweenAlpha('barry note 4', 7, 1, 2, 'cubeOut')
    end
    if curStep == 68 then
        doTweenAlpha('ginevra appear', 'gf', 1, 4)
        setProperty('cameraSpeed', 1.4)
        setProperty('defaultCamZoom', 0.7)
        doTweenZoom('smoothZoom', 'camGame', 0.7, 7) 
    end
    if curStep == 128 then
        setProperty('darkness.alpha', 0)
        setObjectOrder('dad', 20)
    setObjectOrder('boyfriend', 21)
    setObjectOrder('gf', 18)

    setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 2, 'cubeOut') 
    end
    if curStep == 260 then
        setProperty('defaultCamZoom', 1)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 0.44, 'cubeIn') 
    end
    if curStep == 264 then
        setProperty('defaultCamZoom', 0.5)
        doTweenZoom('smoothZoom', 'camGame', 0.5, 2, 'cubeOut') 
    end
    if curStep == 376 then
        doTweenAlpha('fade in', 'darkness', 1, 0.9)
        setProperty('defaultCamZoom', 0.8)
        doTweenZoom('smoothZoom', 'camGame', 0.8, 0.9, 'cubeOut') 
    end
    if curStep == 384 then
        doTweenAlpha('hud go bye bye', 'camHUD', 0, 4, 'cubeOut')

        setProperty('darkness.alpha', 0)
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 1, 'cubeOut') 
    end
    if curStep == 504 then
        doTweenAlpha('hud go hi hi', 'camHUD', 1, 0.9, 'cubeIn')
    end
    if curStep == 640 then
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('smoothZoom', 'camGame', 0.6, 1, 'cubeOut') 
    end
    if curStep == 896 then
        setProperty('cameraSpeed', 0.8)
        setProperty('defaultCamZoom', 1)
        doTweenZoom('smoothZoom', 'camGame', 1, 1, 'cubeOut') 

        doTweenAlpha('hud go bye bye', 'camHUD', 0, 8, 'cubeOut')
    end
    if curStep == 1024 then
        doTweenAlpha('fade away again', 'darkness', 1, 14)
    end
end