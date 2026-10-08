-- by LonliHH

local strumPos = nil
local off = 25

function onCreate()
	runHaxeCode([[
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

		var luaPath = findScript('scripts/arrows.lua');
		var daScript = null;
		if (luaPath != null) {
			for (luaInstance in game.luaArray) {
				if (luaInstance.scriptName == luaPath) {
					daScript = luaInstance;
					break;
				}
			}
		}

		if (daScript == null) debugPrint("Couldn't find arrows script :(", FlxColor.RED);



		function updatePlrArrowPos():Void {
			if (daScript != null) daScript.call('updatePlrArrowPos', []);
		}

		function updateOppArrowPos():Void {
			if (daScript != null) daScript.call('updateOppArrowPos', []);
		}



		createGlobalCallback('arrows_updatePlrArrowPos', updatePlrArrowPos);
		createGlobalCallback('arrows_updateOppArrowPos', updateOppArrowPos);
		createGlobalCallback('arrows_updateArrowPos', function():Void {
			updatePlrArrowPos();
			updateOppArrowPos();
		});
	]])
end

function onCreatePost()
	strumPos = {
		defaultOpponentStrumX0, defaultOpponentStrumY1, defaultOpponentStrumY2, defaultOpponentStrumX3,
		defaultPlayerStrumX0, defaultPlayerStrumY1, defaultPlayerStrumY2, defaultPlayerStrumX3
	}
end

function updatePlrArrowPos()
	strumPos[5] = getPropertyFromGroup('playerStrums', 0, 'x')
	strumPos[6] = getPropertyFromGroup('playerStrums', 1, 'y')
	strumPos[7] = getPropertyFromGroup('playerStrums', 2, 'y')
	strumPos[8] = getPropertyFromGroup('playerStrums', 3, 'x')
end

function updateOppArrowPos()
	strumPos[1] = getPropertyFromGroup('opponentStrums', 0, 'x')
	strumPos[2] = getPropertyFromGroup('opponentStrums', 1, 'y')
	strumPos[3] = getPropertyFromGroup('opponentStrums', 2, 'y')
	strumPos[4] = getPropertyFromGroup('opponentStrums', 3, 'x')
end

function goodNoteHit(i, d, t, s) silly(i, d, s, true) end
function opponentNoteHit(i, d, t, s) silly(i, d, s, false) end

function silly(i, d, s, p)
	if not getPropertyFromGroup('notes', i, 'ignoreNote') and not getPropertyFromGroup('notes', i, 'hitCausesMiss') then
		local dir = d
		if p then d = d + 4 end

		local pos = strumPos[d + 1]
		local dur = crochet / 1500
		local ease = 'circOut'
		local cOff = s and off / 2 or off

		if dir == 0 then
			setPropertyFromGroup('strumLineNotes', d, 'x', pos - cOff)
			noteTweenX('move'..d, d, pos, dur, ease)
		elseif dir == 1 then
			setPropertyFromGroup('strumLineNotes', d, 'y', pos + cOff)
			noteTweenY('move'..d, d, pos, dur, ease)
		elseif dir == 2 then
			setPropertyFromGroup('strumLineNotes', d, 'y', pos - cOff)
			noteTweenY('move'..d, d, pos, dur, ease)
		elseif dir == 3 then
			setPropertyFromGroup('strumLineNotes', d, 'x', pos + cOff)
			noteTweenX('move'..d, d, pos, dur, ease)
		end
	end
end