
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  
  userInterface.mousePress( theEvent.getController() );
  
}
