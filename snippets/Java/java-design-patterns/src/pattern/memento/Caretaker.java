package pattern.memento;

public class Caretaker
{
  private Object memento;
  private Originator originator;
  
  public Caretaker(Originator originator)
  {
    this.originator = originator;
  }
  
  public void capture_state()
  { 
    this.setMemento(originator.get_memento());
  }
  public void restore_yourself()
  { 
    originator.restore(getMemento());
  }

  public Object getMemento()
  {
    return memento;
  }

  public void setMemento(Object memento)
  {
    this.memento = memento;
  }

}
