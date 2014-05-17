package tests.pattern.memento;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import pattern.memento.Caretaker;
import pattern.memento.Memento;
import pattern.memento.Originator;


public class MementoTester
{
  Caretaker caretaker;
  Originator originator;
  
  @Before
  public void setup()
  {
    originator = new Originator();
    caretaker = new Caretaker(originator);
  }
  
  @After
  public void teardown()
  {}
  
  @Test
  public void testGetMemento()
  {
    this.caretaker.capture_state();
    Memento memento = (Memento) this.caretaker.getMemento();
    
    assertTrue(memento.getState().equals(""));
    assertTrue(memento.getMore() == 0);
  }
  
  @Test
  public void testRestoreMemento()
  {
    Memento memento = new Memento("Test", 50);
    this.caretaker.setMemento(memento);
    this.caretaker.restore_yourself();
    
    this.caretaker.capture_state();
    memento = (Memento) this.caretaker.getMemento();
    
    assertTrue(memento.getState().equals("Test"));
    assertTrue(memento.getMore() == 50);
  }

}

