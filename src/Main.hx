package;

import h2d.Scene;
import hxd.App;
import hxd.Res;
import config.GameConfig;
import game.GameWorld;
import ui.GameUI;

/**
 * Punto de entrada principal del juego.
 */
class Main extends App {
    private var gameWorld:GameWorld;
    private var ui:GameUI;

    /**
     * Método principal para ejecutar la aplicación.
     */
    public static function main() {
        #if sys
        try {
            trace("[INFO] Inicializando recursos...");
            Res.initEmbed();
            trace("[INFO] Recursos inicializados correctamente.");
        } catch (e:Dynamic) {
            trace("[ERROR] No se pudo inicializar recursos: " + e);
            return;
        }
        #end

        trace("[INFO] Iniciando aplicación...");
        new Main();
    }

    /**
     * Inicialización de la ventana y la escena del juego.
     */
    override function init() {
        trace("[INFO] Inicializando ventana y escena...");
        try {
            engine.backgroundColor = GameConfig.BACKGROUND_COLOR;
            s2d.scaleMode = ScaleMode.LetterBox(GameConfig.WIDTH, GameConfig.HEIGHT);

            if (s2d == null) {
                throw "[ERROR] La escena no se pudo inicializar correctamente.";
            }

            gameWorld = new GameWorld(s2d, GameConfig.MAP_WIDTH, GameConfig.MAP_HEIGHT, GameConfig.TILE_SIZE);
            ui = new GameUI(s2d);
            trace("[INFO] Juego inicializado correctamente.");
        } catch (e:Dynamic) {
            trace("[ERROR] Fallo en init(): " + e);
        }
    }

    /**
     * Bucle principal de actualización del juego.
     */
    override function update(dt:Float) {
        if (gameWorld != null) {
            gameWorld.update(dt);
        }
        if (ui != null) {
            ui.update(dt);
        }
    }
}
