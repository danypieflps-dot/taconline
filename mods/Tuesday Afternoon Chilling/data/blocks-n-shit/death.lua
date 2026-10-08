function onGameOverStart()
    startVideo('minecraft_death')
    runTimer('deadTimer',3)
    setProperty('bf-dead.alpha', 0);
end

function onTimerCompleted(tag)
    if tag == 'deadTimer' then
           restartSong();
    end
end

