package entity;

import hxd.Key;
import h2d.Sprite;
import map.TileType;

/**
 * Representa al jugador en el juego.
 */
class Player extends Entity {
    private var sprite:Sprite;
    private var isMoving:Bool = false;

    public function new(x:Int, y:Int, moveSpeed:Float) {
        super(x, y, moveSpeed);
        sprite = new Sprite();
        sprite.x = x;
        sprite.y = y;
    }

    /**
     * Maneja la entrada del jugador y mueve la entidad.
     */
    override public function update(dt:Float) {
        if (!isMoving) {
            if (Key.isDown(Key.W)) move(0, -1);
            if (Key.isDown(Key.S)) move(0, 1);
            if (Key.isDown(Key.A)) move(-1, 0);
            if (Key.isDown(Key.D)) move(1, 0);
        }
    }

    /**
     * Mueve al jugador en la dirección especificada.
     */
    override public function move(dx:Int, dy:Int) {
        super.move(dx, dy);
        isMoving = true;
        sprite.x = x;
        sprite.y = y;
        isMoving = false;
    }
}
