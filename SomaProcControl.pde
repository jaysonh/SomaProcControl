import controlP5.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

KeystoneManager keystoneManager;
MsgDisplay      msgDisplay;
UserInterface   userInterface;
OSCHandler      oscHandler;

void setup() 
{
  size( 1200,600 );
  frameRate(25);
  
  userInterface = new UserInterface( this );
  keystoneManager = new KeystoneManager(0,0, width/2,height);
  
  msgDisplay = new MsgDisplay(width/2, height/2, width/2-10, height/2-10);
  oscHandler = new OSCHandler(this);
  
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
   /*if(key == 'p')
   {
     OscMessage myMessage = new OscMessage("/soma/restartApp");
      oscP5.send(myMessage, myRemoteLocation); 
     println("Sending: /soma/restartApp");
   }
   
   if(key == 'o')
   {
      //OscMessage myMessage = new OscMessage("/soma/stopApp");
      //oscP5.send(myMessage, myRemoteLocation); 
      //println("Sending: /soma/stopApp");
      
      oscHandler.sendMsg("/soma/stopApp");
   }
   if(key == 'i')
   {
      //OscMessage myMessage = new OscMessage("/soma/restartPi");
      //oscP5.send(myMessage, myRemoteLocation); 
      //println("Sending: /soma/restartPi");
      oscHandler.sendMsg("/soma/restartPi");
   }
   if(key == 'z' )
   {
      //OscMessage myMessage = new OscMessage("/soma/effect");
      //myMessage.add( 0 );
      //oscP5.send(myMessage, myRemoteLocation); 
      oscHandler.sendMsg( "/soma/effect", 0 );
   }
   if(key == 'x' )
   {
      //OscMessage myMessage = new OscMessage("/soma/effect");
      //myMessage.add( 1 );
      //oscP5.send(myMessage, myRemoteLocation); 
      oscHandler.sendMsg( "/soma/effect", 1 );
   }
   if(key == 'c' )
   {
      //OscMessage myMessage = new OscMessage("/soma/effect");
      //myMessage.add( 2 );
      //oscP5.send(myMessage, myRemoteLocation); 
      
      oscHandler.sendMsg( "/soma/effect", 2 );
   }
   if(key == 'v' )
   {
      //OscMessage myMessage = new OscMessage("/soma/effect");
      //myMessage.add( 3 );
      //oscP5.send(myMessage, myRemoteLocation);
      oscHandler.sendMsg( "/soma/effect", 3 ); 
   }
   if(key == 'b' )
   {
      //OscMessage myMessage = new OscMessage("/soma/effect");
      //myMessage.add( 4 );
      //oscP5.send(myMessage, myRemoteLocation);
      oscHandler.sendMsg( "/soma/effect", 4 );  
   }
   if(key == 'n' )
   {
      //OscMessage myMessage = new OscMessage("/soma/effect");
      //myMessage.add( 5 );
      //oscP5.send(myMessage, myRemoteLocation); 
      oscHandler.sendMsg( "/soma/effect", 5 ); 
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
