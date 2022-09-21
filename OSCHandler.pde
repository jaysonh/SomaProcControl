class OSCHandler
{
   OSCHandler( PApplet appRef )
   {
     oscP5 = new OscP5(appRef, SEND_PORT );
     myRemoteLocation = new NetAddress("192.168.0.142", RECV_PORT );
     
     
   }
   
   boolean isConnected()
   {
     return myRemoteLocation.isvalid();
   }
   
   void sendMsg( String address )
   {       
      OscMessage myMessage = new OscMessage( address );
      oscP5.send(myMessage, myRemoteLocation); 
   }
   
   void sendMsg( String address, int val )
   {     
      OscMessage oscMsg = new OscMessage( address );
      oscMsg.add( val );
      oscP5.send( oscMsg, myRemoteLocation); 
   }
   
   final int SEND_PORT = 9000;
   final int RECV_PORT = 9001;
   
   
    OscP5 oscP5;
    NetAddress myRemoteLocation;

}
