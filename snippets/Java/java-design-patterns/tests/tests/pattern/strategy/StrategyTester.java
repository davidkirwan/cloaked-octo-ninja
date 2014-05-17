package tests.pattern.strategy;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import pattern.strategy.AddOne;
import pattern.strategy.MultiplyByFive;
import pattern.strategy.Strategy;

public class StrategyTester
{
  private int[] fixtures = { 1, 5, 10, 15};
  private Strategy example;

  @Test
  public void addOne()
  {
    example = new AddOne();
    int result = 0;
    int value = 0;
    
    for(int i = 0; i < fixtures.length; i++)
    {
      result = example.algorithm(fixtures[i]);
      value = fixtures[i] + 1;
      assertTrue(result == value);
    }
  }
  
  @Test
  public void multiplyByFive()
  {
    example = new MultiplyByFive();
    int result = 0;
    int value = 0;
    
    for(int i = 0; i < fixtures.length; i++)
    {
      result = example.algorithm(fixtures[i]);
      value = fixtures[i] * 5;
      assertTrue(result == value);
    }
  }
}
