package Week1.DesignPriciples.FactoryMethodPattern;



public class WordDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new WordDocument();
    }
}

