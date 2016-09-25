public class TempTest {
    public static void main(String[] args){
        Deck d = new Deck();
        d.printAllCards();
        d.printAllCardsAsGraphics();
        d.shuffle();
        d.printAllCards();
        d.printAllCardsAsGraphics();
    }
}