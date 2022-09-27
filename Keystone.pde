class Keystone
{
  Keystone(float _x, float _y, float _w, float _h)
  {
      cornersX[0] = _x;
      cornersY[0] = _y;
      
      cornersX[1] = _x + _w;
      cornersY[1] = _y;
      
      cornersX[2] = _x + _w;
      cornersY[2] = _y + _h;
      
      cornersX[3] = _x ;
      cornersY[3] = _y + _h;
  }
  
  void setCorners( float x0, float y0,
                   float x1, float y1,
                   float x2, float y2,
                   float x3, float y3  )
  {
      cornersX[0] = x0;
      cornersY[0] = y0;
      cornersX[1] = x1;
      cornersY[1] = y1;
      cornersX[2] = x2;
      cornersY[2] = y2;
      cornersX[3] = x3;
      cornersY[3] = y3;
  }
                    
  void draw(float _displayW, float _displayH)
  {
    pushStyle();
     noFill();
      stroke(0,255,0);
      
      if(selected )
      {
        strokeWeight(SELECTED_KEYSTONE_WEIGHT);
      }else
      {
        strokeWeight(KEYSTONE_WEIGHT);
      }
      beginShape();
      for(int i= 0; i < 4;i++)
      {
        float x =  cornersX[i] * _displayW;
        float y = cornersY[i] * _displayH ;
         vertex( x, y); 
      }
      endShape(CLOSE);
      
      if(selectedCorner > -1)
      {
         fill(0,255,0);
         rectMode(CENTER);
         rect( cornersX[selectedCorner] * _displayW, cornersY[selectedCorner] * _displayH, 10,10);
      } 
      popStyle();
  }
  
  JSONObject getJSON()
  {
     JSONObject json = new JSONObject();
     
     json.setFloat("x0", cornersX[0]);
     json.setFloat("y0", cornersY[0]);
     
     json.setFloat("x1", cornersX[1]);
     json.setFloat("y1", cornersY[1]);
     
     json.setFloat("x2", cornersX[2]);
     json.setFloat("y2", cornersY[2]);
     
     json.setFloat("x3", cornersX[3]);
     json.setFloat("y3", cornersY[3]);
     
     return json;
  }
  
  void mouseDragged( float normMouseX, float normMouseY )
  {
      if( selectedCorner > -1 )
      {
          cornersX[ selectedCorner ] = normMouseX;
          cornersY[ selectedCorner ] = normMouseY;
      }
  }
  
  void mouseReleased( float normMouseX, float normMouseY )
  {
    selectedCorner = -1;
  }
  
  void mousePressed( float normMouseX, float normMouseY )
  {
      for(int i = 0; i < 4; i++)
      {
        float d = dist(normMouseX,normMouseY, cornersX[i], cornersY[i]);
        
        if( d < SELECTED_THRESH )
        {
          println("selected: " + i);
          selectedCorner = i;
          
        }
      } 
  }
  
  void select()
  {
     selected = true; 
  }
  
  void deselect()
  {
    selected = false;
    selectedCorner = -1;
  }
  
  final float          KEYSTONE_WEIGHT = 1.0;
  final float SELECTED_KEYSTONE_WEIGHT = 4.0;
  final int NUM_CORNERS = 4;
  final float SELECTED_THRESH = 0.025;
  float []cornersX = new float[NUM_CORNERS];
  float []cornersY = new float[NUM_CORNERS];
  
  float keystoneW = 0;
  float keystoneH = 0;
  boolean selected =false;
  int selectedCorner = -1;
  
}
