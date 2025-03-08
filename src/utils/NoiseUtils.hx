package utils;

import libnoise.generator.Perlin;
import libnoise.QualityMode;
import config.GameConfig;

/**
 * Utilidades para la generación de ruido.
 */
class NoiseUtils {
    /**
     * Genera un objeto Perlin Noise configurado con valores de `GameConfig`.
     */
    public static function generatePerlinNoise(seed:Int):Perlin {
        return new Perlin(
            GameConfig.NOISE_FREQUENCY,
            GameConfig.NOISE_LACUNARITY,
            GameConfig.NOISE_PERSISTENCE,
            GameConfig.NOISE_OCTAVES,
            seed,
            QualityMode.MEDIUM
        );
    }
}
