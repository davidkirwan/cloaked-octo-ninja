package pattern.templatemethod;

public abstract class TemplateMethod
{
  public TemplateMethod()
  {}
  
  public int theTemplateMethod(int value)
  {
    return algorithm(value);
  }
  
  public abstract int algorithm(int value);
}
