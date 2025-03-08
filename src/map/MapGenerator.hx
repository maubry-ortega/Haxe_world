package map;

import libnoise.generator.Perlin;
import libnoise.QualityMode;

/**
 * Genera el mapa usando ruido Perlin basado en una semilla.
 */
class MapGenerator {
    public var width:Int;
    public var height:Int;
    private var seed:Int;
    private var heightMap:Array<Array<Float>>;
    private var tileMap:Array<Array<TileType>>;

    public function new(width:Int, height:Int, seed:Int) {
        this.width = width;
        this.height = height;
        this.seed = seed;
        generateMap();
    }

    public function getSeed():Int {
        return seed;
    }    

    /**
     * Genera el mapa usando ruido Perlin.
     */
    private function generateMap() {
        var perlin = new Perlin(0.1, 2.0, 0.5, 4, seed, QualityMode.MEDIUM);
        heightMap = [];
        tileMap = [];

        for (y in 0...height) {
            var row = [];
            var tileRow = [];
            for (x in 0...width) {
                var value = perlin.getValue(x * 0.1, y * 0.1, 0);
                row.push(value);
                tileRow.push(determineTileType(value));
            }
            heightMap.push(row);
            tileMap.push(tileRow);
        }
    }

    /**
     * Determina el tipo de terreno según el valor de ruido Perlin.
     */
    private function determineTileType(value:Float):TileType {
        return switch (value) {
            case v if (v < -0.5): TileType.DeepWater;
            case v if (v < -0.2): TileType.Water;
            case v if (v < 0): TileType.Sand;
            case v if (v < 0.3): TileType.Grass;
            case v if (v < 0.6): TileType.Forest;
            case v if (v < 0.8): TileType.Mountain;
            default: TileType.Snow;
        };
    }

    /**
     * Obtiene el tipo de tile en una posición dada.
     */
    public function getTileType(x:Int, y:Int):TileType {
        return tileMap[y][x];
    }

    /**
     * Devuelve el color correspondiente a un tipo de tile.
     */
    public function getTileColor(tileType:TileType):Int {
        return switch (tileType) {
            case DeepWater: 0x004488;
            case Water: 0x0066aa;
            case Sand: 0xE5D595;
            case Grass: 0x88CC66;
            case Forest: 0x228833;
            case Mountain: 0x888888;
            case Snow: 0xFFFFFF;
        };
    }
}
