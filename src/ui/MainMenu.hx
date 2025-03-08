package ui;

import h2d.Scene;
import h2d.Text;
import h2d.Interactive;

/**
 * Menú principal con opciones de "Nuevo Juego" y "Cargar Mundo".
 */
class MainMenu {
    private var scene:Scene;
    private var title:Text;
    private var newGameButton:Interactive;
    private var loadGameButton:Interactive;
    
    public var onNewGame:Void->Void;
    public var onLoadGame:Void->Void;

    public function new(scene:Scene) {
        this.scene = scene;

        title = new Text(hxd.res.DefaultFont.get(), scene);
        title.text = "Menú Principal";
        title.x = 100;
        title.y = 50;

        newGameButton = createButton("Nuevo Juego", 100, 100, function() {
            if (onNewGame != null) onNewGame();
        });

        loadGameButton = createButton("Cargar Mundo", 100, 150, function() {
            if (onLoadGame != null) onLoadGame();
        });
    }

    private function createButton(text:String, x:Int, y:Int, callback:Void->Void):Interactive {
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
