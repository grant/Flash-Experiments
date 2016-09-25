public class Money {
    private static int amount = 0;
    public Money(int start) {
        amount = start;
    }
    public static void setAmount(int num) {
        amount = num;
    }
    public static int getAmount() {
        return amount;
    }
    public static void add(int num) {
        amount += num;
    }
    public static boolean subtract(int num) {
        boolean answer = false;
        if(!isNegative(amount-num)){
            answer = true;
            amount -= num;
        }
        return answer;
    }
    private static boolean isNegative(int num) {
        boolean answer = false;
        if(num < 0){
            answer = true;
        }
        return answer;
    }
}