PShape ship,nave,fogo; // nave vector
PVector v; 
boolean space;

void setup(){
  size(300,300);
  frameRate(30);
  
  ship = createShape(GROUP);

  nave = createShape();
  nave.beginShape(LINES);
  nave.stroke(255);
  nave.strokeWeight(2);
  
  nave.vertex(40,0);
  nave.vertex(15,25);
  
  nave.vertex(15,25);
  nave.vertex(15,58);
  
  nave.vertex(15,58);
  nave.vertex(30,68);
  
  nave.vertex(30,68);
  nave.vertex(20,88);
  
  nave.vertex(40,0);
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
  fogo.strokeWeight(1);
  
  
  fogo.vertex(20,88);
  fogo.vertex(40,108);
  
  fogo.vertex(60,88);
  fogo.vertex(40,108);
   
  fogo.endShape();
  fogo.setVisible(false);
  
  ship.addChild(nave);
  ship.addChild(fogo);
}

void draw(){
  clear();
  if(space)
  {
  ship.getChild(1).setVisible(true); 
  v = ship.getChild(1).getVertex(1);
  v.y+=5;
  if(v.y >= 148)
    v.y = 128;
  
  ship.getChild(1).setVertex(1,v);  
  
  v = ship.getChild(1).getVertex(3);
  v.y+=5;
  if(v.y >= 148)
    v.y = 128;
  ship.getChild(1).setVertex(3,v);  
  }else{
    v = ship.getChild(1).getVertex(1);
    v.y=118;
    ship.getChild(1).setVertex(1,v);  
  
    v = ship.getChild(1).getVertex(3);
    v.y=118;
    ship.getChild(1).setVertex(3,v);  
    ship.getChild(1).setVisible(false);
  }
  
  shape(ship,mouseX,mouseY);
  
}

void keyPressed() {
  if (key == 32) 
    space=true;
}

void keyReleased() {
  if (key == 32) 
    space=false;
  
}
