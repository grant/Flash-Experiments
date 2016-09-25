public class Blackjack {
    public static void main(String[] args) {
        greet();
        boolean again=false;
        User.setUser();
        Deck d = new Deck();
        do {
            //get bet
            //deal
            //players turn
            //analyze hands
            User.askForBet();
            User.askForHand();
            Dealer.askForHand();
            again = User.playAgain();
        } while(again);
        sayBye();
    }
    public static void greet() {
        System.out.println("Welcome to Blackjack!");
    }
    public static void sayBye() {
        System.out.println("Bye.");
    }
}