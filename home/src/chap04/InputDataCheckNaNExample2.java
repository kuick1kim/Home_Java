package chap04;

public class InputDataCheckNaNExample2 {

		public static void main(String[] args) {
			// TODO Auto-generated method stub
			String userInput = "NaN";
			double val = Double.valueOf(userInput);
			
			double currentBalance = 10000.0;
			
			if(Double.isNaN(val)) {
				System.out.println("난이 입력되어 처리할 수 없음");
				val = 2.03;
			}
			
			currentBalance += val; // 10000 + NaN
			
			System.out.println(currentBalance);

		}

	}
