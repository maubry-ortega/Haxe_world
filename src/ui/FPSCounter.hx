package ui;

import h2d.Text;
import h2d.Scene;
import hxd.Timer;
import hxd.res.DefaultFont;

class FPSCounter {
    var text:Text;

    public function new(scene:Scene) {
        text = new Text(hxd.res.DefaultFont.get(), scene);
        text.x = 10;
        text.y = 10;
        text.text = "FPS: 0";
    }

    public function update() {
        text.text = "FPS: " + Std.int(1 / Timer.dt);
    }
}
