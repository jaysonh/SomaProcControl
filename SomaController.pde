import controlP5.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float []cornersX = new float[4];
float []cornersY = new float[4];
int selected = -1;

int currKeystone = 0;
void setup() 
{
  size( 600,600 );
  frameRate(25);
  
  userInterface = new ControlP5( this );
  /* start oscP5, listening for incoming messages at port 9001 */
  oscP5 = new OscP5(this,9001);
  myRemoteLocation = new NetAddress("192.168.0.142", 9000);

  cornersX[0] = 0.01;
  cornersY[0] = 0.01;
  cornersX[1] = 0.99;
  cornersY[1] = 0.01;
  cornersX[2] = 0.99;
  cornersY[2] = 0.99;
  cornersX[3] = 0.01;
  cornersY[3] = 0.99;
  
  frameRate(30);
}


void draw() {
  background(0);  
  noFill();
  stroke(0,255,0);
  beginShape();
  for(int i= 0; i < 4;i++)
  {
     vertex(cornersX[i] * (float)width, cornersY[i] * (float)height); 
  }
  endShape(CLOSE);
  
  if(selected > -1)
  {
     fill(0,255,0);
     rect(cornersX[selected] * (float)width, cornersY[selected] * (float)height,10,10);
  }
  
   OscMessage myMessage = new OscMessage("/soma/data");
      myMessage.add(random(1)  ); 
      for(int i= 0; i < 6;i++)
      {
        float r1 = random(0.0, 0.25) *10.0;
        float r2 = random(0.0, 0.25)*10.0;
        print(r1 + "," + r2 + " ");
        myMessage.add( r1 );
        myMessage.add( r2 );
      }
      println("");
      
      println(myMessage);
      oscP5.send(myMessage, myRemoteLocation); 
}

void keyPressed()
{
   if(key == 'p')
   {
     OscMessage myMessage = new OscMessage("/soma/restartApp");
      oscP5.send(myMessage, myRemoteLocation); 
     println("Sending: /soma/restartApp");
   }
   
   if(key == 'o')
   {
     OscMessage myMessage = new OscMessage("/soma/stopApp");
      oscP5.send(myMessage, myRemoteLocation); 
     println("Sending: /soma/stopApp");
   }
   if(key == 'i')
   {
     OscMessage myMessage = new OscMessage("/soma/restartPi");
      oscP5.send(myMessage, myRemoteLocation); 
     println("Sending: /soma/restartPi");
   }
   if(key == 'z' )
   {
      OscMessage myMessage = new OscMessage("/soma/effect");
      myMessage.add( 0 );
      oscP5.send(myMessage, myRemoteLocation); 
   }
   if(key == 'x' )
   {
      OscMessage myMessage = new OscMessage("/soma/effect");
      myMessage.add( 1 );
      oscP5.send(myMessage, myRemoteLocation); 
   }
   if(key == 'c' )
   {
      OscMessage myMessage = new OscMessage("/soma/effect");
      myMessage.add( 2 );
      oscP5.send(myMessage, myRemoteLocation); 
   }
   if(key == 'v' )
   {
      OscMessage myMessage = new OscMessage("/soma/effect");
      myMessage.add( 3 );
      oscP5.send(myMessage, myRemoteLocation); 
   }
   if(key == 'b' )
   {
      OscMessage myMessage = new OscMessage("/soma/effect");
      myMessage.add( 4 );
      oscP5.send(myMessage, myRemoteLocation); 
   }
   if(key == 'n' )
   {
      OscMessage myMessage = new OscMessage("/soma/effect");
      myMessage.add( 5 );
      oscP5.send(myMessage, myRemoteLocation); 
   }
   if(key == 'm' )
   {
      OscMessage myMessage = new OscMessage("/soma/effect");
      myMessage.add( 6 );
      oscP5.send(myMessage, myRemoteLocation); 
   }
   if( key == 'w')
   {
      OscMessage myMessage = new OscMessage("/soma/data");
      myMessage.add(random(1)  ); 
      for(int i= 0; i < 6;i++)
      {
        myMessage.add( random(1) );
        myMessage.add( random(1) );
      }
      oscP5.send(myMessage, myRemoteLocation); 
    
       
   }
   if( key == '0')
   {
      OscMessage myMessage = new OscMessage("/soma/keystoneSet");
      myMessage.add(0  ); 
      oscP5.send(myMessage, myRemoteLocation); 
      currKeystone = 0;
   }
   if( key == '1')
   {
      OscMessage myMessage = new OscMessage("/soma/keystoneSet");
      myMessage.add( 1  ); 
      oscP5.send(myMessage, myRemoteLocation); 
      currKeystone = 1;
   }
   if( key == '2')
   {
      OscMessage myMessage = new OscMessage("/soma/keystoneSet");
      myMessage.add( 2  ); 
      oscP5.send(myMessage, myRemoteLocation); 
      currKeystone = 2;
   }
   if( key == '3')
   {
      OscMessage myMessage = new OscMessage("/soma/keystoneSet");
      myMessage.add( 3  ); 
      oscP5.send(myMessage, myRemoteLocation); 
      currKeystone = 3;
   }
   if( key == '4')
   {
      OscMessage myMessage = new OscMessage("/soma/keystoneSet");
      myMessage.add( 4  ); 
      oscP5.send(myMessage, myRemoteLocation); 
      currKeystone = 4;
   }
   if( key == '5')
   {
      OscMessage myMessage = new OscMessage("/soma/keystoneSet");
      myMessage.add( 5  ); 
      oscP5.send(myMessage, myRemoteLocation); 
      currKeystone = 5;
   }
   
   if(key=='s')
   {
      OscMessage myMessage = new OscMessage("/soma/saveKeystone");
      oscP5.send(myMessage, myRemoteLocation); 
     
   }
   if(key=='l')
   {
      OscMessage myMessage = new OscMessage("/soma/loadKeystone");
      oscP5.send(myMessage, myRemoteLocation); 
     
   }
}
void mouseReleased()
{
  //OscMessage myMessage = new OscMessage("/soma/stonemap");
  OscMessage myMessage = new OscMessage("/soma/keystone");
  
  myMessage.add( currKeystone   ); /* add a string to the osc message */
  myMessage.add(cornersX[0] );
  myMessage.add(cornersY[0] );
  myMessage.add(cornersX[1] ); 
  myMessage.add(cornersY[1]  );
  myMessage.add(cornersX[2]  );
  myMessage.add(cornersY[2]  );
  myMessage.add(cornersX[3] );
  myMessage.add(cornersY[3]  );
  
  selected = -1;

  oscP5.send(myMessage, myRemoteLocation); 
  println("sending");
}

void mouseDragged()
{
   if(selected > -1)
   {
       cornersX[selected] = (float)mouseX / (float)width;
       cornersY[selected] = (float)mouseY / (float)height;
   }
}

void mousePressed() 
{
  for(int i = 0; i < 4; i++)
  {
    if( dist(mouseX,mouseY, cornersX[i] * (float)width, cornersY[i] * (float)height) < 20)
    {
      selected = i;
    }
  }
}
