package pattern.observer;

import java.util.Observable;
import java.util.Observer;

public class Subject extends Observable
{
  private boolean value;
  
  public Subject()
  {
    setValue(false);
  }

  public boolean isValue()
  {
    return value;
  }

  public void setValue(boolean value)
  {
    this.value = value;
    setChanged();
    notifyObservers(this.value);
  }
  
  public void addWatcher(Observer o)
  {
    addObserver(o);
  }
  
}
