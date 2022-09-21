ControlP5 cp5;

class UserInterface
{
 
    UserInterface( PApplet appRef)
    {
       cp5 = new ControlP5(appRef);
       
       addButton("restartApp", width/2, 10 );
       addButton("stopApp",    width/2, 30 );
       addButton("restartPi",  width/2, 50 );
       addButton("save",       width/2, 70 );
       addButton("load",       width/2, 90 );
       
      laserEffect = cp5.addDropdownList("Laser Effect")
          .setPosition(width/2 + 250, 50);
      for(int i =0; i < laserEffectList.length;i++)
      {
        laserEffect.addItem(laserEffectList[i],i);
      }
      
     keystoneSelect =  cp5.addSlider("keystoneSelect")
     .setPosition(width/2 + 250,20)
     .setRange(0,5)
     ;
     
     CallbackListener adjustLabel = new CallbackListener() 
     {
        public void controlEvent(CallbackEvent c) {
          if(c.getAction()==ControlP5.ACTION_BROADCAST) {
            sl.getValueLabel().setText(String.format("%.0f" , sl.getValue()));
          }
        }
      };
      // add the callback listener to slider sl 
      sl.addCallback(adjustLabel);
    }
    
    Button addButton(String btnName, int posX, int posY)
    {
          Button b =  cp5.addButton(btnName)
                         .setValue(100)
                         .setPosition(posX, posY)
                         .setSize(200,19);
         
         uiElements.add( b) ;
         
         return b;
    }
    
    void mousePress(Controller objPressed )
    {
        if(objPressed == restartBtn)
        {
            
        }
    }
    
    ArrayList <Controller> uiElements  = new ArrayList<Controller>();
    Button restartBtn;
    
    Slider keystoneSelect;
    DropdownList laserEffect; 
    
    String []laserEffectList = { "hello", "world", "these", "are", "the", "effect"};
}
