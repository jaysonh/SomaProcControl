import java.text.SimpleDateFormat;

class MsgDisplay
{
    MsgDisplay( int _x, int _y, int _w, int _h )
    {
       x = _x;
       y = _y;
       w = _w;
       h = _h;
    }
    
    void draw()
    {
        pushMatrix();
        translate(x,y);
        fill( bgCol, bgAlpha );
        
        stroke( bgOutCol);
        strokeWeight(bgOutWeight);
        rect(0,0, w,h);
        textSize(FONT_SIZE);
        fill(txtCol);
        for(String s : msgList)
        {
           text(s, 10,FONT_SIZE);
           translate(0,FONT_SIZE);
        }
        popMatrix();
    }  
    
    public void addMsg( String msg )
    {
      while( msgList.size() > MAX_MSGS)
      {
          msgList.remove(0);
      }
      msgList.add(getTimeStamp() + ": " + msg );
    }

    String getTimeStamp()
    {
      return new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());

    }
    ArrayList<String> msgList = new ArrayList<String>();
    final int MAX_MSGS = 19;
    final int FONT_SIZE = 15;
    final int bgAlpha = 125;
    final color bgOutCol = color(200);
    final color bgOutWeight = 4;
    final color bgCol  = color(125);
    final color txtCol = color(255);
    int x,y,w,h;
}
