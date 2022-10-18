float gyroscopeX, gyrosocpeY, gyroscopeZ;
boolean chucked = false;
boolean love_tapped = false;

void setup() {
    size(screenWidth, screenHeight, P3D);
    background(20, 90, 100);
}

void draw() {
    fill(255, 255, 255);
    textSize(32);

    if (chucked) {
        text('Chucked! Tap to reset.', 10, 70);
    }

    if (love_tapped) {
        text('Love tapped! Tap to reset.', 10, 70);
    }

    if (!chucked && !love_tapped) {
        if (mousePressed == true) {
            line(mouseX, mouseY, pmouseX, pmouseY);
        }
    }
}

void mousePressed() {
    if (chucked || love_tapped) {
        background(20,90,100);
        chucked = false;
        love_tapped = false;
    }
}

void gyroscopeUpdated(float x, float y, float z) {

}

void accelerometerUpdated(float x, float y, float z) {
    if (!chucked && !love_tapped) {
        if (sqrt(x * x + y * y + z * z) > 8) {
            chucked = true;
        }
        else if (x > 3) {
            love_tapped = true;
        }
    }
}