String[] imageFileNames = {"1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "10.png"};
int numImage = 10;
PImage[] croppedImages = new PImage[numImage];
PImage bck;

Object[] objects = new Object[numImage];
class Object {
  PImage img;
  float rotation;
  PVector coord;
  Object (PImage i, float r,float x, float y) {
    img = i;
    rotation = setRotation(r);
    coord = setCoord(x, y);
  }
  Object (PImage i, float r) {
    img = i;
    rotation = setRotation(r);
    coord = setCoord(random(250, width - 250), random(150, height - 250));
  }
  float setRotation(float r) {
    float interval = random(r - 20, r + 20);
    return interval;
  }
  PVector setCoord(float cX, float cY) {
    PVector crd = new PVector(cX, cY);
    return crd;
  }
}

void setup() {
  for (int i = 0; i <numImage; i++) {
    croppedImages[i] = loadImage(imageFileNames[i]);
  }
  size(736, 929); 
  bck = loadImage("background.jpg");
  for (int i = 0; i < numImage; i++){
    int rotate = int(random(-15, 15));
   Object o = new Object(croppedImages[i], rotate);
   objects[i] = o;
  }
}

void draw() {
  image(bck, 0, 0);
  for (int i = 0; i < numImage; i++) {
    pushMatrix();
    rotate(radians(objects[i].rotation));
    translate(objects[i].coord.x, objects[i].coord.y);
    image(objects[i].img, 0, 0);
    popMatrix();
  }
}

void keyPressed() { 
  if (keyCode==ENTER) { 
    saveFrame("render/screen-####.jpg");
  }
}
