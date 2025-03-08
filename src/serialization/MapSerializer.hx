package serialization;

import haxe.Serializer;
import haxe.Unserializer;
import sys.io.File;
import map.MapGenerator;

/**
 * Serializa y deserializa mapas para guardarlos y cargarlos.
 */
class MapSerializer {
    /**
     * Guarda un mapa en un archivo.
     */
    public static function saveMap(map:MapGenerator, filePath:String) {
        var data = {
            width: map.width,
            height: map.height,
            seed: map.getSeed() // 🔥 Ahora usa el seed real
        };
        var serialized = Serializer.run(data);
        File.saveContent(filePath, serialized);
    }

    /**
     * Carga un mapa desde un archivo.
     */
    public static function loadMap(filePath:String):MapGenerator {
        if (!sys.FileSystem.exists(filePath)) return null;
        
        var content = File.getContent(filePath);
        var data:Dynamic = Unserializer.run(content);
        
        // 🔥 Reconstruye el mapa con los datos serializados
        return new MapGenerator(data.width, data.height, data.seed);
    }
}
