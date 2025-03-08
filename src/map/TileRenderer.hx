package map;

import h2d.Graphics;

/**
 * Se encarga de dibujar y renderizar tiles.
 */
class TileRenderer {
    private static var tileCache:Map<Int, Graphics> = new Map();

    /**
     * Crea un tile con un color determinado y tamaño fijo.
     */
    public static function createTile(color:Int, tileSize:Int):Graphics {
        if (!tileCache.exists(color)) {
            var g = drawTile(color, tileSize);
            tileCache.set(color, g);
        }
        return drawTile(color, tileSize);
    }

    /**
     * Dibuja un tile isométrico.
     */
    static function drawTile(color:Int, tileSize:Int):Graphics {
        var g = new Graphics();
        g.beginFill(color);
        g.lineStyle(1, 0x000000, 0.3);
        g.moveTo(0, 0);
        g.lineTo(tileSize / 2, tileSize / 4);
        g.lineTo(0, tileSize / 2);
        g.lineTo(-tileSize / 2, tileSize / 4);
        g.lineTo(0, 0);
        g.endFill();
        return g;
    }

    /**
     * Limpia la caché de tiles.
     */
    public static function clearCache() {
        tileCache.clear();
    }
}
