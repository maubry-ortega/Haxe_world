package rendering;

import h2d.Scene;
import hxd.Key;
import entities.Player;

/**
 * Maneja la cámara con dos modos: Espectador y Jugador.
 */
class CameraController {
    private var scene:Scene;
    private var player:Player;
    private var mode:Int = 0; // 0 = Espectador, 1 = Jugador
    private var camSpeed:Int = 10;

    public function new(scene:Scene, player:Player) {
        this.scene = scene;
        this.player = player;
    }

    public function update() {
        if (Key.isPressed(Key.TAB)) {
            mode = (mode == 0) ? 1 : 0;
        }

        if (mode == 0) { // Modo Espectador
            if (Key.isDown(Key.A)) scene.x += camSpeed;
            if (Key.isDown(Key.D)) scene.x -= camSpeed;
            if (Key.isDown(Key.W)) scene.y += camSpeed;
            if (Key.isDown(Key.S)) scene.y -= camSpeed;
        } else { // Modo Jugador
            scene.x = -player.x + 400; // Centra la cámara en el jugador
            scene.y = -player.y + 300;
        }
    }
}
