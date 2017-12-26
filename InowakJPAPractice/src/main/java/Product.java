import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="PRODUCTS")
public class Product {
    @Id
    @GeneratedValue
    private int id;

    private String productName;
    private int unitsOnStock;

    @ManyToOne
    @JoinColumn(name = "CATEGORY_FK")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "SUPPLIER_FK")
    private Supplier supplier;

    @ManyToMany
    private Set<PurchaseOrder> orders = new HashSet<>();

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Product() {

    }
    public Product(String productName, int unitsOnStock) {
        this.productName = productName;
        this.unitsOnStock = unitsOnStock;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
        this.supplier.getProducts().add(this);//supplier.addProduct(this);
    }

    public void setCategory(Category category) {
        this.category = category;
        this.category.getProducts().add(this);
    }

    public int getUnitsOnStock() {
        return unitsOnStock;
    }
    public void setUnitsOnStock(int unitsOnStock) {
        this.unitsOnStock = unitsOnStock;
    }

    public void sell(PurchaseOrder order) {
        this.orders.add(order);
        //order.addProduct(this);
    }

    public Set<PurchaseOrder> getTransactions() {
        return orders;
    }

    public void setOrders(Set<PurchaseOrder> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", productName='" + productName + '\'' +
                ", unitsOnStock=" + unitsOnStock+')';
    }
}

