var foodOptions:Array<String> = ['2', 'annoying', 'cok', 'cook', 'hole', 'man', 'mush', 'pair', 'pizz', 'unhealthy', 'wale'];

function makeFallingFood(x, y) {
    var food = new FlxSprite(0, 0);
    food.loadGraphic(Paths.image("food event/" + foodOptions[FlxG.random.int(0, foodOptions.length - 1)]), false);
    food.x = x;
    food.y = y;
    food.scale.x = 0.5;
    food.scale.y = 0.5;
    add(food);
    FlxTween.tween(food, {angle: FlxG.random.int(360, -360), y: FlxG.random.float(1350, 1700)}, FlxG.random.float(2, 4), {ease: FlxEase.linear, onComplete: function() {
        FlxTween.tween(food, {alpha: 0}, FlxG.random.float(2, 4), {ease: FlxEase.linear, onComplete: function() {
            food.kill();
        }, startDelay: FlxG.random.float(2, 5)});
    }});
}