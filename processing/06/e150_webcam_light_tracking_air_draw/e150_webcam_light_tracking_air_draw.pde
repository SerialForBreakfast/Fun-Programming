import processing.video.*;

Capture cam;

int x, y;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
    float maxBri = 0;
    int theBrightPixel = 0;
    for(int i=0; i<cam.pixels.length; i++) {
      if(brightness(cam.pixels[i]) > maxBri) {
        maxBri = brightness(cam.pixels[i]);
        theBrightPixel = i;
      }
    }
    x = theBrightPixel % cam.width;
    y = theBrightPixel / cam.width;
    println(x,"x",y,"\n");
  }
  image(cam, 0, 0);  
  fill(#FF0000);
  ellipse(x, y, 20, 20);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}

/*
void draw() {
  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
    loadPixels();
    for(int i=0; i<cam.pixels.length; i++) {
      if(brightness(cam.pixels[i]) > 200) {
        pixels[i] = color(255);
      }
    }
    updatePixels();
  }
}*/
