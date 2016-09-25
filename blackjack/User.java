import java.util.Scanner;
public class User {
    private final static int startMoney = 1000;
    private static Hand hand;
    private static int bet = 0;
    public static void setUser() {
        Money.setAmount(startMoney);
        hand = new Hand();    
    }
    public static void askForHand() {
        boolean done = false;
        hand.getCard();
        hand.getCard();
        hand.printHand();
        while(!done){
            done = true;
        }
    }
    public static void askForBet() {
        printAmount();
        System.out.println("How much money do you want to bet?");
        Scanner s = new Scanner(System.in);
        int input = s.nextInt();
        boolean okay = Money.subtract(input);
        while(!okay){
            System.out.println("Please place a valid bet.");
            input = s.nextInt();
            okay = Money.subtract(input);
        }
        printAmount();
    }
    public static boolean playAgain() {
        boolean answer = false;
        System.out.println("Do you want to play again?");
        Scanner s = new Scanner(System.in);
        String type = s.next();
        if(type.equalsIgnoreCase("y")||type.equalsIgnoreCase("yes")){
            answer = true;
        }
        return answer;
    }
    private static void printAmount() {
        System.out.println("Your current amount it: $"+Money.getAmount());
    }
}