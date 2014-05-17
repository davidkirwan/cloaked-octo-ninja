package pattern.command;

public class AddCommand extends Command
{
  private String value;
  
  public AddCommand(Receiver receiver)
  {
    super(receiver);
  }

  @Override
  public void doCommand(Object[] parameters)
  {
    this.setValue((String) parameters[0]);
    this.receiver.push(this.getValue());    
  }

  @Override
  public void undoCommand()
  {
    receiver.findAndRemove(this.getValue());
  }

  @Override
  public void redoCommand()
  {
    this.receiver.push(this.getValue());
  }
  
  @Override
  public Command copy()
  {
    AddCommand command = new AddCommand(receiver);
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
