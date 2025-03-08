package ui;

import h2d.Scene;
import h2d.Text;
import h2d.Interactive;
import hxd.Event;

/**
 * Pantalla para seleccionar un mundo existente o crear uno nuevo.
 */
class WorldSelection {
    private var scene:Scene;
    private var title:Text;
    private var createWorldButton:Interactive;
    private var loadWorldButton:Interactive;
    
    public var onCreateWorld:Void->Void;
    public var onLoadWorld:Void->Void;

    public function new(scene:Scene) {
        this.scene = scene;

        title = new Text(hxd.res.DefaultFont.get(), scene);
        title.text = "Seleccionar Mundo";
        title.x = 100;
        title.y = 50;

        createWorldButton = createButton("Crear Nuevo Mundo", 100, 100, function(e:hxd.Event) {
            if (onCreateWorld != null) onCreateWorld();
        });

        loadWorldButton = createButton("Cargar Mundo", 100, 150, function(e:hxd.Event) {
            if (onLoadWorld != null) onLoadWorld();
        });
    }

    private function createButton(text:String, x:Int, y:Int, callback:hxd.Event->Void):Interactive {
        var btn = new Interactive(200, 40, scene);
        var btnText = new Text(hxd.res.DefaultFont.get(), btn);
        btnText.text = text;
        btnText.x = 10;
        btnText.y = 10;
        btn.x = x;
        btn.y = y;
        btn.onClick = callback;
        return btn;
    }
}
