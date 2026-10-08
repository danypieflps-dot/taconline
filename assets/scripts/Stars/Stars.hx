var starImages:Array<String> = ['star1', 'star2', 'star3', 'star4', 'star5'];

function makeFallingStars(X:Float, Y:Float) {
    var star:FlxSprite = new FlxSprite(X, Y);
    star.loadGraphic(Paths.image("midnightbg/" + starImages[FlxG.random.int(0, starImages.length - 1)]), false);
    addBehindGF(star);
    FlxTween.tween(star, {angle: FlxG.random.int(360, -360), x: -400}, FlxG.random.float(2, 4), {ease: FlxEase.linear, onComplete: function() {
        star.kill();
    }});
}