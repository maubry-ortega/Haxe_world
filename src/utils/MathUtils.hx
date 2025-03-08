package utils;

/**
 * Utilidades matemáticas generales.
 */
class MathUtils {
    /**
     * Restringe un valor dentro de un rango.
     */
    public static function clamp(value:Float, min:Float, max:Float):Float {
        return if (value < min) min else if (value > max) max else value;
    }

    /**
     * Convierte coordenadas isométricas a coordenadas de pantalla.
     */
    public static function isoToScreen(isoX:Int, isoY:Int, tileSize:Int):{ x:Int, y:Int } {
        return {
            x: Std.int((isoX - isoY) * (tileSize / 2)),
            y: Std.int((isoX + isoY) * (tileSize / 4))
        };
    }

    /**
     * Convierte coordenadas de pantalla a coordenadas isométricas.
     */
    public static function screenToIso(screenX:Int, screenY:Int, tileSize:Int):{ isoX:Int, isoY:Int } {
        return {
            isoX: Std.int((screenX / (tileSize / 2) + screenY / (tileSize / 4)) / 2),
            isoY: Std.int((screenY / (tileSize / 4) - screenX / (tileSize / 2)) / 2)
        };
    }
}
