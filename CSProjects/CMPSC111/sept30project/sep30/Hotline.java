//Project by Trent Dale and Braden Licastro
//09312010

public class Hotline
{

  //Initialize those variables
  private String repOne, repTwo, repThree, repFour;
  
  public Hotline()
  {
      //What are our responses?
    repOne = "Drink a 2 liter bottle of soda, swallow a pack of mentos, and stand on your head!";
    repTwo = "Do your best and perform a backflip.";
    repThree = "Try to crawl under a rock... you need to cool down a bit!";
    repFour = "Please try again later, I am too tired to think right now.";
  }

  public String getReply(String question)
  {
      //Choose a response based on the modulus of the total number of characters.
    if (question.length() % 5 == 0 || question.length() %5 == 1)
    {
      return repOne;
    }
    else if (question.length() % 5 == 2 || question.length() %5 == 3)
    {
      return repTwo;
    }
    else if (question.length()% 5 == 4)
    {
        return repFour;
    }
    else
    {
      return repThree;
    }
  }
}
