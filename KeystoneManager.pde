class KeystoneManager
{
  KeystoneManager(float _displayX, float _displayY, float _displayW, float _displayH, OSCHandler _osc)
  {
    osc      = _osc;
    displayX = _displayX;
    displayY = _displayY;
    displayW = _displayW;
    displayH = _displayH;
    float w = 1.0 / 2.0;
    float h = 1.0 / 3.0;
    
    // 2 x 3 grid of keystones
    for(int i = 0; i < NUM_KEYSTONES;i++)
    {
      int x = i % 2;
      int y = i / 2;
      
      float xPos = ((float) x) * w;
      float yPos = ((float) y) * h;
      
      keystone[i] = new Keystone(xPos,yPos, w, h); // store data as normalised values
    }
    keystone[selectedKey].select();
  }
  
  void draw()
  {
    pushMatrix();
    translate(displayX, displayY);
      for(int i = 0; i < NUM_KEYSTONES;i++)
      {
         keystone[i].draw( displayW,  displayH); 
      }
    popMatrix();
  }
  
  void save()
  {
      JSONObject json= new JSONObject();

      json.setFloat("displayX", displayX);
      json.setFloat("displayY", displayY);
      json.setFloat("displayW", displayW);
      json.setFloat("displayH", displayH);
      
      for(int i = 0; i < NUM_KEYSTONES;i++)
      {
          json.setJSONObject("keystone" + i, keystone[i].getJSON());
      }
        
      saveJSONObject(json, saveFilePath);
  }
  
  void load()
  {       
      JSONObject json = loadJSONObject( saveFilePath );
      
      displayX = json.getFloat("displayX");
      displayY = json.getFloat("displayY");
      displayW = json.getFloat("displayW");
      displayH = json.getFloat("displayH");
      
      for( int i = 0; i < NUM_KEYSTONES; i++ )
      {
        JSONObject keystoneJson = json.getJSONObject("keystone" + i);
        
        float []xCoords = new float[4];
        float []yCoords = new float[4];
        
        for(int j = 0; j < 4;j++)
        {
           float x = keystoneJson.getFloat("x" + j);
           float y = keystoneJson.getFloat("y" + j);
           xCoords[j] = x;
           yCoords[j] = y;
        }
        keystone[i].setCorners( xCoords[0], yCoords[0],
                                xCoords[1], yCoords[1],
                                xCoords[2], yCoords[2],
                                xCoords[3], yCoords[3] );
      }
      
      updateLaser();
  }
  
  void mouseReleased( int mX, int mY)
  {
    if( mX > displayX && mX < displayX + displayW &&
          mY > displayY && mY < displayY + displayH )
      {
        //selectedKey = -1;
        float mouseNormX = (float)(mX - displayX) / (float)displayW;
        float mouseNormY = (float)(mY - displayY) / (float)displayH;
        
        keystone[selectedKey].mouseReleased( mouseNormX, mouseNormY );
      }
  }
  void mouseDragged(int mX, int mY)
  {
      if( mX > displayX && mX < displayX + displayW &&
          mY > displayY && mY < displayY + displayH )
      {
        
         if( selectedKey > -1 )
         { 
              float mouseNormX = (float)(mX - displayX) / (float)displayW;
              float mouseNormY = (float)(mY - displayY) / (float)displayH;
              
              keystone[selectedKey].mouseDragged( mouseNormX, mouseNormY );
              
              updateLaser();
         }     
      }
  }
  
  void updateLaser()
  {
    if( selectedKey > -1 )
    {
        //OscMessage myMessage = new OscMessage("/soma/stonemap");
        OscMessage myMessage = new OscMessage("/soma/keystone");
        
        myMessage.add( selectedKey   ); 
        myMessage.add(keystone[ selectedKey ].cornersX[0] );
        myMessage.add(keystone[ selectedKey ].cornersY[0] );
        myMessage.add(keystone[ selectedKey ].cornersX[1] ); 
        myMessage.add(keystone[ selectedKey ].cornersY[1]  );
        myMessage.add(keystone[ selectedKey ].cornersX[2]  );
        myMessage.add(keystone[ selectedKey ].cornersY[2]  );
        myMessage.add(keystone[ selectedKey ].cornersX[3] );
        myMessage.add(keystone[ selectedKey ].cornersY[3]  );
   
        osc.sendMsg( myMessage );
    }
  }
  
  void mousePressed( int mX, int mY)
  {
      // check if we clicke dwhtin keystone window
      if( mX > displayX && mX < displayX + displayW &&
          mY > displayY && mY < displayY + displayH )
      {
          float mouseNormX = (float)(mX - displayX) / (float)displayW;
          float mouseNormY = (float)(mY - displayY) / (float)displayH;
          
          // check that we have sleected a keystone square
          if(selectedKey >-1)
          {
            keystone[selectedKey].mousePressed( mouseNormX, mouseNormY );
          }
      }
  }
  
  void setKeystone( int keyIndx )
  {
     for(int i = 0; i < NUM_KEYSTONES; i++)
     {
       if( i == keyIndx)
          keystone[i].select();
       else
         keystone[i].deselect(); 
     }
     selectedKey = keyIndx; 
  }
  
  OSCHandler osc;
  final String saveFilePath = "data/keystone.json";
  
  int selectedKey = 0;
  final int NUM_KEYSTONES = 6;
  Keystone [] keystone = new Keystone[NUM_KEYSTONES];
  
  float displayX, displayY,  displayW,  displayH;
}
