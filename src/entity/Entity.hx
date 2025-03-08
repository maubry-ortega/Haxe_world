package entity;

import h2d.Object;
import map.TileType;

/**
 * Clase base para todas las entidades del juego.
 */
class Entity extends Object {
    public var x:Int;
    public var y:Int;
    public var moveSpeed:Float;

    public function new(x:Int, y:Int, moveSpeed:Float) {
        super();
        this.x = x;
        this.y = y;
        this.moveSpeed = moveSpeed;
    }

    /**
     * Método para actualizar la entidad.
     */
    public function update(dt:Float) {}

    /**
     * Método para mover la entidad.
     */
    public function move(dx:Int, dy:Int) {
        x += dx;
        y += dy;
    }
}
