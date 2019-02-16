float inc = 0.1;
PShape terrain;

void setup(){

  fullScreen();
  terrain = createShape();
  terrain.beginShape();
  terrain.noFill();
  terrain.strokeWeight(2);
  terrain.stroke(255);
  float xoff = 0;
  for(int x = 0;x <= width; x += 5){
    float y = noise(xoff) * height/2;
  terrain.vertex(x,y);  
  
  xoff += inc;
  }
  terrain.endShape();
}

void draw(){
  clear();
  shape(terrain,0,height/2);
}
