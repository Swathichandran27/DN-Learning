package Week1.DesignPriciples.FactoryMethodPattern;


public class ExcelDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new ExcelDocument();
    }
}

