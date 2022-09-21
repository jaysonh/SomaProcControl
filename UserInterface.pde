ControlP5 cp5;

class UserInterface
{
 
    UserInterface( PApplet appRef)
    {
       cp5 = new ControlP5(appRef);
       
       addButton("restartApp", width/2, 10 );
       addButton("stopApp",    width/2, 30 );
       addButton("restartPi",  width/2, 50 );
       saveBtn = addButton("save",       width/2, 70 );
       loadBtn = addButton("load",       width/2, 90 );
       
      laserEffect = cp5.addDropdownList("Laser Effect")
          .setPosition(width/2 + 250, 50);
      for(int i =0; i < laserEffectList.length;i++)
      {
        laserEffect.addItem(laserEffectList[i],i);
      }
      laserEffect.setOpen(true);
      
     keystoneSelect =  cp5.addSlider("keystoneSelect")
     .setPosition(width/2 + 250,20)
     .setRange(0,5)
     ;
     
     CallbackListener adjustLabel = new CallbackListener() 
     {
        public void controlEvent(CallbackEvent c) {
          if(c.getAction()==ControlP5.ACTION_BROADCAST) {
            keystoneSelect.getValueLabel().setText(String.format("%.0f" , keystoneSelect.getValue()));
            
            keystoneManager.setKeystone( (int)keystoneSelect.getValue() );
          }
        }
      };
      // add the callback listener to slider sl 
      keystoneSelect.addCallback(adjustLabel);
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
    
    void update()
    {
         laserEffect.setOpen(true);
    }
    
    void mousePress(Controller objPressed )
    {
        if(objPressed == restartBtn)
        {
            
        }
        
        if(objPressed == laserEffect )
        {
        }
        
        if(objPressed == saveBtn)
        {
          keystoneManager.save();
        }
        if(objPressed == loadBtn)
        {
          keystoneManager.load();
        }
    }
    
    ArrayList <Controller> uiElements  = new ArrayList<Controller>();
    Button restartBtn, saveBtn, loadBtn;
    
    Slider keystoneSelect;
    DropdownList laserEffect; 
    
    String []laserEffectList = { "hello", "world", "these", "are", "the", "effect"};
}
