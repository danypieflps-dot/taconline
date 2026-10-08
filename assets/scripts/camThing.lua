-- by LonliHH

local lastMHS = nil
local isIdle = false
local angle = 0.4
local off = 35
local bx = 0
local by = 0
local dx = 0
local dy = 0

local forceFollow = false
local forceFollowChar = false -- false = dad, true = bf

function onCreate()
	runHaxeCode([[
		// fix for the black edges when the camera rotates
		var extra:Int = 5;

		if (game.camGame != null) {
			game.camGame.setSize(FlxG.width + extra*2, FlxG.height + extra*2);
			game.camGame.x -= extra;
			game.camGame.y -= extra;
		}



		function findScript(scriptFile:String, ?ext:String):String {
			if (ext == null) ext = '.lua';

			if (scriptFile.substr(-ext.length) != ext) scriptFile += ext;
			if (FileSystem.exists(scriptFile)) return scriptFile;

			var path:String = Paths.modFolders(scriptFile);
			if (FileSystem.exists(path)) return path;

			var preloadPath:String = Paths.getPreloadPath(scriptFile);
			if (FileSystem.exists(preloadPath)) return preloadPath;

			return null;
		}

		var luaPath = findScript('scripts/camThing.lua');
		var daScript = null;
		if (luaPath != null) {
			for (luaInstance in game.luaArray) {
				if (luaInstance.scriptName == luaPath) {
					daScript = luaInstance;
					break;
				}
			}
		}

		if (daScript == null) debugPrint("Couldn't find cam script :(", FlxColor.RED);



		createGlobalCallback('camThing_setAngle', function(angle:Float):Void {
			if (daScript != null) daScript.call('setAngle', [ angle ]);
		});

		createGlobalCallback('camThing_setOffset', function(offset:Float):Void {
			if (daScript != null) daScript.call('setOffset', [ offset ]);
		});

		createGlobalCallback('camThing_setBF', function(bx:Float, by:Float):Void {
			if (daScript != null) daScript.call('setBF', [ bx, by ]);
		});

		createGlobalCallback('camThing_addBF', function(bx:Float, by:Float):Void {
			if (daScript != null) daScript.call('addBF', [ bx, by ]);
		});

		createGlobalCallback('camThing_setDad', function(dx:Float, dy:Float):Void {
			if (daScript != null) daScript.call('setDad', [ dx, dy ]);
		});

		createGlobalCallback('camThing_addDad', function(dx:Float, dy:Float):Void {
			if (daScript != null) daScript.call('addDad', [ dx, dy ]);
		});
	]])
end

function setAngle(ang)
	angle = ang
end

function setOffset(offset)
	off = offset
end

function setBF(bfx, bfy)
	bx = bfx
	by = bfy
end

function addBF(bfx, bfy)
	bx = bx + bfx
	by = by + bfy
end

function setDad(dadx, dady)
	dx = dadx
	dy = dady
end

function addDad(dadx, dady)
	dx = dx + dadx
	dy = dy + dady
end

function onCreatePost()
	bfOffsets(boyfriendName)
	dadOffsets(dadName)

	callOnLuas('camThing_setupOffsets', {}) -- using close() on scripts that have this is optimal, but it's safer not to
end

function bfOffsets(bf)
	bx = getProperty('boyfriend.x') - 20
	by = getProperty('boyfriend.y') + 60
end

function dadOffsets(dad)
	dx = getProperty('dad.x') + 400
	dy = getProperty('dad.y') + 330
end

function onEvent(n, v1, v2)
	if n == 'Change Character' then onCreatePost() end

	if n == 'camThing--forceFollow' then
		local oldFF = forceFollow
		forceFollow = v1 ~= ''

		if forceFollow then
			forceFollowChar = v1 == 'bf'
			isIdle = true
			onTimerCompleted('followCamBack', 0, 0)
		elseif oldFF ~= forceFollow then
			isIdle = true
			onTimerCompleted('followCamBack', 0, 0)
		end
	end
end

function getCurSection()
	if forceFollow then return forceFollowChar else return mustHitSection end
end

function onBeatHit()
	if curBeat % 4 == 0 and (lastMHS == nil or lastMHS ~= getCurSection()) and isIdle then
		lastMHS = getCurSection()
		onTimerCompleted('followCamBack', 0, 0)
	end
end

function opponentNoteHit(i, d, t, s) hit(i, d, false) end
function goodNoteHit(i, d, t, s) hit(i, d, true) end

function hit(i, d, p)
	if (getCurSection() == p) and not getPropertyFromGroup('notes', i, 'ignoreNote') and not getPropertyFromGroup('notes', i, 'hitCausesMiss') and not getPropertyFromGroup('notes', i, 'noAnimation') then
		local cx
		local cy

		if p then
			cx = bx
			cy = by
		else
			cx = dx
			cy = dy
		end

		if d == 0 then fcam(cx - off, cy); rot(-angle)
		elseif d == 1 then fcam(cx, cy + off); rot(-angle/4)
		elseif d == 2 then fcam(cx, cy - off); rot(angle/4)
		elseif d == 3 then fcam(cx + off, cy); rot(angle) end

		cancelTimer('followCamBack')
		runTimer('followCamBack', (stepCrochet / 1000) * 6.1)

		isIdle = false
	end
end

function fcam(x, y)
	triggerEvent('Camera Follow Pos', x, y)
	setProperty('isCameraOnForcedPos', true)
end

function rot(ang)
	doTweenAngle('cam', 'camGame', ang, crochet / 2500, 'sineOut')
end

function onTimerCompleted(t, l, ll)
	if t == 'followCamBack' then
		if getCurSection() then fcam(bx, by)
		else fcam(dx, dy) end

		rot(0)

		isIdle = true
	end
end