/**
 * Braden Licastro
 *
 * PLEDGE: _____________________
 * CS380
 * Lab 5
 */
 
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;
import twitter4j.conf.ConfigurationBuilder;
import twitter4j.conf.Configuration;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.FileOutputStream;

public final class TwitterCreateProperties {

    public static void main(String[] args) {
       
    	ConfigurationBuilder cb = new ConfigurationBuilder();
    	
    	// Sets up the client access keys
    	cb.setDebugEnabled(true)
	    .setOAuthConsumerKey("87phzuHwuARcCwAjgVUYww")
	    .setOAuthConsumerSecret("D9AAkdfQcWR04CuU4IL4s3tVLxiijsez276ldayTng");
  
        try {
            TwitterFactory tf = new TwitterFactory(cb.build());
            Twitter twitter = tf.getInstance();
            
            try {

                // Get request token.
                // This will throw IllegalStateException if access token is already available
                // This is oob, desktop client version
                RequestToken requestToken = twitter.getOAuthRequestToken(); 

				// Shows the user information about the token
				// that was provided by the Twitter API.
                System.out.println("Got request token.");
                System.out.println("Request token: " + requestToken.getToken());
                System.out.println("Request token secret: " + requestToken.getTokenSecret());

				// A token hasn't been completely set up, keep it null
                AccessToken accessToken = null;

				// A method of accepting input from the calls below
                BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
                
                while (null == accessToken) {
                	// Ask the user to go to the URL provided by the API
                    System.out.println("Open the following URL and grant access to your account:");
                    System.out.println(requestToken.getAuthorizationURL());
                    // Ask the user to enter the verification pin provided by the API at the link provided
                    System.out.print("Enter the PIN and hit enter after you granted access. [PIN]:");
                    String pin = br.readLine();
               
               		// Use the pin provided by the user and contact the API to ask for the token keys.
                    try {
                        if (pin.length() > 0) {
                            accessToken = twitter.getOAuthAccessToken(requestToken, pin);
                        } else {
                            accessToken = twitter.getOAuthAccessToken(requestToken);
                        }
                    // Catch any errors that could happen (ie, incorret pin, lost connection, etc.)
                    } catch (TwitterException te) {
                        if (401 == te.getStatusCode()) {
                            System.out.println("Unable to get the access token.");
                        } else {
                            te.printStackTrace();
                        }
                    }
                }
		
				// Produce useful debugging output for the access tokens
                System.out.println("Got access token.");
                System.out.println("Access token: " + accessToken.getToken());
                System.out.println("Access token secret: " + accessToken.getTokenSecret());

		try {
			// Write all of the above information to the properties file so we can use the applet.
		    System.out.println("Writing the properties file");
		    BufferedWriter out = new BufferedWriter(new FileWriter("twitter4j.properties"));
		    out.write("debug=true\n");
		    out.write("oauth.consumerKey=87phzuHwuARcCwAjgVUYww\n");
		    out.write("oauth.consumerSecret=D9AAkdfQcWR04CuU4IL4s3tVLxiijsez276ldayTng\n");
		    out.write("oauth.accessToken=" + accessToken.getToken() + "\n");
		    out.write("oauth.accessTokenSecret=" + accessToken.getTokenSecret() + "\n");
		    out.close();
		}

		catch (IOException e) {
		    e.printStackTrace();
		}
		
	    }

	    catch (IllegalStateException ie) {
                // Access token is already available, or consumer key/secret is not set.
                if (!twitter.getAuthorization().isEnabled()) {
                    System.out.println("OAuth consumer key/secret is not set.");
                    System.exit(-1);
                }
            }
        // Can't access servers so throw an exception
        } catch (TwitterException te) {
            te.printStackTrace();
            System.out.println("Failed to get timeline: " + te.getMessage());
            System.exit(-1);
        // Catch an error where we dont get expected data from server due to error etc.
        } catch (IOException ioe) {
            ioe.printStackTrace();
            System.out.println("Failed to read the system input.");
            System.exit(-1);
        }
    }
}
