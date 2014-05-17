package pattern.command;

import java.util.LinkedList;
import java.util.List;

public class Receiver
{
  private List<String> data;
  
  public Receiver()
  {
    setData(new LinkedList<String>());
  }
  
  public String pop()
  {
    return this.getData().remove(0);
  }
  
  public void push(String value)
  {
    this.data.add(value);
  }
  
  public String findAndRemove(String value)
  {
    int index = this.getData().indexOf(value);
    
    return this.getData().remove(index);
  }

  public List<String> getData()
  {
    return data;
  }

  public void setData(List<String> data)
  {
    this.data = data;
  }
}
