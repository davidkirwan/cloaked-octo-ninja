package tests.pattern.observer;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import pattern.observer.ConcreteObserver;
import pattern.observer.Subject;

public class ObserverTester
{
  private Subject s;
  private ConcreteObserver james, john, sarah, david, jake, derp;
  
  @Before
  public void setup()
  {
    s = new Subject();
    
    james = new ConcreteObserver("James");
    john = new ConcreteObserver("John");
    sarah = new ConcreteObserver("Sarah");
    david = new ConcreteObserver("David");
    jake = new ConcreteObserver("Jake");
    
    s.addObserver(james);
    s.addObserver(john);
    s.addObserver(sarah);
    s.addObserver(david);
    s.addObserver(jake);
  }
  
  @After
  public void teardown()
  {}
  
  @Test
  public void testSubject()
  {
    s.setValue(true);
    assertTrue(james.isValue());
    assertTrue(john.isValue());
    assertTrue(sarah.isValue());
    assertTrue(david.isValue());
    assertTrue(jake.isValue());
    
    s.setValue(false);
    assertTrue(!james.isValue());
    assertTrue(!john.isValue());
    assertTrue(!sarah.isValue());
    assertTrue(!david.isValue());
    assertTrue(!jake.isValue());
  }

}
