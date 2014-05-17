package pattern.observer;

import java.util.Observable;
import java.util.Observer;

public class ConcreteObserver implements Observer
{
  private String name;
  private boolean value;
  
  public ConcreteObserver(String name)
  {
    this.name = name;    
  }
  
  @Override
  public void update(Observable arg0, Object arg1)
  {
    this.setValue((Boolean) arg1);
    System.out.println(name + " has been informed that Subject changed to: " + arg1);
  }

  public boolean isValue()
  {
    return value;
  }

  public void setValue(boolean value)
  {
    this.value = value;
  }

}
