function onCreatePost()
initLuaShader("glitchy")
initLuaShader("invertcolor")

makeLuaSprite("temporaryShader1")
setSpriteShader("temporaryShader1", "glitchy")
makeLuaSprite("temporaryShader2")
setSpriteShader("temporaryShader2", "invertcolor")

		runHaxeCode([[
			trace(ShaderFilter);
			game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(game.getLuaObject("temporaryShader2").shader)]);

			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(game.getLuaObject("temporaryShader2").shader)]);

		]])
addHaxeLibrary("ShaderFilter1", "openfl.filters")
end


stop = true
AMT = 0
SPEED = 0
INV = 0
function onUpdate()
if not stop then
setShaderFloat("temporaryShader1", "iTime", os.clock())
setShaderFloat("temporaryShader1", "AMT", AMT)
setShaderFloat("temporaryShader1", "SPEED", SPEED)
setShaderInt("temporaryShader2", "invert", INV)
end
end

function mysplit (inputstr, sep)
if sep == nil then
sep = "%s";
end
local t = {};
for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
table.insert(t, str);
end
return t;
end
function onEvent(n,v1,v2)
local table = mysplit(v1,",");
local tabledos = mysplit(v2,",");
	if n == 'glitchy' then
stop = false

AMT = table[1]
SPEED = table[2]
INV = table[3]
runTimer('nduw', tabledos[1])
end
end

function onTimerCompleted(tag)
if tag == 'nduw' then
AMT = 0
SPEED = 0
INV = 0
setShaderFloat("temporaryShader1", "AMT", 0)
setShaderInt("temporaryShader2", "invert", 0)
stop = true
end
end