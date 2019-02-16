  
import processing.sound.*;
SoundFile file2;
PShape ship,nave,fogo,box,c; // nave vector
PVector v; 
boolean space,isRight,isLeft;
float rot_inc = PI/32;
float angle=rot_inc,tam=0.25;
SqrOsc file1;
PinkNoise noise;
BrownNoise noise2;
PFont vect;
Nave player1;
float gravity,atrito,trust,score,time,altitude;

void setup(){
  fullScreen();
  frameRate(24);
  shapeMode(CENTER);
  noCursor();
  ship = createShape(GROUP);

  nave = createShape();
  nave.beginShape(LINES);
  nave.stroke(255);
  nave.strokeWeight(4);
  
  nave.vertex(40,10);
  nave.vertex(15,25);
  
  nave.vertex(15,25);
  nave.vertex(15,58);
  
  nave.vertex(15,58);
  nave.vertex(30,68);
  
  nave.vertex(30,68);
  nave.vertex(20,88);
  
  nave.vertex(40,10);
  nave.vertex(65,25);
  
  nave.vertex(65,25);
  nave.vertex(65,58);
 
  nave.vertex(65,58);
  nave.vertex(50,68);
  
  nave.vertex(50,68);
  nave.vertex(60,88);
 
  
  //linha horizontal
  nave.vertex(10,68);
  nave.vertex(70,68);
  
  nave.vertex(20,88);
  nave.vertex(60,88);
  
  //perna esquerda
  nave.vertex(10,68);
  nave.vertex(10,88);
  
  nave.vertex(10,88);
  nave.vertex(0,88);
  //perna direita
  nave.vertex(70,68);
  nave.vertex(70,88);
  
  nave.vertex(70,88);
  nave.vertex(80,88);
  
  nave.endShape();
  
  fogo = createShape();
  fogo.beginShape(LINES);
  fogo.stroke(255);
  fogo.strokeWeight(2);
  
  
  fogo.vertex(20,88);
  fogo.vertex(40,128);
  
  fogo.vertex(60,88);
  fogo.vertex(40,128);
   
  fogo.endShape();
  fogo.setVisible(false);
  
  box = createShape();

  box.beginShape(LINES);
  box.noFill();
  box.strokeWeight(1);
  box.stroke(255);
  box.vertex(0,0);
  box.vertex(40,68);
  box.setVisible(false);
  box.endShape();
  
  noFill();
  stroke(255);
  c = createShape(ELLIPSE,40, 68,2*dist(0,0,40,68),2*dist(0,0,40,68));
  c.setVisible(false);


 
   
  ship.addChild(nave);
  ship.addChild(fogo);
  ship.addChild(box);
  ship.addChild(c);
  
  file1 = new SqrOsc(this);
  file2 = new SoundFile(this, "shockwave.wav");
  noise = new PinkNoise(this);
  noise2 = new BrownNoise(this);
  
  vect = createFont("Vectorb.ttf",24);
  fill(255);
  println(cos(rot_inc),sin(rot_inc));
  
  player1 = new Nave(7000,50,50,5,0,PI/2);
  gravity = 0.0798;
  atrito = 0.998;
  score=0;
  time=100;
  
}

void draw(){
  clear();
  fill(255);
  strokeWeight(2);
  textFont(vect);
  text("SCORE:" + score,100,50);
  text("TIME:"+ time,100,100);
  text("FUEL:"+ player1.fuel,100,150);
  text("ALTITUDE:" + altitude, 700,50);
  text("Horizontal speed:" + player1.xvel,700,150);
  text("Vertical speed:" + player1.yvel,700,100);
  altitude =height-player1.ypos;
  if(space)
  {
  trust = 0.14;
  ship.getChild(1).setVisible(true); 
  v = ship.getChild(1).getVertex(1);
  v.y+=5;
  player1.fuel-=18;
  if(v.y >= 198)
    v.y = 168;
  if(!(file1.isPlaying())){  
  noise.play();
  noise2.play();
  }
  ship.getChild(1).setVertex(1,v);  
  
  v = ship.getChild(1).getVertex(3);
  v.y+=5;
  if(v.y >= 198)
    v.y = 168;
  ship.getChild(1).setVertex(3,v);  
  }else{
    trust=0;
    v = ship.getChild(1).getVertex(1);
    v.y=118;
    ship.getChild(1).setVertex(1,v);  
  
    v = ship.getChild(1).getVertex(3);
    v.y=118;
    ship.getChild(1).setVertex(3,v);  
    ship.getChild(1).setVisible(false);
  noise.stop();
  noise2.stop();
  }
    if(isRight){

       player1.rot+=rot_inc;

    }
  if(isLeft){
   player1.rot-=rot_inc;
  }
  pushMatrix();
  translate(player1.xpos,player1.ypos);
  rotate(player1.rot);
  translate(-40*tam,-68*tam);
  scale(tam);
  shape(ship,0,0);

  popMatrix();
  player1.xvel=(trust*sin(player1.rot)+player1.xvel)*atrito;
    player1.yvel=(gravity+trust*-cos(player1.rot)+player1.yvel)*atrito;
  player1.xpos+=player1.xvel;
  player1.ypos+=player1.yvel;
  println(angle);
  
}

void keyPressed() {
  if (key == 32) 
    space=true;
  if(keyCode == RIGHT)
  isRight=true;
  if(keyCode == LEFT)
  isLeft=true;
}

void keyReleased() {
  if (key == 32) 
    space=false;
      if(keyCode == RIGHT)
  isRight=false;
  if(keyCode == LEFT)
  isLeft=false;
  
}

class Nave{
  float fuel;
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float rot;
  Nave(float fuel,float xpos,float ypos,float xvel,float yvel,float rot){
    this.fuel = fuel;
    this.xpos = xpos;
    this.ypos = ypos;
    this.xvel = xvel;
    this.yvel = yvel;
    this.rot = rot;
  }
}
