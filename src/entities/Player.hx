package entities;

import h2d.Scene;
import h2d.Graphics;
import hxd.Key;
import utils.Movement;

class Player {
    var sprite:Graphics;
    var movement:Movement;

    public function new(scene:Scene, x:Float, y:Float) {
        sprite = new Graphics(scene);
        sprite.beginFill(0xff0000);
        sprite.drawCircle(0, 0, 10);
        sprite.endFill();
        sprite.setPosition(x, y);

        movement = new Movement(x, y, 2.0, 0.2, 0.9);
    }

    public function update() {
        movement.updateMovement(
            Key.isDown(Key.LEFT), 
            Key.isDown(Key.RIGHT), 
            Key.isDown(Key.UP), 
            Key.isDown(Key.DOWN)
        );

        // Aplicar posición a la entidad
        sprite.x = movement.x;
        sprite.y = movement.y;
    }

    public function getX():Float return sprite.x;
    public function getY():Float return sprite.y;
}
