package core;

import h2d.Scene;
import hxd.App;
import config.GameConfig;

/**
 * Clase principal del juego, encargada de inicializar y gestionar el bucle principal.
 */
class GameApplication extends App {
    private var scene:Scene;

    public function new() {
        super();
    }

    override function init() {
        trace("Inicializando juego...");

        // Configuración inicial
        engine.backgroundColor = GameConfig.BACKGROUND_COLOR;
        s2d.scaleMode = ScaleMode.LetterBox(GameConfig.WIDTH, GameConfig.HEIGHT);
        scene = new Scene(s2d);

        // TODO: Aquí se instanciará GameWorld cuando lo implementemos
        trace("Juego inicializado correctamente.");
    }

    override function update(dt:Float) {
        // TODO: Aquí se actualizará el mundo cuando lo implementemos
    }
}
