package entities;

import h2d.Scene;
import h2d.Graphics;
import utils.Movement;

class NPC {
    var sprite:Graphics;
    var movement:Movement;

    public function new(scene:Scene, x:Float, y:Float) {
        sprite = new Graphics(scene);
        sprite.beginFill(0x0000ff);
        sprite.drawCircle(0, 0, 10);
        sprite.endFill();
        sprite.setPosition(x, y);

        movement = new Movement(x, y, 1.5, 0.1, 0.95);
    }

    public function update() {
        // Movimiento aleatorio
        var moveLeft = Math.random() > 0.9;
        var moveRight = Math.random() > 0.9;
        var moveUp = Math.random() > 0.9;
        var moveDown = Math.random() > 0.9;

        movement.updateMovement(moveLeft, moveRight, moveUp, moveDown);

        sprite.x = movement.x;
        sprite.y = movement.y;
    }

    public function getX():Float return sprite.x;
    public function getY():Float return sprite.y;
}
