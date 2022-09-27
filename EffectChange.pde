int     effectChangeThreadWait = 1000; // update every 1000 ms
boolean effectChangeRunning    = false;
float   effectChangeTime       = 0;
int     lastChangeTime         = 0;
boolean changeActive           = true;
int     currEffect             = 0;
int     numEffects             = 4;

void setupEffectChange()
{
   effectChangeRunning = true;
   lastChangeTime = millis();
   thread("updateEffectChange");
}
  
  
void changeLaserEffect( int effectNum )
{
    currEffect = effectNum;
    
    if(oscHandler!=null)
          oscHandler.sendMsg( "/soma/effect", effectNum );  
}

void updateEffectChange()
{
    while( effectChangeRunning )
    {
       if ( millis() - lastChangeTime > effectChangeTime * 1000 && 
            changeActive && 
            !keystoneManager.isEditing() 
           )
       {
          currEffect = (currEffect + 1) % numEffects;
          println("changing effect: " + currEffect);
          lastChangeTime = millis();
          changeLaserEffect( currEffect );
       }
       delay( effectChangeThreadWait ); 
    }
}
