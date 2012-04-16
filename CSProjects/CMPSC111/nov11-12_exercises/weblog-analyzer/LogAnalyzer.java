/**
 * Read web server data and analyse
 * hourly access patterns.
 * 
 * @author Braden Licastro
 * @version 2010.11.12
 * 
 * 3) A. Top usage hours are: 10, 14, 18
 *    B. Lowest usage hours are: 4, 8, 9
 *    
 * Exercise 4.49:   If the code is executed an "Array Index Out of
 *                  Bounds Exception" will be thrown.
 * 
 */
public class LogAnalyzer
{
    // Where to calculate the hourly access counts.
    private int[] hourCounts;
    // Use a LogfileReader to access the data.
    private LogfileReader reader;

    /**
     * Create an object to analyze hourly web accesses.
     */
    public LogAnalyzer()
    { 
        // Create the array object to hold the hourly
        // access counts.
        hourCounts = new int[24];
        // Create the reader to obtain the data.
        reader = new LogfileReader();
    }

    /**
     * Analyze the hourly access data from the log file.
     */
    public void analyzeHourlyData()
    {
        while(reader.hasMoreEntries()) {
            LogEntry entry = reader.nextEntry();
            int hour = entry.getHour();
            /*
             * This statement takes the array "hourCounts[]" which is
             *currently being accessed at location "hour" and
             *adds one to the array location being accessed so
             *it steps through the array's contents.
             */
            hourCounts[hour]++;
        }
    }

    /**
     * Print the hourly counts.
     * These should have been set with a prior
     * call to analyzeHourlyData.
     */
    public void printHourlyCounts()
    {
        System.out.println("Hr: Count");
        /*
         * This is a for loop that uses the integer variable "hour"
         * to stap through and print the contents of the array.
         * "int hour = 0" creates and initializes the hour variable;
         * "hour < hourCounts.length" is our constraint and makes sure
         * that we dont look for an hour that doesnt exist in the
         * array; hour++ incriments the hour variable's value by one
         * to move through the array. The println statement then prints
         * out the current hour (array location relates to hours)
         * and then prints the number of website accesses for that
         * given hour. This process is continued until the condition
         * "hour < hourlyCount" is false.
         */

        /*  TODO: REPLACE WITH WHILE LOOP
         *  for(int hour = 0; hour < hourCounts.length; hour++) 
         *   {
         *      System.out.println(hour + ": " + hourCounts[hour]);
         */

        //Initialize a variable to track out location (hour) in the array.
        int hour = 0;

        //Set our condition so we can step through the array.
        while (hour < hourCounts.length)
        {
            //Print out the same contents as last time.
            System.out.println(hour + ": " + hourCounts[hour]);
            //Increment the hour variable by one so we can stap through the array's contents.
            hour++;
        }
    }

    /**
     * Print the lines of data read by the LogfileReader
     */
    public void printData()
    {
        reader.printData();
    }

    /**
     * Return the number of accesses recorded in the log
     * file.
     */
    public int numberOfAccesses()
    {
        int total = 0;
        //Add the value in each element of hourcounts to total.
        for(int hour = 0; hour < hourCounts.length; hour++) 
        {
            total += hourCounts[hour];

        }
        return total;
    }

    public int busyestHour()
    {
        int busyestHour = 0;
        int hourValue = 0;
        //Add the value in each element of hourcounts to total.
        for(int hour = 0; hour < hourCounts.length; hour++) 
        {
            if (hourCounts[hour] > hourValue)
            {
                busyestHour = hour;
                hourValue = hourCounts[hour];
            }
        }
        return busyestHour;
    }

    public int quietestHour()
    {
        int quietestHour = 0;
        int hourValue = 0;
        //Run through loop to set the upper bounds of the dataset so there isnta false return of lowest hour.
        for(int hour = 0; hour < hourCounts.length; hour++) 
        {
            if (hourCounts[hour] > hourValue)
            {
                hourValue = hourCounts[hour];
            }
        }

        //Run through loop to fing the lowest value based off of the highest alue found in the previous loop!
        for(int hour = 0; hour < hourCounts.length; hour++) 
        {
            if (hourCounts[hour] < hourValue)
            {
                quietestHour = hour;
                hourValue = hourCounts[hour];
            }
        }
        return quietestHour;
    }
}
