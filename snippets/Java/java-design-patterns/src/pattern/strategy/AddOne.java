package pattern.strategy;

public class AddOne implements Strategy
{
  public int algorithm(int value)
  {
    return value + 1;
  }
}
