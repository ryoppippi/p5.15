float x=5;//ボールのx座標
float y=5;//ボールのy座標
int a=0;//ボールのx軸移動判定
int b=0;//ボールのy軸移動判定
int point=0;//得点
int count=0;//何回落ちたかカウント,ゲームオーバー
float speedx=1.0;//x方向の速さ
float speedy=5.0;//y方向の速さ重力の関係で少し早目
int randomincrease = 0;
void setup(){
  size(400,600);
  rectMode(CENTER);
  a = 1;
  b = 1;
}

void draw(){
  background(255,255,255);//適当な色づけ
  smooth();
  text(point,50,20);//得点の表示左上
   //壁とのあたり判定
  x+=a*speedx;
  if(x>=width-5){
    a = -1;
    speedx=random(3);
  }//ｘ座標が壁ギリギリになったら左へ5は半径（スピード変速システム搭載）
  if(x<=5){
    a = 1;
    speedx=random(3);
  }//ｘ座標が壁ギリギリになったら右へ(スピード変速システム搭載)
  
  y+=b*speedy;//bが0なら下へ
  if(y>=height){//ボールが下に落ちた時
    y=0;//上に戻ってくる
    count++;//GameOverカウント追加
    x=random(10,500);
  }
  if(y<=5){
    b=1;
    speedy=random(3,5);
  }//ボールが天井なら下へ(スピード変速システム搭載)
  
  
  fill(200);
  ellipse(x,y,10,10);//円の作成
  fill(0);
  rectMode(CENTER);//長方形の基準を真ん中
  rect(mouseX,580,50,10);//動かす長方形
 //長方形とのあたり判定とポイントの加算
 if(x>=mouseX-30 && x< mouseX+30 && y>=565 && y<=585){
   b=-1;
   point+=100;
   speedx=random(3);
   speedy=3+random(6);
 }
 //
 if(count>5){//10回以上落ちたらゲームオーバー
   fill(255,0,0);
   textAlign(CENTER);
   textSize(28);
   text("GAME OVER",width/2,height/2);
  
  }
}