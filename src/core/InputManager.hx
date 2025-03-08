package core;

import hxd.Event;
import hxd.EventDispatcher;

class InputManager {
    public static function init() {
        hxd.EventDispatcher.addListener(function(e:hxd.Event) {
            if (e.kind == EKeyDown) {
                trace("Tecla presionada: " + e.keyCode);
            }
        });
    }
}
