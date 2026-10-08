--created with Super_Hugo's Stage Editor v1.6.3

function onCreate()

	makeLuaSprite('obj11', 'minecraftmovie/sheep', 1518, 477)
	setObjectOrder('obj11', 0)
	scaleObject('obj11', 0.9, 0.9)
	setProperty('obj11.flipX', true)
	addLuaSprite('obj11', true)
	
	makeLuaSprite('obj12', 'minecraftmovie/sheep', -806, 277)
	setObjectOrder('obj12', 0)
	scaleObject('obj12', 0.9, 0.9)
	addLuaSprite('obj12', true)
	
	makeLuaSprite('obj13', 'minecraftmovie/minecraftreal', -1526, -931)
	setObjectOrder('obj13', 0)
	scaleObject('obj13', 2.3, 2.3)
	addLuaSprite('obj13', true)
	
	makeLuaSprite('obj14', 'minecraftmovie/momoa', 1404, 301)
	setObjectOrder('obj14', 20)
	scaleObject('obj14', 2.9, 2.9)
	setProperty('obj14.antialiasing', false)
	addLuaSprite('obj14', true)
	
end