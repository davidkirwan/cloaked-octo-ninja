package pattern.command;

public class DeleteCommand extends Command
{
  private String value;
  
  public DeleteCommand(Receiver receiver)
  {
    super(receiver);
  }

  @Override
  public void doCommand(Object[] parameters)
  {
    this.setValue((String) parameters[0]);
    this.receiver.findAndRemove(this.getValue());
  }

  @Override
  public void undoCommand()
  {
    this.receiver.push(this.getValue());
  }

  @Override
  public void redoCommand()
  {
    this.receiver.findAndRemove(this.getValue());
  }
  
  @Override
  public Command copy()
  {
    DeleteCommand command = new DeleteCommand(receiver);
    command.setValue(value);
    
    return command;
  }

  public String getValue()
  {
    return value;
  }

  public void setValue(String value)
  {
    this.value = value;
  }

}
