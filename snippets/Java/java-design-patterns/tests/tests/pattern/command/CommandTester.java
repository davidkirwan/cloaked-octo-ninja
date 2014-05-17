package tests.pattern.command;

import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;
import java.util.LinkedList;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import pattern.command.AddCommand;
import pattern.command.DeleteCommand;
import pattern.command.Invoker;
import pattern.command.Receiver;


public class CommandTester
{
  private Invoker invoker;
  private Receiver receiver;
  private List<String> original;
  
  String[] starting = {"Quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog"};
  String[] after_add = {"Quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog", "test"};
  String[] after_delete = {"Quick", "brown", "fox", "jumped", "over", "the", "lazy"};
  
  @Before
  public void setup()
  {
    invoker = new Invoker();
    receiver = new Receiver();
    
    invoker.addCommand("add", new AddCommand(receiver));
    invoker.addCommand("delete", new DeleteCommand(receiver));

    receiver.setData(new LinkedList<String>(Arrays.asList(starting)));
    original = new LinkedList<String>(Arrays.asList(starting));
  }
  
  @After
  public void teardown()
  {
    receiver.setData(Arrays.asList(starting));
  }

  @Test
  public void deleteCommand()
  {
    System.out.println("deleteCommand initial state: " + receiver.getData());
    assertTrue(receiver.getData().equals(original));
    
    try
    {
      Object[] parameters = {"dog"};
      invoker.dispatchCommand("delete", parameters);
      
      List<String> tmp = new LinkedList<String>(Arrays.asList(after_delete));
      System.out.println("deleteCommand after delete: " + receiver.getData());
      assertTrue(receiver.getData().equals(tmp));
      
      parameters = null;
      invoker.dispatchCommand("undo", parameters);
      System.out.println("deleteCommand after undo: " + receiver.getData());
      assertTrue(receiver.getData().equals(original));
      
      parameters = null;
      invoker.dispatchCommand("redo", parameters);
      System.out.println("deleteCommand after redo: " + receiver.getData());
      assertTrue(receiver.getData().equals(tmp));
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }
  
  @Test
  public void addCommand()
  {
    System.out.println("addCommand initial state: " + receiver.getData());    
    assertTrue(receiver.getData().equals(original));

    try
    {
      Object[] parameters = {"test"};
      invoker.dispatchCommand("add", parameters);
      
      List<String> tmp = new LinkedList<String>(Arrays.asList(after_add));
      System.out.println("addCommand after add: " + receiver.getData());
      assertTrue(receiver.getData().equals(tmp));
      
      parameters = null;
      invoker.dispatchCommand("undo", parameters);
      System.out.println("addCommand after undo: " + receiver.getData());
      assertTrue(receiver.getData().equals(original));
      
      parameters = null;
      invoker.dispatchCommand("redo", parameters);
      System.out.println("addCommand after redo: " + receiver.getData());
      assertTrue(receiver.getData().equals(tmp));
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }
}
