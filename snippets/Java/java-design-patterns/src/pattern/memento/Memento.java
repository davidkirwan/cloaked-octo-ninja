package pattern.memento;

public class Memento
{ 
  private String state;
  private int more;
  
  public Memento(String state, int more)
  {
    this.setState(state);
    this.setMore(more);
  }
  
  public String toString()
  {
    return getState() + ", " + getMore() ;
  }

  public String getState()
  {
    return state;
  }

  public void setState(String state)
  {
    this.state = state;
  }

  public int getMore()
  {
    return more;
  }

  public void setMore(int more)
  {
    this.more = more;
  }
}