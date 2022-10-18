float gyroscopeX, gyrosocpeY, gyroscopeZ;
boolean spinned = false;
boolean love_tapped = false;

void setup() {
    size(screenWidth, screenHeight, P3D);
    background(20, 90, 100);
}

void draw() {
    fill(255, 255, 255);
    textSize(32);

    if (spinned) {
        text('Spinned! Tap to reset.', 10, 70);
    }

    if (love_tapped) {
        text('Love tapped! Tap to reset.', 10, 70);
    }

    if (!spinned && !love_tapped) {
        if (mousePressed == true) {
            line(mouseX, mouseY, pmouseX, pmouseY);
        }
    }
}

void mousePressed() {
    if (spinned || love_tapped) {
        background(20,90,100);
        spinned = false;
        love_tapped = false;
    }
}

void gyroscopeUpdated(float x, float y, float z) {
    if (!spinned && !love_tapped) {
        if (abs(z) > 15) {
            spinned = true;
        }
    }
}

void accelerometerUpdated(float x, float y, float z) {
    if (!spinned && !love_tapped) {
        if (x > 3) {
            love_tapped = true;
        }
    }
}