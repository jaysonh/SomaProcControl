import controlP5.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

KeystoneManager keystoneManager;
MsgDisplay      msgDisplay;
UserInterface   userInterface;
OSCHandler      oscHandler;
PiManager       piManager;

void setup() 
{
  size( 1200,600 );
  frameRate(25);
  oscHandler      = new OSCHandler(this);
  userInterface   = new UserInterface( this, oscHandler );
  keystoneManager = new KeystoneManager(0,0, width/2,height, oscHandler);
  msgDisplay      = new MsgDisplay(width/2, height/2, width/2-10, height/2-10);
  
  piManager       = new PiManager( oscHandler );
  
  frameRate(30);
}


void draw() {
  
  userInterface.update();
  background(0);  
  
  keystoneManager.draw();
  
  msgDisplay.draw();
}

void keyPressed()
{
  /*
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
   */
}
void mouseReleased()
{
  
  keystoneManager.mouseReleased(mouseX,mouseY);
}

void mouseDragged()
{
  keystoneManager.mouseDragged(mouseX,mouseY);
}

void mousePressed() 
{
  keystoneManager.mousePressed(mouseX,mouseY);
}
