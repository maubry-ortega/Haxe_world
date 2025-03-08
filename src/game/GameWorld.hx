package game;

import h2d.Scene;
import map.MapGenerator;
import map.TileRenderer;
import map.TileType;
import config.GameConfig;
import utils.Utils;

/**
 * Representa el mundo del juego y maneja su generación y actualización.
 */
class GameWorld {
    private var scene:Scene;
    private var mapGenerator:MapGenerator;
    private var tiles:Array<Array<h2d.Graphics>>;

    public function new(scene:Scene, width:Int, height:Int, seed:Int) {
        this.scene = scene;

        // Generar el mapa con la semilla dada
        mapGenerator = new MapGenerator(width, height, seed);
        tiles = [];

        generateWorld();
    }

    /**
     * Genera visualmente el mundo basado en el mapa generado.
     */
    private function generateWorld() {
        for (y in 0...mapGenerator.height) {
            var row = [];
            for (x in 0...mapGenerator.width) {
                var tileType = mapGenerator.getTileType(x, y);
                var color = mapGenerator.getTileColor(tileType);
                var tile = TileRenderer.createTile(color, GameConfig.TILE_SIZE);
                
                // Posicionar en isométrico
                tile.x = (x - y) * (GameConfig.TILE_SIZE / 2);
                tile.y = (x + y) * (GameConfig.TILE_SIZE / 4);
                
                scene.add(tile);
                row.push(tile);
            }
            tiles.push(row);
        }
    }

    /**
     * Lógica de actualización del mundo.
     */
    public function update(dt:Float) {
        // Aquí podríamos manejar cambios dinámicos en el mundo
    }
}
