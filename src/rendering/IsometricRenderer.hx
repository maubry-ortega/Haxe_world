package rendering;

import h2d.Scene;
import h2d.Graphics;
import map.MapGenerator;
import map.TileRenderer;
import utils.MathUtils;

/**
 * Renderiza el mapa en vista isométrica.
 */
class IsometricRenderer {
    private var scene:Scene;
    private var map:MapGenerator;

    public function new(scene:Scene, map:MapGenerator) {
        this.scene = scene;
        this.map = map;
        renderMap();
    }

    function renderMap() {
        for (y in 0...map.height) {
            for (x in 0...map.width) {
                var tileType = map.getTileType(x, y);
                var color = map.getTileColor(tileType);
                var tile = TileRenderer.createTile(color, 32);
                var screenPos = MathUtils.isoToScreen(x, y, 32);
                tile.x = screenPos.x;
                tile.y = screenPos.y;
                scene.addChild(tile);
            }
        }
    }
}
