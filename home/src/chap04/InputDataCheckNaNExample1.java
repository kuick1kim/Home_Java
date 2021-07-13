package chap04;

public class InputDataCheckNaNExample1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String userInput = "NaN";
		double val = Double.valueOf(userInput);
		
		double currentBalance = 10000.0;
				
		currentBalance += val; // 10000 + NaN
		
		System.out.println(currentBalance);

	}

}
