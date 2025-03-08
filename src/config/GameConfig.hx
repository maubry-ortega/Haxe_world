package config;

/**
 * Configuración global del juego.
 */
class GameConfig {
    public static inline var WIDTH:Int = 1366;      // Ancho de la ventana
    public static inline var HEIGHT:Int = 768;      // Alto de la ventana
    public static inline var TILE_SIZE:Int = 48;    // Tamaño de los tiles
    public static inline var BACKGROUND_COLOR:Int = 0xFF1A1A1A; // Color de fondo

    // Dimensiones del mapa en tiles
    public static inline var MAP_WIDTH:Int = 50;
    public static inline var MAP_HEIGHT:Int = 50;

    // Configuración del ruido Perlin para la generación de mapas
    public static inline var NOISE_FREQUENCY:Float = 0.1;
    public static inline var NOISE_LACUNARITY:Float = 2.0;
    public static inline var NOISE_PERSISTENCE:Float = 0.5;
    public static inline var NOISE_OCTAVES:Int = 4;
}
