package;

import hxd.App;
import h2d.Scene;
import config.GameConfig;
import map.MapGenerator;
import map.TileRenderer;
import rendering.IsometricRenderer;
import rendering.CameraController;
import serialization.MapSerializer;
import ui.GameUI;
import ui.MainMenu;
import ui.WorldSelection;
import entities.NPC;
import entities.Player;
import utils.MathUtils;

class Main extends App {
    var scene:Scene;
    var renderer:IsometricRenderer;
    var terrain:MapGenerator;
    var gameUI:GameUI;
    var mainMenu:MainMenu;
    var worldSelection:WorldSelection;
    var npcs:Array<NPC> = [];
    var player:Player;
    var camera:CameraController;

    override function init() {
        scene = new Scene();
        s2d.addChild(scene);

        mainMenu = new MainMenu(scene);
        mainMenu.onNewGame = showWorldSelection;
        mainMenu.onLoadGame = loadGame;
    }

    function showWorldSelection() {
        scene.removeChildren();
        worldSelection = new WorldSelection(scene);
        worldSelection.onCreateWorld = createNewWorld;
        worldSelection.onLoadWorld = loadGame;
    }

    function createNewWorld() {
        scene.removeChildren();
        terrain = new MapGenerator(50, 50, 42);
        renderer = new IsometricRenderer(scene, terrain);
        gameUI = new GameUI(scene);

        // Crear Jugador
        player = new Player(scene, 400, 300);
        camera = new CameraController(scene, player);

        // Generar NPCs aleatorios
        for (i in 0...5) {
            var startX = Std.int(Math.random() * terrain.width);
            var startY = Std.int(Math.random() * terrain.height);
            var npc = new NPC(scene, startX * 32, startY * 16);
            npcs.push(npc);
        }
    }

    function loadGame() {
        var mapData = MapSerializer.loadMap("mapData.bson");
        if (mapData != null) {
            scene.removeChildren();
            terrain = new MapGenerator(mapData.width, mapData.height, mapData.getSeed());
            renderer = new IsometricRenderer(scene, terrain);
            gameUI = new GameUI(scene);

            // Crear Jugador
            player = new Player(scene, 400, 300);
            camera = new CameraController(scene, player);

            // Generar NPCs aleatorios
            for (i in 0...5) {
                var startX = Std.int(Math.random() * terrain.width);
                var startY = Std.int(Math.random() * terrain.height);
                var npc = new NPC(scene, startX * 32, startY * 16);
                npcs.push(npc);
            }
        } else {
            trace("No se pudo cargar el mapa.");
        }
    }

    override function update(dt:Float) {
        if (gameUI != null) gameUI.update(dt);
        if (player != null) player.update();
        if (camera != null) camera.update();
    }

    static function main() {
        new Main();
    }
}
