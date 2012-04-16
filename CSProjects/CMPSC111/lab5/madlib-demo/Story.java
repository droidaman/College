/**
 * This is the story class of the madlibs .
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

public class Story
{
    // Describe instance variable
    private String text;

    /**
     * Constructor for objects of class Story
     * 
     * @param   s   A story involving NOUNs, VERBs, ADJECTIVEs, and ADVERBs
     */
    public Story(String s)
    {
        // initialise instance variables
        text = s;
    }
    
    /**
     * Locate the first occurrence of the string "NOUN" in story, replace it with the string noun
     * 
     * @param   noun    the word to use in place of "NOUN"
     */
   public void replaceNoun(String noun) 
   {
     int nounLoc = text.indexOf("NOUN");
     if (nounLoc >= 0)
     {
       text = text.substring(0,nounLoc) + noun + text.substring(nounLoc+4);
     }
     else
     {
       System.out.println("Sorry, no NOUNs in text.");
     }
   }

   /**
    * Returns the current text of the story (possibly modified from the original)
    * 
    * @return   the current story text
    */
    public String getText() 
    {
      return text;
    }
}
