  /**
   * Contains information for an electronic receipt of a purchased item.
   */
  public class Receipt
  {
      private String name;     // Name of the item purchased
      private String code;     // Code used for the inventory system
      private int price;       // Cost of one item
      private int quantity;    // Number of items purchased
      private int total;       // Total cost of items purchased

      /**
       * Constructor for objects of class Receipt. When invoked,
       * constructor must be told the item's name, code, and price.
       */
      public Receipt(String itemName, String itemCode, int itemPrice)
      {
          // initialise instance variables
          name = itemName;
          code = itemCode;
          price = itemPrice;
          quantity = 0;
          total = 0;
      }

      /**
       * Purchase some quantity of the item
       *
       * @param  qty  quantity purchased
       */
      public void purchase(int qty)
      {
          quantity = quantity + qty;
          total = quantity * price;
      }

      /**
       * Print out a receipt for the total amount purchased
       */
      public void printReceipt()
      {
          System.out.println("Item: " + name);
          System.out.println("Total received: " + total);
      }
  }