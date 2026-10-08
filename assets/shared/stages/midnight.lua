isStarry = false
starChance = 0

function onCreate()
    makeLuaSprite('sky', 'midnightbg/nightsky', 0, 0)
    scaleObject('sky', 5, 5)
    addLuaSprite('sky', false)

    makeLuaSprite('moon', 'midnightbg/marioMoon', 2000, 1200)
    addLuaSprite('moon', false)
    scaleObject('moon', 2, 2)

    makeLuaSprite('trees', 'midnightbg/backTrees', -200, 250)
    scaleObject('trees', 2, 2)
    addLuaSprite('trees', false)

    runHaxeCode([[
        
        import flixel.addons.display.FlxBackdrop; //this should work cuz psych uses it in note color menu, but if not use default asset
        import backend.ClientPrefs;

        var fence:FlxBackdrop = new FlxBackdrop(Paths.image('midnightbg/fencing'), 1, -3, 0);
		fence.x = -40;
		fence.y = 1770;
        fence.scale.set(2, 2);
		fence.velocity.set(0, 0);
        fence.antialiasing = ClientPrefs.data.antialiasing;
        addBehindGF(fence);
    ]])

    makeLuaSprite('floor', 'midnightbg/streetfloor', -20, 2150)
    scaleObject('floor', 2, 2)
    addLuaSprite('floor', false)

    makeLuaSprite('wall', 'midnightbg/littleTinyWall', -20, 2000)
    scaleObject('wall', 2, 2)
    addLuaSprite('wall', false)

    makeLuaSprite('rock', 'midnightbg/CoolAssRock', 90, 1900)
    scaleObject('rock', 2, 2)
    addLuaSprite('rock', false)

    makeLuaSprite('shop', 'midnightbg/shop', 2350, 1600)
    scaleObject('shop', 2, 2)
    addLuaSprite('shop', false)

    makeLuaSprite('road', 'midnightbg/epicRoad', -120, 2420)
    scaleObject('road', 3, 3)
    addLuaSprite('road', false)

    makeLuaSprite('sidewalk', 'midnightbg/pavement', 0, 2200)
    scaleObject('sidewalk', 2, 2)
    addLuaSprite('sidewalk', false)

    --character tiiiiiiiime!!!!!!!!!
    makeLuaSprite('jack', 'midnightbg/characters/jack', 2200, 1740)
    scaleObject('jack', 0.9, 0.9)
    addLuaSprite('jack', false)

    makeLuaSprite('l8', 'midnightbg/characters/loll8', 2400, 1780)
    scaleObject('l8', 1.1, 1.1)
    setProperty('l8.flipX', true)
    addLuaSprite('l8', false)

    makeLuaSprite('car', 'midnightbg/characters/car', 1000, 1860)
    setProperty('car.flipX', true)
    addLuaSprite('car', false)

    makeLuaSprite('two', 'midnightbg/characters/two', 600, 1760)
    scaleObject('two', 1.1, 1.1)
    setProperty('two.flipX', false)
    addLuaSprite('two', false)

    makeLuaSprite('cloudy', 'midnightbg/characters/cloudy', 300, 2000)
    setProperty('cloudy.flipX', true)
    scaleObject('cloudy', 1, 1)
    addLuaSprite('cloudy', false)

    makeLuaSprite('ratx', 'midnightbg/characters/ratx', 2700, 1980)
    scaleObject('ratx', 1, 1)
    addLuaSprite('ratx', false)

    makeLuaSprite('fic', 'midnightbg/characters/fic', 3000, 2000)
    scaleObject('fic', 1, 1)
    addLuaSprite('fic', false)

    makeLuaSprite('dark')
    makeGraphic('dark', 4000, 4000, '000000')
    setProperty('dark.alpha', 0)
    addLuaSprite('dark', false)

    makeLuaSprite('sidewalk2', 'midnightbg/frontPavement', -260, 2740)
    scaleObject('sidewalk2', 2, 2)
    addLuaSprite('sidewalk2', true)

    makeLuaSprite('tired', 'midnightbg/characters/imtired', 350, 2200)
    setProperty('tired.flipX', true)
    scaleObject('tired', 2, 2)
    addLuaSprite('tired', true)

    makeLuaSprite('tophats', 'midnightbg/characters/tophats', 2500, 2100)
    scaleObject('tophats', 2, 2)
    addLuaSprite('tophats', true)

    --setProperty('dad.alpha', 0)
    --setProperty('bf.alpha', 0)
    --setProperty('gf.alpha', 0)

end

function onEventPushed(event, value1, value2, strumTime)
    if event == 'Starry Night' then
        addHScript('scripts/Stars/Stars')
    end
end

function onEvent(event, value1, value2, strumTime)
    if event == 'Starry Night' then
        if value1 == 'true' then
            isStarry = true
            starChance = value2

            setProperty('dark.alpha', 1)
            setProperty('sidewalk2.alpha', 0)
            setProperty('tired.alpha', 0)
            setProperty('tophats.alpha', 0)

            runHaxeCode([[
                // redmult, bluemult, greenmult, alphamult, redadd, blueadd, greenadd, alphaadd
                boyfriend.setColorTransform(1, 1, 1, 1, 500, 500, 500, 0);
                dad.setColorTransform(1, 1, 1, 1, 500, 500, 500, 0);
                gf.setColorTransform(1, 1, 1, 1, 500, 500, 500, 0);
            ]])
        else
            isStarry = false
            runTimer('waitingforstars', 0)
        end
    end
end

function onUpdate(elapsed)
    if isStarry then
        if getRandomBool(starChance) then
            callOnHScript('makeFallingStars', {4000, getRandomFloat(1000, 4000)})
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'waitingforstars' then
        setProperty('dark.alpha', 0)
        setProperty('sidewalk2.alpha', 1)
        setProperty('tired.alpha', 1)
        setProperty('tophats.alpha', 1)
        runHaxeCode([[
            // redmult, bluemult, greenmult, alphamult, redadd, blueadd, greenadd, alphaadd
            boyfriend.setColorTransform();
            dad.setColorTransform();
            gf.setColorTransform();
        ]])
    end
end