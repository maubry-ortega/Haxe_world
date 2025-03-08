package entity;

import hxd.Timer;
import map.TileType;

/**
 * Representa un NPC con movimiento autónomo.
 */
class NPC extends Entity {
    private var moveCooldown:Float = 1.5; // Tiempo entre movimientos
    private var timer:Float = 0;

    public function new(x:Int, y:Int, moveSpeed:Float) {
        super(x, y, moveSpeed);
    }

    /**
     * Actualiza el estado del NPC y lo mueve cada cierto tiempo.
     */
    override public function update(dt:Float) {
        timer += dt;
        if (timer >= moveCooldown) {
            timer = 0;
            var dx = Std.random(3) - 1; // -1, 0 o 1
            var dy = Std.random(3) - 1;
            move(dx, dy);
        }
    }
}
