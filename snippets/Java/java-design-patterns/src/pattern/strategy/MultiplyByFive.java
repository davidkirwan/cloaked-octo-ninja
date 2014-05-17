package pattern.strategy;

public class MultiplyByFive implements Strategy
{
  public int algorithm(int value)
  {
    return value * 5;
  }
}
