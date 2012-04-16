//Project by Trent Dale and Braden Licastro
//09312010

public class Caller
{
//Once again, lets initialize that variable!
  private Hotline theWiseOne;

  public Caller(Hotline h)
  {
      //Sets the location of the response mechanism.
    theWiseOne = h;
  }

  public void ask(String question)
  {
      //Takes the reply in as a string and sends it to the server for a response.
    String reply;
    reply = theWiseOne.getReply(question); 
    
    //Output: Response and question get printed to the terminal window.
    System.out.println("Troubled caller asks: " + question);
    System.out.println("Hotline representative replies: " + reply);
  }
}
