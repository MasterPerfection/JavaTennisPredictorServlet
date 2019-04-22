package project1;
/*
 * Dr. Doderer's solution for Project #1
 * CSCI 3381
 * Spring 2019
 */

public class Tester {

	public static void main(String[] args) {
		Predictor myPred = new Predictor ("./project1/data.txt");	
		System.out.println("predictor after file read\n"+myPred);
		
		Day d1 = new Day("rainy", 75,90,true);
		System.out.println("prediction for "+d1+" is "+myPred.predict(d1)+"\n");
		Day d2 = new Day("rainy", 75,90,true,"no");
		myPred.addDay(d2);
		System.out.println("predictor after adding new day:");
		System.out.println(myPred);
		System.out.println("\nprediction for "+d1+" is "+myPred.predict(d1));
		
		myPred.writeFile("./project1/testFileWrite.txt");
		Predictor myPred2 = new Predictor ("./project1/testFileWrite.txt");	
		System.out.println("\npredictor after file writing\n"+myPred2);		
	}

}
