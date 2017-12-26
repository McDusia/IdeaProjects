import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Supplier {

    @Id
    @GeneratedValue
    private int id;
    private String companyName;
    private String street;
    private String city;

    @OneToMany
    @JoinColumn(name = "SUPPLIER_FK")
    private Set<Product> products = new HashSet<>();

    public Supplier(String companyName, String street, String city) {
        this.street = street;
        this.city = city;
        this.companyName = companyName;
    }

    public Supplier() {}

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getSupplierName() {
        return companyName;
    }

    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void addProduct(Product p) {
        this.products.add(p);
        p.setSupplier(this);
    }


}