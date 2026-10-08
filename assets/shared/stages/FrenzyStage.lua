isRaining = false
rainChance = 0

function onCreate()
    makeLuaSprite('skybgbutgay', 'frenzybg/skybgbutrllygay', -1200, 0)
    makeLuaSprite('skybg','frenzybg/skybg', -1200, 0)
    makeLuaSprite('bgroad', 'frenzybg/bridge1', 1300, 100)
    makeLuaSprite('bgroad2', 'frenzybg/bridge2', -400, 250)
    makeLuaSprite('city', 'frenzybg/city', -100, 100)
    makeLuaSprite('pavement', 'frenzybg/floor', -1200, 1204)
    makeLuaSprite('grafWall', 'frenzybg/wall', -600, 950)
    makeLuaSprite('cloud1', 'frenzybg/cloud1', -900,-200)
    makeLuaSprite('cloud2', 'frenzybg/cloud2', 400,-400)
    makeLuaSprite('cloud3', 'frenzybg/cloud3', 1300,-200)

    addLuaSprite('skybgbutgay')
    addLuaSprite('skybg')
    addLuaSprite('bgroad')
    addLuaSprite('bgroad2')
    addLuaSprite('city')
    addLuaSprite('pavement')
    addLuaSprite('grafWall')
    addLuaSprite('cloud1')
    addLuaSprite('cloud2')
    addLuaSprite('cloud3')

    scaleObject('skybgbutgay', 2, 1)
    scaleObject('skybg', 2, 1)
    scaleObject('grafWall', 1, 1)
    scaleObject('bgroad', 1, 1)
    scaleObject('city', 1, 1)
    scaleObject('bgroad2', 1, 1)
    scaleObject('pavement', 1, 1)
    scaleObject('cloud1', 1, 1)
    scaleObject('cloud2', 1, 1)
    scaleObject('cloud3', 1, 1)
    
    setScrollFactor('bgroad', 0.5,0.5)
    setScrollFactor('bgroad2', 0.5,0.5)
    setScrollFactor('cloud1', 0.5,0.5)
    setScrollFactor('cloud2', 0.5,0.5)
    setScrollFactor('cloud3', 0.5,0.5)
    setScrollFactor('city', 0.5,0.5)

    
    setObjectOrder('skybgbutgay', 0)
    setObjectOrder('skybg', 1)
    setObjectOrder('bgroad', 6)
    setObjectOrder('bgroad2', 6)
    setObjectOrder('city', 3)
    setObjectOrder('pavement', 9)
    setObjectOrder('grafWall', 8)
    setObjectOrder('cloud1', 7)
    setObjectOrder('cloud2', 7)
    setObjectOrder('cloud3', 7)
end

function onEventPushed(event, value1, value2, strumTime)
    if event == 'Plane Fly By' then

        makeAnimatedLuaSprite('plane', 'food event/plane', 2500, 170)
        addAnimationByPrefix('plane', 'closed', 'closed', 24, true)
        addAnimationByPrefix('plane', 'open', 'open', 24, true)
        playAnim('plane', 'closed')
        scaleObject('plane', 0.6, 0.6)
        setScrollFactor('plane', 0.5, 0.6)
        addLuaSprite('plane', false)
        setObjectOrder('plane', 5)

        makeLuaSprite('ball', 'food event/ball', getProperty('plane.x') + getProperty('plane.width') - 70*1.3, getProperty('plane.y') + 70*1.3)
        scaleObject('ball', 0.15, 0.15)
        setScrollFactor('ball', 0.5, 0.6)
        addLuaSprite('ball', false)
        setObjectOrder('ball', 4)
    end

    if event == 'Rain Food' then
        addHScript('scripts/food object/FoodRain')
    end
end

function onEvent(event, value1, value2, strumTime)
    if event == 'Plane Fly By' then
        if value1 == nil or value1 == '' then
            value1 = 0
        end
        if value2 == nil or value2 == '' then
            value2 = 0
        end
        doTweenX('planeTween', 'plane', -500, value1)
        runTimer('ballDrop', value2)
    end
    if event == 'Rain Food' then
        if value1 == true or value1 == 'true'then
            isRaining = true
            rainChance = tonumber(value2)
            if lowQuality then
                rainChance = rainChance / 2
            end
        else
            isRaining = false
        end
    end
    if event == 'Gayset' then
        doTweenAlpha('skybgTween', 'skybg', 0, 2)
    end
end

function onTweenCompleted(tag)
    if tag == 'planeTween' then
        setProperty('plane.angle', -78)
        doTweenY('planeFall', 'plane', 9000, 2, 'quadIn')
    end
    if tag == 'planeFall' then
        triggerEvent('Screen Shake', '0.1, 0.01', '0.05, 0.05')
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ballDrop' then
        playAnim('plane', 'open')
        setProperty('ball.x', getProperty('plane.x') + getProperty('plane.width') - 70*1.3)
        setProperty('ball.y', getProperty('plane.y') + 70*1.3)
        startTween('ballTween', 'ball', {x = getProperty('ball.x') + getRandomFloat(-80, 10), y = 1200}, getRandomFloat(2, 3), 'quadIn')
    end
end

function onUpdate(elapsed)
    if isRaining then
        if getRandomBool(rainChance) then
            callOnHScript('makeFallingFood', {getRandomFloat(-200, 2200), getRandomFloat(100, 200)})
        end
    end
end