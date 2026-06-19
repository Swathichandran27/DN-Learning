package Week1.DesignPriciples.FactoryMethodPattern;


public class PdfDocument implements Document {
    public void open() {
        System.out.println("Opening PDF Document");
    }
}

