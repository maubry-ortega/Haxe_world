package entities;

import h2d.Scene;
import h2d.Text;
import hxd.res.DefaultFont;

/**
 * Representa un NPC en el juego.
 */
class NPC {
    private var label:Text;

    public function new(scene:Scene, x:Int, y:Int) {
        label = new Text(DefaultFont.get(), scene);
        label.text = "NPC";
        label.x = x;
        label.y = y;
    }

    public function move(dx:Int, dy:Int) {
        label.x += dx;
        label.y += dy;
    }
}
