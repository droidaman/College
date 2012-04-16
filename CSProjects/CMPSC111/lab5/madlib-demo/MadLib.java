/**
 * Write a description of class MadLib here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

public class MadLib
{
    // put a comment here
    private Story story;

    /**
     * Constructor for objects of class MadLIb
     */
    public MadLib()
    {
        story = new Story("The ADJECTIVE ADJECTIVE NOUN VERBed over "
            + "the ADJECTIVE NOUN ADVERB");
    }

    /**
     * Replace the first occurrence of the given wordType by a word.
     *
     * @param   wordType    one of "NOUN", "VERB", "ADJECTIVE", or "ADVERB"
     * @param   word    any String (but should be of the appropriate type, e.g., noun, ...)
     */
    public void replaceWord(String wordType, String word) 
    {
        if (wordType.equals("NOUN"))
        {
            story.replaceNoun(word);
        }
        else
        {
            System.out.println("Sorry, can't handle word type \"" + wordType + "\"");
        }
    }

    /**
     * Display the story in the terminal window
     */
    public void printStory() 
    {
        System.out.println(story.getText());
    }
}