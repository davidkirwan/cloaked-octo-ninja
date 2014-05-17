package pattern.command;

public abstract class Command
{
  protected Receiver receiver;
  
  public Command()
  {}
  
  public Command(Receiver receiver)
  {
    this.receiver = receiver;
  }
  
  public abstract void doCommand(Object[] parameters) throws Exception;
  
  public void undoCommand() throws Exception
  {}
  public void redoCommand() throws Exception
  {}
  
  public Command copy()
  {
    return null;
  }
  
}
