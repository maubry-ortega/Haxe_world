package entities;

import h2d.Scene;
import h2d.Graphics;

/**
 * Representa un NPC en el juego.
 */
class NPC {
    public var sprite:Graphics;
    public var x:Int;
    public var y:Int;

    public function new(scene:Scene, x:Int, y:Int) {
        this.x = x;
        this.y = y;
        sprite = new Graphics(scene);
        sprite.beginFill(0x00FF00); // Verde para NPCs
        sprite.drawCircle(0, 0, 8);
        sprite.endFill();
        sprite.x = x;
        sprite.y = y;
    }
}
