import java.util.Random;
public class Card {
    private final String[] suitName = {"spade","heart","diamond","club"};
    private final String[] cardName = {"ace","two","three","four","five","six","seven","eight","nine","ten","jack","queen","king"};
    private final String[] cardInitial = {"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
    private final int[] cardValue = {1,2,3,4,5,6,7,8,9,10,10,10,10};//ace value can be 1 or 11
    private int value;
    private int id;
    private String name;
    private int type;
    private String suit;
    private int suitNum;
    private String initial;
    /**
     * Constructs card
     * @param the card id
     */
    public Card(int i) {
        id = i;
        setParams();
    }
    /**
     * Constructs random card
     * @param the type of card to create (only choice is random atm)
     */
    public void Card(String type) {
        if(type.equals("random")){
            Random r = new Random();
            id = r.nextInt(Deck.TOTAL_CARDS);
        }
        setParams();
    }
    /**
     * Sets the fields based on the id
     */
    private void setParams() {
        type = (int) Math.floor(id/Deck.SUITS);
        suitNum = id%Deck.SUITS;
        name = cardName[type];
        value = cardValue[type];
        suit = suitName[suitNum];
        initial = cardInitial[type];
    }
    /**
     * Gets the id
     */
    public int getId() {
        return id;
    }
    /**
     * Gets the suit
     */
    public String getSuit() {
        return suit;
    }
    /**
     * Gets the value
     */
    public int getValue() {
        return value;
    }
    /**
     * Gets the name
     */
    public String getName() {
        return name;
    }
    /**
     * Gets the value of the card based on the name
     * @param the name of the card (lowercase)
     */
    public int toValue(String name) {
        int value = -1;
        for(int a = 0;a<cardName.length;a++){
            if(cardName[a].equals(name)){
                value = cardValue[a];
            }
        }
        return value;
    }
    /**
     * The name of the card (based on the value). This doesn't work all the time becase of 10
     * @param the value of the card
     */
    public String toString(int value) {//does not work for all values (because of 10)
        String name = "";
        for(int a = 0;a<cardValue.length;a++){
            if(value == cardValue[a]){
                name = cardName[a];
            }
        }
        return name;
    }
    /**
     * Prints the card as a graphic
     */
    public void printGraphic() {
        String startInitial = initial;
        startInitial += (initial.length()==1)?" ":"";
        String endInitial = (initial.length()==1)?" "+initial:initial;
        
        System.out.println(" _________ ");
        System.out.println("/         \\");
        System.out.println("|"+startInitial+"       |");
        printSuit();
        System.out.println("|       "+endInitial+"|");
        System.out.println("\\_________/");
    }
    /**
     * Part of printing the card (don't use this ever alone)
     */
    private void printSuit() {
        switch(suitNum){
            case 0:
            System.out.println("|    ,    |");
            System.out.println("|   / \\   |");
            System.out.println("|  (_ _)  |");
            System.out.println("|   /_\\   |");
            System.out.println("|         |");
            break;
            case 1:
            System.out.println("|   _ _   |");
            System.out.println("|  / ^ \\  |");
            System.out.println("|  \\   /  |");
            System.out.println("|   \\ /   |");
            System.out.println("|    `    |");
            break;
            case 2:
            System.out.println("|    _    |");
            System.out.println("|   (_)   |");
            System.out.println("|  (_ _)  |");
            System.out.println("|   /_\\   |");
            System.out.println("|         |");
            break;
            case 3:
            System.out.println("|         |");
            System.out.println("|   / \\   |");
            System.out.println("|  <   >  |");
            System.out.println("|   \\ /   |");
            System.out.println("|         |");
            break;
        }
    }
}