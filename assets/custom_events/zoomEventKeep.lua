function onEvent(name, value1, value2)
    if name == "zoomEventKeep" then
        setProperty('defaultCamZoom', value1)
        doTweenZoom('smoothZoom', 'camGame', value1, value2, 'quadInOut') 
    end
end
