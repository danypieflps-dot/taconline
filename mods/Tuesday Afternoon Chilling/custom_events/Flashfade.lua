
function onCreatePost()
makeLuaSprite('ffade', nil, 0, 0)
makeGraphic('ffade', screenWidth, screenHeight, 'ffffff')
setProperty('ffade.alpha', 0)
setObjectCamera('ffade', 'other')
addLuaSprite('ffade', true)
end

function onEvent(name, value1, value2)
if name == 'Flashfade' then
doTweenAlpha('nsiw177', 'ffade', 1, value1, 'linear')


end
end


function onTweenCompleted(t)
if t == 'nsiw177' then
setProperty('ffade.alpha', 0)
end
end