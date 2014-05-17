package pattern.command;

import java.util.Stack;

public class RedoCommand extends Command
{
  private Stack<Command> undoBuffer;
  private Stack<Command> redoBuffer;

  public RedoCommand(Stack<Command> undoBuffer, Stack<Command> redoBuffer)
  {
    this.undoBuffer = undoBuffer;
    this.redoBuffer = redoBuffer;
  }
  public void doCommand(Object[] parameters) throws Exception
  {
    if (redoBuffer.size() > 0)
    {
      Command command = redoBuffer.pop();
      command.redoCommand();
      undoBuffer.push(command);
    }
    else
    {
      System.out.println("Nothing to redo");
    }
  }
}
