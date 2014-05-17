package pattern.command;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

public class Invoker
{
  private Stack<Command> undoBuffer;
  private Stack<Command> redoBuffer;
  private Map<String, Command> commands;


  public Invoker()
  {
    undoBuffer = new Stack<Command>();
    redoBuffer = new Stack<Command>();
    commands = new HashMap<String, Command>();
    
    this.commands.put("undo", new UndoCommand(undoBuffer, redoBuffer));
    this.commands.put("redo", new RedoCommand(undoBuffer, redoBuffer));
  }
  
  public void addCommand(String name, Command command)
  {
    this.commands.put(name, command);
  }

  public boolean dispatchCommand(String commandName, Object [] parameters) throws Exception
  {
    boolean dispatched = false;
    Command command = commands.get(commandName);
    
    if (command != null)
    {
      dispatched = true;
      command.doCommand(parameters);
      Command copy = command.copy();
      if (copy != null)
      {
        undoBuffer.push(copy);
        redoBuffer.clear();
      }
    }
    return dispatched;
  }

}
