class Particle {

  int myColor;
  double myX, myY, mySpeed, myAngle;

  Particle() {
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    myX = 250.0;
    myY = 250.0; 
    mySpeed = (Math.random()*10);
    myAngle = (Math.random()*2)*Math.PI;
  }
  
  void move() {
    myX = myX - (Math.cos(myAngle)*mySpeed);
    myY = myY - (Math.sin(myAngle)*mySpeed);
  }

  void show() {
    noStroke();
    fill(myColor, 15);
    ellipse((float)myX, (float)myY, (float)40, (float)40);
  }
}

class OddballParticle extends Particle {

  int shade = 255;          
  int shadeDirection = -4;    

  OddballParticle() {
  }
  void show() {
    noStroke();
    fill(shade, shade, shade); 
    ellipse((float)myX, (float)myY, (float)50, (float)50);
  }

  void changeShade() {
    shade += shadeDirection; 
    if (shade >= 255) {
      shade = 255;
      shadeDirection = -4;
    } else if (shade <= 100) {
      shade = 100;
      shadeDirection = 4;
    }
  }

  void walk() { 
    myX += (int)(Math.random()*5)-1; // -1,0,1
    myY += (int)(Math.random()*5)-1; // -1,0,1
  }
}

OddballParticle circle;
Particle[] stars = new Particle[1000];

void setup() {
  background(0);
  size(500, 500);
  circle = new OddballParticle();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Particle();
  }
}

void draw() {
  circle.changeShade(); 
  circle.show();
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].move();
    stars[i].show();
  }
}
