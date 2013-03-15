/**
 * @author Braden Licastro
 * PLEDGE: _____________________
 * CS380
 * Lab 5
 *
 * Description: Tweet class holds individual tweets information
 */
 
 
import java.util.Date;

public class Tweet {

    private Date currentDate;
    private String message;
    private static final int MAX_LENGTH = 140;

    public Tweet() {
		currentDate = new Date();
    }

	/*
     * Method isValidMessage checks whether a tweet is too long or not
     *
     * @param message Message to check.
     * @return Boolean value saying whether tweet is valid or not
     */
    public static boolean isValidMessage(String message) {
		if( message.length() <= MAX_LENGTH && message.length() > 0 ) {
			return true;
		}
		else {
			return false;
		}
    }

	/*
     * Method setMessage sets the tweets message
     *
     * @param message Message to set
     * @return No return value
     */
    public void setMessage(String message) {
		this.message = message;
    }    

	/*
     * Method getMessage gets the tweets message
     *
     * @return Returns the tweet message
     */
    public String getMessage() {
		return message;
    }

	/*
     * Method toString gets the tweets creation date and
     * the message it contains
     *
     * @return Returns the date of creation and tweets message
     */
    public String toString() {
		return "(" + currentDate.toString() + ", " + message + ")";
    }
}
