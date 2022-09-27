ControlP5 cp5;

class UserInterface
{
 
    UserInterface( PApplet appRef, OSCHandler _osc)
    {
       cp5 = new ControlP5(appRef);
       
       // set up osc
       osc = _osc;
       osc.sendMsg( "/soma/keystoneSet", 0 );
      
       restartAppBtn  = addButton("restartApp",   width/2, 10 );
       stopAppBtn     = addButton("stopApp",      width/2, 30 );
       restartPiBtn   = addButton("restartPi",    width/2, 50 );
       saveBtn        = addButton("save",         width/2, 70 );
       loadBtn        = addButton("load",         width/2, 90 );
       editKeystone   = addToggle("editKeystone", width/2, 130);
       timerChangeTgl = addToggle("timerChange",  width/2 + 250, 40);
       
      laserEffect = cp5.addDropdownList("Laser Effect")
          .setPosition(width/2 + 250, 110);
      for(int i =0; i < laserEffectList.length;i++)
      {
        laserEffect.addItem(laserEffectList[i],i);
      }
      laserEffect.setOpen(true);
      
     keystoneSelect = cp5.addSlider("keystoneSelect")
     .setPosition(width/2 + 250,20)
     .setRange(0,5.99)
     ;
     
     effectChangeTimeSlider = cp5.addSlider("effectChange")
     .setPosition(width/2 + 250,80)
     .setRange(0,100)
     ;
     
     CallbackListener adjustLabel = new CallbackListener() 
     {
        public void controlEvent(CallbackEvent c) {
          if(c.getAction()==ControlP5.ACTION_BROADCAST) {
            keystoneSelect.getValueLabel().setText("val: " + (int) keystoneSelect.getValue());
            
            keystoneManager.setKeystone( (int)keystoneSelect.getValue() );
          }
        }
      };
      // add the callback listener to slider sl 
      keystoneSelect.addCallback(adjustLabel);
    }
    
    Toggle addToggle(String toggleName, int posX, int posY)
    {
        int toggleSize = 20;
        Toggle toggle = cp5.addToggle(toggleName)
                           .setPosition(posX, posY)
                           .setSize( toggleSize, toggleSize)
                           .setValue(true)
                           //.setMode(ControlP5.SWITCH)
                           ;
                           
        Textlabel lbl = cp5.addLabel(" " + toggleName)
                           .setPosition(posX+toggleSize + 5,posY + 6);

        uiElements.add( toggle ) ;
        return toggle;
    }
    
    void setLaserTimer( int useTimer, float timerChange )
    {
        changeActive     = useTimer == 1;
        effectChangeTime = timerChange;
        timerChangeTgl.setValue( useTimer );
        effectChangeTimeSlider.setValue( timerChange );
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
      
        if( objPressed == editKeystone )
        {
            piManager.setToggleKeystone( (int)editKeystone.getValue() );
            keystoneManager.setEdit( (int)editKeystone.getValue() == 1 );
        }
        
        if( objPressed == effectChangeTimeSlider )
        {
            effectChangeTime = effectChangeTimeSlider.getValue();
        }
        
        if( objPressed == timerChangeTgl )
        {
           boolean b = (timerChangeTgl.getValue() == 1);
           effectChangeTimeSlider.setVisible( b );
           changeActive = b;
        }
      
        if(objPressed == restartPiBtn)
        {
            piManager.restartPi();
        }
        
        if(objPressed == restartAppBtn)
        {
           piManager.restartApp();
        }
        
        if( objPressed == stopAppBtn )
        {
           piManager.stoppApp();
        }
        
        if(objPressed == laserEffect )
        {
          changeLaserEffect( (int) laserEffect.getValue() );
        }
        
        if(objPressed == saveBtn)
        {
          keystoneManager.save();
          osc.sendMsg( "/soma/saveKeystone" );
        }
        if(objPressed == loadBtn)
        {
          keystoneManager.load();
        }
    }
    
    ArrayList <Controller> uiElements = new ArrayList<Controller>();
    Button restartPiBtn, stopAppBtn, restartAppBtn, saveBtn, loadBtn;
    Toggle editKeystone, timerChangeTgl;
    
    OSCHandler osc;
    Slider keystoneSelect;
    Slider effectChangeTimeSlider;
    
    DropdownList laserEffect; 
    
    String []laserEffectList = { "Circles", "Lines", "Points", "Rain" };
}
