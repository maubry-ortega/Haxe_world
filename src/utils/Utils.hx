package utils;

/**
 * Funciones generales auxiliares.
 */
class Utils {
    public static function randomRange(min:Int, max:Int):Int {
        return min + Std.random(max - min + 1);
    }
}
