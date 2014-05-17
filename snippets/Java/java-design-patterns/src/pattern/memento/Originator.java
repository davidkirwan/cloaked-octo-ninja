package pattern.memento;

public class Originator
{ 
  private String state;
  private int more;
  
  public Originator()
  {
    this.state = "";
    this.more = 0;
  }
  
  public Memento get_memento()
  { 
    return new Memento(this.state, this.more);
  }
  
  public void restore(Object o)
  { 
    state = ((Memento)o).getState();
    more = ((Memento)o).getMore();
  }
}
