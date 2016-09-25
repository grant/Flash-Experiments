import java.util.ArrayList;
public class Hand {
    private boolean hasAce = false;
    private int length = 0;
    private ArrayList<Card> cards = new ArrayList<Card>();
    public Hand() {
    }
    public void updateHasAce() {
        hasAce=false;
        for(Card c : cards){
            if(c.getValue()==1){
                hasAce=true;
            }
        }
    }
    public void getCard() {
        length++;
        cards.add(Deck.deal());
        //updateHasAce();
    }
    public void removeAll(){
        length = 0;
        cards.clear();
    }
    public int sumOfCards(){
        int sum = 0;
        for(Card c : cards){
            sum += c.getValue();
        }
        if(hasAce){
            if(sum<=21-10){
                sum+=10;
            }
        }
        return sum;
    }
    public ArrayList<Card> getCards(){
        return cards;
    }
    public void printHand() {
        System.out.println("Printing hand.");
        System.out.println(length);
        /*
        for(Card c : cards){
            c.printGraphic();
        }
        */
    }
}