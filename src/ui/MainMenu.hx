package ui;

import h2d.Scene;
import h2d.Text;
import h2d.Interactive;
import hxd.res.DefaultFont;

class MainMenu {
    var scene:Scene;
    var title:Text;
    var btnNewGame:Interactive;
    var btnLoadGame:Interactive;

    public var onNewGame:Void->Void;
    public var onLoadGame:Void->Void;

    public function new(scene:Scene) {
        this.scene = scene;

        title = new Text(hxd.res.DefaultFont.get(), scene);
        title.text = "¡Bienvenido al Juego!";
        title.setPosition(100, 50);

        btnNewGame = createButton("Nueva Partida", 100, 150, function() {
            if (onNewGame != null) onNewGame();
        });

        btnLoadGame = createButton("Cargar Partida", 100, 200, function() {
            if (onLoadGame != null) onLoadGame();
        });
    }

    function createButton(text:String, x:Float, y:Float, callback:Void->Void):Interactive {
        var btn = new Interactive(200, 40, scene);
        btn.x = x;
        btn.y = y;
        btn.backgroundColor = 0x444444;

        var btnText = new Text(hxd.res.DefaultFont.get(), btn);
        btnText.text = text;
        btnText.setPosition(10, 10);

        btn.onClick = function(_) callback();
        return btn;
    }
}
