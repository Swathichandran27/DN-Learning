package Week1.DataStructures.FinancialForecast;

public class FinancialForecastTest {
     public static double calculateFutureValue(double presentValue, double growthRate, int periods) {
        if (periods == 0) {
            return presentValue;
        }
        return calculateFutureValue(presentValue, growthRate, periods - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {
        double currentValue = 1000.0;
        double growthRate = 0.05;
        int forecastPeriods = 3;

        double futureValue = calculateFutureValue(currentValue, growthRate, forecastPeriods);
        System.out.printf("The forecasted value after %d periods is: %.2f%n", forecastPeriods, futureValue);
    }
}
