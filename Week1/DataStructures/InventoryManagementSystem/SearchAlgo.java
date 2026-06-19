package Week1.DataStructures.InventoryManagementSystem;

import java.util.Arrays;
import java.util.Comparator;

public class SearchAlgo {

    public static int linearSearch(Product[] products, String targetName) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].getProductName().equalsIgnoreCase(targetName)) {
                return i;
            }
        }
        return -1;
    }

    public static int binarySearch(Product[] sortedProducts, String targetName) {
        int low = 0;
        int high = sortedProducts.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;
            int cmp = sortedProducts[mid].getProductName().compareToIgnoreCase(targetName);

            if (cmp == 0) {
                return mid;
            } else if (cmp < 0) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Smartphone", "Electronics"),
                new Product(103, "Book", "Books"),
                new Product(104, "Headphones", "Electronics"),
                new Product(105, "Coffee Mug", "Kitchen")
        };

        String target = "Book";
        int linearIndex = linearSearch(products, target);
        if (linearIndex != -1) {
            System.out.println("Linear Search: Found " + products[linearIndex]);
        } else {
            System.out.println("Linear Search: Product not found");
        }

        Product[] sortedProducts = Arrays.copyOf(products, products.length);
        Arrays.sort(sortedProducts, Comparator.comparing(Product::getProductName, String.CASE_INSENSITIVE_ORDER));

        int binaryIndex = binarySearch(sortedProducts, target);
        if (binaryIndex != -1) {
            System.out.println("Binary Search: Found " + sortedProducts[binaryIndex]);
        } else {
            System.out.println("Binary Search: Product not found");
        }
    }
}