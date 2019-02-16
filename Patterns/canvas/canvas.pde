PImage img1,
img2,
img3,
img4,
img5,
img6,
img7,
img8,
img9,
img10,
img11,
img12,
img13,
img14,
img15,
img16,
img17,
img18,
img19,
img20,
img21,
img22,
img23,
img24,
img25,
img26,
img27,
img28,
img29,
img30,
img31,
img32,
img33,
img34,
img35,
img36,
img37,
img38,
img39,
img40,
img41;
int i=0,j=0;
void setup() {
size(360,360);
frameRate(12);
}

void draw() {
PImage[] block = {
img1 = loadImage("bloco-1.png"), 
img2 = loadImage("bloco-2.png"),
img3 = loadImage("bloco-3.png"), 
img4 = loadImage("bloco-4.png"),
img5 = loadImage("bloco-5.png"), 
img6 = loadImage("bloco-6.png"), 
img7 = loadImage("bloco-7.png"),
img8 = loadImage("bloco-8.png"), 
img9 = loadImage("bloco-9.png"), 
img10 = loadImage("bloco-10.png"), 
img11 = loadImage("bloco-11.png"), 
img12 = loadImage("bloco-12.png"),
img13 = loadImage("bloco-13.png"), 
img14 = loadImage("bloco-14.png"), 
img15 = loadImage("bloco-15.png"), 
img16 = loadImage("bloco-16.png"), 
img17 = loadImage("bloco-17.png"),
img18 = loadImage("bloco-18.png"),
img19 = loadImage("bloco-19.png"), 
img20 = loadImage("bloco-20.png"), 
img21 = loadImage("bloco-21.png"), 
img22 = loadImage("bloco-22.png"),
img23 = loadImage("bloco-23.png"), 
img24 = loadImage("bloco-24.png"), 
img25 = loadImage("bloco-25.png"), 
img26 = loadImage("bloco-26.png"), 
img27 = loadImage("bloco-27.png"),
img28 = loadImage("bloco-28.png"), 
img29 = loadImage("bloco-29.png"), 
img30 = loadImage("bloco-30.png"), 
img31 = loadImage("bloco-31.png"), 
img32 = loadImage("bloco-32.png"),
img33 = loadImage("bloco-33.png"), 
img34 = loadImage("bloco-34.png"), 
img35 = loadImage("bloco-35.png"), 
img36 = loadImage("bloco-36.png"), 
img37 = loadImage("bloco-37.png"),
img38 = loadImage("bloco-38.png"), 
img39 = loadImage("bloco-39.png"),
img40 = loadImage("bloco-40.png"), 
img41 = loadImage("bloco-41.png")
}; 
if(i>=block.length)
i=0;
if(j>=block.length || j < 0)
j=0;

        image(block[j],0,0);
        image(block[j],0,120);
        image(block[i],0,240);
        image(block[j],120,0);
        image(block[i],120,120);
        image(block[j],120,240);
        image(block[i],240,0);
        image(block[j],240,120);
        image(block[j],240,240);  

delay(100);
}

void mouseClicked(){
 i++;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      j++;
    } else if (keyCode == DOWN) {
      j--;
}
  }
}
