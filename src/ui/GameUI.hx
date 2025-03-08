package ui;

import h2d.Scene;
import h2d.Text;
import hxd.res.DefaultFont;

/**
 * UI del juego (HUD) que muestra información en pantalla.
 */
class GameUI {
    private var scene:Scene;
    private var fpsText:Text;

    public function new(scene:Scene) {
        this.scene = scene;
        fpsText = new Text(DefaultFont.get(), scene);
        fpsText.text = "FPS: 0";
        fpsText.x = 10;
        fpsText.y = 10;
    }

    /**
     * Actualiza la UI del juego.
     */
    public function update(dt:Float) {
        fpsText.text = "FPS: " + Std.int(1 / dt);
    }
}
