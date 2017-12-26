import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import static spark.Spark.get;


public class Main {

    private static final SessionFactory sessionFactory;

    static {
        get("/hello", (req,res) -> "Hello world");
        try {
            Configuration configuration = new Configuration();
            configuration.configure();

            sessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession() throws HibernateException {
        return sessionFactory.openSession();
    }


    public void addProduct(Product product) {
        sessionFactory.getCurrentSession().save(product);
    }

    public static void main(final String[] args) throws Exception {
        /*System.out.println("Give name of product");
        String name = System.console().readLine();

        System.out.println("Give units in stock of "+ name);
        int q = Integer.parseInt(System.console().readLine());
        */
        //Product product = session.get(Product.class, 113);
        //Supplier supplier = session.get(Supplier.class, 107);
        //supplier.addProduct(product);
        //session.save(supplier);

        /*Supplier supplier = new Supplier("Owocado", "Grudzińskiego 3","Krakow");
        Supplier supplier2 = new Supplier("Suszonad", "Na zjeździe 2","Krakow");
        Supplier supplier3 = new Supplier("Zielonek", "Powstańców Wielkopolskich 10","Krakow");
*/
        /*Product product = new Product("pomidory", 15);
        Product product2 = new Product("marchew", 20);
        Category category = new Category("warzywa");
        Category category2 = new Category("słodycze");
        */
        //Category c1 = session.get(Category.class, 116);

        final Session session = getSession();
        org.hibernate.Transaction tx = session.beginTransaction();

        /*Product p1 = session.get(Product.class, 110);
        Product p2 = session.get(Product.class, 105);
        Product p3 = session.get(Product.class, 111);

        HashSet<Product> products = new HashSet<>();
        products.add(p1);
        products.add(p2);
        products.add(p3);

        PurchaseOrder t = new PurchaseOrder(4, products);
        session.save(t);
        p1.sell(t);
        p2.sell(t);
        p3.sell(t);

        session.save(p1);
        session.save(p2);
        session.save(p3);
*/
        tx.commit();
        session.close();

        //session.save(supplier);
        //session.save(supplier2);
        //session.save(supplier3);

        //session.delete(supplier);
        //Supplier supplier = session.get(Supplier.class, 2);
        //supplier.addProduct();



        //product.setSupplier(supplier);
        //session.save(product);



    }
}
