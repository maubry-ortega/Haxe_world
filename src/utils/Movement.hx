package utils;

class Movement {
    public var x:Float;
    public var y:Float;
    public var velX:Float = 0;
    public var velY:Float = 0;
    public var speed:Float;
    public var acceleration:Float;
    public var friction:Float;

    public function new(x:Float, y:Float, speed:Float, acceleration:Float, friction:Float) {
        this.x = x;
        this.y = y;
        this.speed = speed;
        this.acceleration = acceleration;
        this.friction = friction;
    }

    public function updateMovement(left:Bool, right:Bool, up:Bool, down:Bool) {
        if (left) velX -= acceleration;
        if (right) velX += acceleration;
        if (up) velY -= acceleration;
        if (down) velY += acceleration;

        // Aplicar fricción
        velX *= friction;
        velY *= friction;

        // Limitar la velocidad máxima
        if (velX > speed) velX = speed;
        if (velX < -speed) velX = -speed;
        if (velY > speed) velY = speed;
        if (velY < -speed) velY = -speed;

        // Aplicar movimiento
        x += velX;
        y += velY;
    }
}
