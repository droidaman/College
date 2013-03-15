/**
 * @author Braden Licastro
 *
 * PLEDGE: _____________________
 * CS380
 * Lab 5
 *
 * Description: TwitterClient class allows the user to choose an action
 *				from the menu and perform the chosen task.
 *
 * Use:	java TwitterClient
 *		(Follow menu prompts)
 */

import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;

import twitter4j.*;

public class TwitterClient {

    // Initialize a global scanner
    public Scanner sc = null;

    /*
     * Main method, initiates the main menu and calls classes from there
     */
    public static void main(String[] args) {
    	TwitterClient tc = new TwitterClient();
    	
		// Initialize a menu and run cycle marker
		int menu;
		boolean quit = false;
	
		do {
			// Gives the users a menu to choose a feature from.
		   	System.out.println("Please type a number choice from the menu below:");
		   	System.out.println("\t1. View Home Timeline");
		    System.out.println("\t2. Update status from \"Tweets.txt\" file");
		    System.out.println("\t3. Update status from \"Tweets.txt\" file and view Home Timeline");
		 	System.out.println("\t4. Generate and tweet course notification for CS380s2013");
		   	System.out.println("\t5. Quit");
		   	
		   	tc.sc = new Scanner(System.in);
		   	menu = tc.sc.nextInt();
		   	
		   	// Perform the given menu function.
		   	switch(menu) {
		   	    case 1:
		   	    	// View the home timeline
		   	        tc.viewHome();
		   	        break;
		   	    case 2:
		   	    	// Post a status
		   	        tc.postStatus();
		   	        break;
		   	    case 3:
		   	    	// Post a status the view home timeline
		   	        tc.postStatus();
		   	        tc.viewHome();
		   	        break;
		   	    case 4:
		   	    	// Send a message to the CS380 class
		   	        tc.courseMessage();
		   	        break;
		   	    case 5:
		   	    	// Exit *sadface*
		   	        quit = true;
		   	        break;
		   	    default:
		   	        System.out.println("Invalid menu option, please choose from the list below...\n");
		   	}
		} while(!quit);
		
		System.out.println("\nNow exiting :'(");
    }
    
    /*
     * Uses twitter API to get contents of the home imeline
     * and print it to the screen
     *
	 * @return No return value
     */
    public void viewHome(){
		// Display current Tweets in my stream of messages
		try {

			// Gets Twitter instance with default credentials
			Twitter twitter = new TwitterFactory().getInstance();
			User user = twitter.verifyCredentials();
			List<Status> statuses = twitter.getHomeTimeline();
			
			// Print out the home stream
			System.out.println("Showing @" + user.getScreenName() + "'s home timeline.\n");
			for(Status status : statuses) {
				System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
			}
			
			System.out.println("\n");
			
		} catch(TwitterException te) {
			te.printStackTrace();
			System.out.println("Failed to get timeline: " + te.getMessage() + "\n");
		}
    }

    /*
     * Method posts statuses from file to the authenticated twitter account
     *
     * @return No return value
     */
    public void postStatus(){
        // Store tweets without database until sent.
	    ArrayList<Tweet> validTweets = new ArrayList<Tweet>();
	    ArrayList invalidTweetMessages = new ArrayList<String>();

		// Read from file Tweets.txt
	    try {
			sc = new Scanner(new File("Tweets.txt"));
	    } catch(FileNotFoundException e) {
	        e.printStackTrace();
	    }

		// Read in, validate, and store tweets for later use
		while (sc.hasNextLine()) {
			String currentTweetMessage = sc.nextLine();
			if( Tweet.isValidMessage(currentTweetMessage) ) {
				Tweet currentTweet = new Tweet();
				currentTweet.setMessage(currentTweetMessage);
				validTweets.add(currentTweet);
			} else {
				invalidTweetMessages.add(currentTweetMessage);
			}
		}

		// Post the valid status updates
		for( Tweet currentTweet : validTweets ) {
			sendTweet(currentTweet);
		}
	}

    /*
     * courseMessage method allows the user to choose between three tweet styles,
     * namely an assignment reminder with due date and addignment name, a class
     * cancellation notification, or a user defined message, all of which hashtag
     * the #CS3804Life twitter.
     *
     * @return No return value
     */
    public void courseMessage(){
    	// String to be tweeted
    	String message = "";
    	String temp, temp2 = "";
    	
    	// Ask for and build tweet based on options.
    	System.out.println("\nI would like to send my class a[n]:\n\t1. assignment reminder\n\t2. cancellation notification\n\t3. personalized message");
    	sc = new Scanner(System.in);
		int menu = sc.nextInt();
		sc.nextLine(); // Consume trailing \n from nextInt
		   	
		// Perform the given menu function.
	   	switch(menu) {
	   	    case 1:
		   	    // Generate the tweet
	   	    	System.out.println("Tweet will look like \"Assignment Reminder: 'assignmentname' will be due on 'duedate'.");
				System.out.print("Type the assignment name: ");
				temp = sc.nextLine();
				message += "Assignment reminder: " + temp + " will be due on ";
				System.out.print("Type the assignment due date: ");
				temp = sc.nextLine();
				message += temp + ". #CS3804Life";
				
				//Post the status update
				sendTweet(stringToTweet(message));
	   	        break;
	   	    case 2:
	   	   		// Generate the tweet
				message = "Course Notification: The next CS380 class session has been cancelled. Enjoy your day! #CS3804Life";
				
				//Post the status update
				sendTweet(stringToTweet(message));
	   	        break;
	   	    case 3:
	   	    	// Generate the tweet
				System.out.println("Type the personalized message you would like to send:");
				message = sc.nextLine();
				message += " #CS3804Life";
				
				//Post the status update
				sendTweet(stringToTweet(message));
	   	        break;
	   	    default:
	   	        System.out.println("Invalid menu option.\n");
	   	}    
    }
    
    /*
     * Method stringToTweet accepts a string and converts it to type tweet
     *
     * @param currentTweetMessage The message to be converted to a string
     * @return Returns a tweet with the message set to currentTweetMessage
     */
    public Tweet stringToTweet(String currentTweetMessage) {
    	if(Tweet.isValidMessage(currentTweetMessage) ) {
			Tweet currentTweet = new Tweet();
			currentTweet.setMessage(currentTweetMessage);
			return currentTweet;
		} else {
			Tweet currentTweet = new Tweet();
			currentTweet.setMessage("INVALID - Tweet too long");
			return currentTweet;
		}
	}
	
	/*
     * Method sendTweet uses the twitter API to post the tweets
     *
     * @param tw Tweet to be posted
     * @return No return value
     */
    public void sendTweet(Tweet tw) {
		try{
		    // Gets Twitter instance with default credentials
			Twitter twitter = new TwitterFactory().getInstance();
		
			if(!tw.getMessage().contains("INVALID")){
				Status status = twitter.updateStatus(tw.getMessage());
				System.out.println("Successfully updated the status to [" + status.getText() + "].\n");
			} else {
				System.out.println("Failed to update the status. Reason: " + tw.getMessage() + ".\n");
			}
		} catch(TwitterException te) {
			te.printStackTrace();
			System.out.println("Failed to post tweet: " + te.getMessage() + "\n");
		}
    }
}
