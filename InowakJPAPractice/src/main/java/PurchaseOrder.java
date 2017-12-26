import com.sun.istack.internal.Nullable;

import javax.persistence.*;
import java.util.Set;

@Entity
public class PurchaseOrder {

    @Id
    @GeneratedValue
    private int id;

    @Column(nullable = true)
    private int quantity;

    @ManyToMany //(mappedBy = "orders")
    private Set<Product> products;/// = new HashSet<>();

    public PurchaseOrder(int quantity, Set<Product> p) {
        this.quantity = quantity;
        this.products = p;
    }

    public PurchaseOrder() {
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public Set<Product> getProductSet() {
        return products;
    }

    public void setProductSet(Set<Product> productSet) {
        this.products = productSet;
    }

/*public void addProduct(Product product) {
    this.products.add(product);
    product.sell(this);
}*/

}
