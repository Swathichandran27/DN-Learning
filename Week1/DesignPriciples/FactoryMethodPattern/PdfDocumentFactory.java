package Week1.DesignPriciples.FactoryMethodPattern;


public class PdfDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new PdfDocument();
    }
}

