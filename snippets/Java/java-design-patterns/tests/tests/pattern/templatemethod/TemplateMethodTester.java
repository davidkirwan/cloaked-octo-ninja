package tests.pattern.templatemethod;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import pattern.templatemethod.AddOne;
import pattern.templatemethod.MultiplyByFive;
import pattern.templatemethod.TemplateMethod;

public class TemplateMethodTester
{
  private int[] fixtures = { 1, 5, 10, 15};
  private TemplateMethod example;

  @Test
  public void addOne()
  {
    example = new AddOne();
    int result = 0;
    int value = 0;
    
    for(int i = 0; i < fixtures.length; i++)
    {
      result = example.theTemplateMethod(fixtures[i]);
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
      result = example.theTemplateMethod(fixtures[i]);
      value = fixtures[i] * 5;
      assertTrue(result == value);
    }
  }
}
