package entities;

import h2d.Scene;
import h2d.Graphics;
import hxd.Key;

/**
 * Representa al jugador en el juego.
 */
class Player {
    public var sprite:Graphics;
    public var x:Int;
    public var y:Int;
    public var speed:Int = 4;

    public function new(scene:Scene, x:Int, y:Int) {
        this.x = x;
        this.y = y;
        sprite = new Graphics(scene);
        sprite.beginFill(0xFF0000); // Rojo para el jugador
        sprite.drawCircle(0, 0, 10);
        sprite.endFill();
        sprite.x = x;
        sprite.y = y;
    }

    public function update() {
        if (Key.isDown(Key.LEFT)) x -= speed;
        if (Key.isDown(Key.RIGHT)) x += speed;
        if (Key.isDown(Key.UP)) y -= speed;
        if (Key.isDown(Key.DOWN)) y += speed;
        sprite.x = x;
        sprite.y = y;
    }
}
