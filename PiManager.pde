class PiManager
{
   PiManager( OSCHandler _osc )
   {
      osc = _osc; 
   }
   
   void restartPi()
   {
     osc.sendMsg( RESTART_PI_ADDR );
   }
   void restartApp()
   {
     osc.sendMsg( RESTART_APP_ADDR );
   }
   
   void stoppApp()
   {
     osc.sendMsg( STOP_APP_ADDR );
   }
   
   void sendLaserSelect( int laserSelection )
   {
       osc.sendMsg("/soma/effect", laserSelection);
   }
   
   final String RESTART_PI_ADDR  = "/soma/restartPi";
   final String RESTART_APP_ADDR = "/soma/restartApp";
   final String STOP_APP_ADDR    = "/soma/stopApp";
   OSCHandler osc;
}
