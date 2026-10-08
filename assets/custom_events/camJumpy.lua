function onEvent(event, value1, value2, strumTime)
    if event == "camJumpy" then
            doTweenY('jump', 'camHUD', -20, 0.26, 'cubeOut')
            runTimer('timer', 0.26)
    end
end

function onTimerCompleted(timer)
    doTweenY('jump', 'camHUD', 0, 0.26, 'cubeIn')
end