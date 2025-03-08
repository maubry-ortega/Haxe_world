package game;

/**
 * Administra el estado del juego (ejemplo: pausado, en juego, etc.).
 */
class GameManager {
    public static var isPaused:Bool = false;

    public static function togglePause() {
        isPaused = !isPaused;
    }
}
