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
        fill( bgCol );
        
        rect(0,0, w,h);
        
        fill(txtCol);
        for(String s : msgList)
        {
           text(s, 10,10);
           translate(0,10);
        }
        popMatrix();
    }  
    
    ArrayList<String> msgList = new ArrayList<String>();
    
    final color bgCol  = color(125);
    final color txtCol = color(0);
    int x,y,w,h;
}
