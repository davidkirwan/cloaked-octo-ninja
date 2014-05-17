package pattern.command;

import java.util.Stack;

public class UndoCommand extends Command
{
  private Stack<Command> undoBuffer;
  private Stack<Command> redoBuffer;

  public UndoCommand(Stack<Command> undoBuffer, Stack<Command> redoBuffer)
  {
    this.undoBuffer = undoBuffer;
    this.redoBuffer = redoBuffer;
  }

  public void doCommand(Object[] parameters) throws Exception
  {
    if (undoBuffer.size() > 0)
    {
      Command command = undoBuffer.pop();
      command.undoCommand();
      redoBuffer.push(command);
    }
  }

}