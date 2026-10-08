import shaders.RGBPalette.RGBShaderReference;

import psychlua.CustomSubstate;

import backend.MusicBeatState;
import backend.Mods;
import backend.ClientPrefs;
import backend.Paths;

import objects.Note;

import options.OptionsState;


import states.FreeplayState;
import states.StoryMenuState;

import substates.PauseSubState;

import tjson.TJSON;

var inPause:Bool = false;
var songInfo:Dynamic = null;
var pauseOptions:Array<FlxSprite> = [];
var option:FlxSprite;
var rgbShader:RGBShaderReference;

var gameOverlay:FlxSprite;
var charPortrait:FlxSprite;
var selector:FlxSprite;

var creditsText:FlxText;
var randomQuote:FlxText;

var canSelect:Bool = false;
var infoExists:Bool = false;
var curTab:Int = 0;

function onCreate() {

    gameOverlay = new FlxSprite(0, 0, Paths.image('pause/overlay'));
    gameOverlay.antialiasing = ClientPrefs.data.antialiasing;
    gameOverlay.alpha = 0;
    add(gameOverlay);

    if (Paths.fileExists('images/pauseArt/' + dad.curCharacter + '.png', 'IMAGE')) {
        charPortrait = new FlxSprite(2064, 0, Paths.image('pauseArt/' + dad.curCharacter));
    } else {
        charPortrait = new FlxSprite(2064, 0, Paths.image('pauseArt/boyfriend'));
    }
    charPortrait.antialiasing = ClientPrefs.data.antialiasing;
    charPortrait.scale.set(0.8, 0.8);
    add(charPortrait);

    for (i in 0...4) {

        option = new FlxSprite(-593, (i + 1) * 150 - 160, Paths.image('pause/' + (i + 1)));
        option.antialiasing = ClientPrefs.data.antialiasing;
        option.scale.set(0.5, 0.5);
        option.cameras = [camOther];

        rgbShader = new RGBShaderReference(option, Note.initializeGlobalRGBShader(i));

        var arr:Array<FlxColor> = (PlayState.isPixelStage ? ClientPrefs.data.arrowRGBPixel[i] : ClientPrefs.data.arrowRGB[i]);

		if(i <= arr.length)
		{
			@:bypassAccessor
			{
				rgbShader.r = arr[0];
				rgbShader.g = arr[1];
				rgbShader.b = arr[2];
			}
		}

        pauseOptions.push(option);
        add(option);
    }

    selector = new FlxSprite(-593, 1 * 150 - 160, Paths.image('pause/selector'));
    selector.antialiasing = ClientPrefs.data.antialiasing;
    selector.scale.set(0.5, 0.5);
    add(selector);

    if(Paths.fileExists('data/' + songName + '/songInfo.json', 'TEXT')) {
        infoExists = true;
        songInfo = TJSON.parse(Paths.getTextFromFile('data/' + songName + '/songInfo.json'));

        creditsText = new FlxText(1700, 25, 700, 'Artist: ' + songInfo.artist + '\nComposer: ' + songInfo.composer + '\nCharter: ' + songInfo.charter, 16);
        creditsText.antialiasing = false;
        creditsText.alignment = 'CENTER';
        creditsText.scale.set(1.5, 1.5);
        creditsText.borderSize = 2;
        creditsText.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, 'CENTER', 'OUTLINE', FlxColor.BLACK);
        creditsText.cameras = [camOther];
        add(creditsText);

        randomQuote = new FlxText(1700, 675, 700, songInfo.quote[FlxG.random.int(0, songInfo.quote.length - 1)], 16);
        randomQuote.antialiasing = false;
        randomQuote.scale.set(1.5, 1.5);
        randomQuote.borderSize = 2;
        randomQuote.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, 'CENTER', 'OUTLINE', FlxColor.BLACK);
        randomQuote.cameras = [camOther];
        add(randomQuote);
    }

    // cameras
    gameOverlay.cameras = charPortrait.cameras = selector.cameras = [camOther];
}

function onPause() {
    if (!PlayState.isChartingMode) {
        inPause = true;
        CustomSubstate.openCustomSubstate('pause', true);
        return Function_Stop;
    }
}

function onCustomSubstateCreate(name:String) {
    if (name == 'pause') {
        FlxTween.tween(gameOverlay, { alpha: 1 }, 0.16, { ease: FlxEase.quintOut });

        var num:Int = -1;
        for (option in pauseOptions) {
            num = num + 1;
            FlxTween.tween(option, { x: -127 }, 0.16, { ease: FlxEase.quintOut, startDelay: 0.1 * num});
        }

        FlxTween.tween(selector, { x: -127 }, 0.16, { ease: FlxEase.quintOut });
        FlxTween.tween(charPortrait, { x: 510 }, 0.16, { ease: FlxEase.quintOut });
        if (infoExists) {
            FlxTween.tween(creditsText, { x: 626 }, 0.16, { ease: FlxEase.quintOut });
            FlxTween.tween(randomQuote, { x: 626 }, 0.16, { ease: FlxEase.quintOut });
        }

        canSelect = true;
    }
}

function onCustomSubstateDestroy(name:String) {
    if (name == 'pause') {
        inPause = false;
        canSelect = false;
        FlxTween.tween(gameOverlay, { alpha: 0 }, 0.16, { ease: FlxEase.quintIn });

        var num:Int = -1;
        for (option in pauseOptions) {
            num = num + 1;
            FlxTween.tween(option, { x: -593 }, 0.16, { ease: FlxEase.quintIn });
        }

        FlxTween.tween(selector, { x: -593 }, 0.16, { ease: FlxEase.quintIn });
        FlxTween.tween(charPortrait, { x: 2064 }, 0.16, { ease: FlxEase.quintIn });
        if (infoExists) {
            FlxTween.tween(creditsText, { x: 1700 }, 0.16, { ease: FlxEase.quintIn });
            FlxTween.tween(randomQuote, { x: 1700 }, 0.16, { ease: FlxEase.quintIn });
        }
    }
}

function onCustomSubstateUpdate(name:String, elapsed:Float) {
    if (name == 'pause' && canSelect) {
        if (controls.UI_UP_P) {
            curTab = curTab - 1;
            if (curTab < 0) curTab = pauseOptions.length - 1;
            FlxTween.tween(selector, { y: pauseOptions[curTab].y }, 0.1, { ease: FlxEase.quintOut });
        } else if (controls.UI_DOWN_P) {
            curTab = curTab + 1;
            if (curTab >= pauseOptions.length) curTab = 0;
            FlxTween.tween(selector, { y: pauseOptions[curTab].y }, 0.1, { ease: FlxEase.quintOut });
        } else if (controls.ACCEPT) {
            switch (curTab) {
                case 0:
                    CustomSubstate.closeCustomSubstate('pause');
                case 1:
                    PauseSubState.restartSong(false);
                case 2:
                    PlayState.instance.paused = true;
                	PlayState.instance.vocals.volume = 0;
                	PlayState.instance.canResync = false;
                	MusicBeatState.switchState(new OptionsState());
                	OptionsState.onPlayState = true;
                case 3:
                    if(PlayState.isStoryMode)
			        	MusicBeatState.switchState(new StoryMenuState());
			        else
			        	MusicBeatState.switchState(new FreeplayState());

                    FlxG.sound.playMusic(Paths.music('freakyMenu'));
			        PlayState.changedDifficulty = false;
			        PlayState.chartingMode = false;
			        game.transitioning = true;
			        FlxG.camera.followLerp = 0;
			        Mods.loadTopMod();
            }
        }
    }
}