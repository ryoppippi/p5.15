float speed=0;
float y;
float x;
int bingo=0;
int miss=0;
float goodx=0;
float goody=0;
float kasoku=0;
int score=0;
int[] colorR = {255,0,0}, colorG = {0,255,0}, colorB = {0,0,255};
int[] points = {50,100,-50};
int mode;

void setup(){
  size(600,600);
  x=250;
  mode=0;
}

void draw(){
  background(255);
  text(score, 50, 20);
  
  speed+=0.05+kasoku;
  y+=speed;
  smooth();
  noStroke();
  colorMode(RGB,256);
  fill(colorR[mode],colorG[mode],colorB[mode]);
  ellipse(x,y,50,50);
  
  if(mouseX>x-25 && mouseX<x+25 &&
     mouseY>y-25 && mouseY<y+25){
     bingo=60;
     score += points[mode];
     reset(); 
     kasoku+=0.01;
     goodx=mouseX;
     goody=mouseY;
  }
     
  if(y>600){
    score -= 100;
    reset();
    miss = 60;
  }
  
  if(miss>0){
    fill(0);
    text("missed", 250, 250);
    miss -=1;
  }

  if(bingo>0){
    fill(0);
    text("good!",goodx,goody);
    bingo-=1;
  }
} 

void reset(){
    y=-50;
    speed=0;
    x=50+random(400);
    mode = int(random(3));
}