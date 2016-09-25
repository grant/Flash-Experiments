import java.util.Random;
public class Deck {
    private static int current = 0;
    public static final int TOTAL_CARDS = 52;
    public static final int SUITS = 4;
    public static final int TYPES = 13;
    private static Card order[] = new Card[TOTAL_CARDS];//if element == 0, then empty
    /**
     * Creates the deck
     */
    public Deck() {
        setDeck();
    }
    /**
     * Sets a new deck in normal order
     */
    public void setDeck() {
        for(int a=0;a<TOTAL_CARDS;a++){
            order[a] = new Card(a);
        }
    }
    public static Card deal() {
        Card c = order[current];
        current++;
        return c;
    }
    public void reset() {
        shuffle();
        current = 0;
    }
    /**
     * Shuffles the cards in a complete random order.
     * Method:
     * 1. Creates a copy of the current card order
     * 2. Creates an array of used positions of the order
     * 3. Starts at the first card and picks a random number
     * 4. If the random number is an index number that is not already used, then the card is placed in that position.
     * 5. Else the random number is generated again
     * Inner loop is an average of 1352 times (not super efficent, but 100% random and no magic numbers).
     * 1352 = (52/2)*52
     * A better way would be to use array lists and have one of those for the random used array
     */
    public void shuffle() {
        Card orderCopy[] = new Card[TOTAL_CARDS];
        System.arraycopy(order,0,orderCopy,0,order.length);
        
        int[] random = new int[order.length];
        for(int a = 0;a<random.length;a++){
            random[a] = a;
        }
        Random r = new Random();
        for(int b = 0;b<order.length;b++){
            int index = -1;
            while(index==-1){
                index = r.nextInt(order.length);
                if(random[index]==-1){
                    index=-1;
                }
            }
            order[b] = orderCopy[random[index]];
            random[index] = -1;
        }
    }
    /**
     * Prints a simple list of the card position and id
     */
    public void printCards() {
        for(int a = 0;a<order.length;a++){
            System.out.println(a+": "+order[a].getId());
        }
    }
    /**
     * Gets a card
     */
    public Card getCard(int numCard) {
        return order[numCard];
    }
    /**
     * Prints a card's data
     * @param the card position in the order
     */
    public void printCardData(int numCard) {
        Card c = order[numCard];
        System.out.println("-------");
        System.out.println("Id: "+c.getId());
        System.out.println("Value: "+c.getValue());
        System.out.println("Name: "+c.getName());
        System.out.println("Suit: "+c.getSuit());
        System.out.println("-------");
    }
    /**
     * Prints all cards' data
     */
    public void printAllCards() {
        for(int a=0;a<order.length;a++){
            printCardData(a);
        }
    }
    /**
     * Prints all cards as graphics
     */
    public void printAllCardsAsGraphics() {
        for(int a=0;a<order.length;a++){
            order[a].printGraphic();
            System.out.println("");
        }
    }
    /**
     * Prints a card as a graphic
     * @param the card position in the order
     */
    public void printCardAsGraphic(int numCard) {
        order[numCard].printGraphic();
    }
}