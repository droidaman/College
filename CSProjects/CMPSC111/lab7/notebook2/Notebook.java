import java.util.ArrayList;
import java.util.Iterator;

/**
 * A class to maintain an arbitrarily long list of notes.
 * Notes are numbered for external reference by a human user.
 * In this version, note numbers start at 0.
 * 
 * @author Braden Licastro
 * @version 2010.11.01
 */
public class Notebook
{
    // Storage for an arbitrary number of notes.
    private ArrayList<String> notes;

    /**
     * Perform any initialization that is required for the
     * notebook.
     */
    public Notebook()
    {
        notes = new ArrayList<String>();
    }

    /**
     * Store a new note into the notebook.
     * @param note The note to be stored.
     */
    public void storeNote(String note)
    {
        //Initialize some variables for use.
        int location = 0;
        boolean found = false;

        //Create the iterator
        Iterator<String> anIt = notes.iterator();

        //While loop to runthrough the list.
        while(anIt.hasNext() && !found)
        {
            //Store the item in the arraylists current location to be used.
            String tempStore = anIt.next();

            //Check what position we should place the note in.
            if (tempStore.compareTo(note) < 0)
            {
                //If it doesnt belong there add one to location.
                location++;
            }
            else
            {
                //Set found to true if it fits there and break outof the while loop.
                found = true;
            }
        }
        //Add the note to the specified location! YAY!!!!
        notes.add(location, note);
    }

    /**
     * @return The number of notes currently in the notebook.
     */
    public int numberOfNotes()
    {
        return notes.size();
    }

    /**
     * Remove a note from the notebook if it exists.
     * @param noteNumber The number of the note to be removed.
     */
    public void removeNote(int noteNumber)
    {
        if(noteNumber < 0) {
            // This is not a valid note number, so do nothing.
        }
        else if(noteNumber < numberOfNotes()) {
            // This is a valid note number.
            notes.remove(noteNumber);
        }
        else {
            // This is not a valid note number, so do nothing.
        }
    }

    /**
     * List all notes in the notebook.
     */
    public void listNotes()
    {
        for(String note : notes) {
            System.out.println(note);
        }
    }
}
