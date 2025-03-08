package rendering;

import h2d.Scene;
import entities.Player;
import hxd.Key;

class CameraController {
    var scene:Scene;
    var player:Player;
    var isSpectator:Bool = false;
    var speed:Float = 10; // Velocidad de movimiento en modo espectador

    public function new(scene:Scene, player:Player) {
        this.scene = scene;
        this.player = player;
    }

    public function setMode(isSpectator:Bool) {
        this.isSpectator = isSpectator;
    }

    public function update() {
        if (isSpectator) {
            // Movimiento libre con teclas de flecha
            if (Key.isDown(Key.LEFT)) scene.x += speed;
            if (Key.isDown(Key.RIGHT)) scene.x -= speed;
            if (Key.isDown(Key.UP)) scene.y += speed;
            if (Key.isDown(Key.DOWN)) scene.y -= speed;
        } else {
            // Modo jugador: sigue al jugador
            scene.x = -player.getX() + 400;
            scene.y = -player.getY() + 300;
        }
    }
}
