
package WebBackend.WebBackend;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.CartDao;
import com.niit.dao.ProductDao;
import com.niit.model.Cart;
import com.niit.model.Product;

public class CartTetCase {

	
private static AnnotationConfigApplicationContext context;
	
	private static CartDao cartDao;
	
	private static ProductDao productDao;
	
	private Cart cart;
	
	@BeforeClass
	public static void init()
	{
		context=new AnnotationConfigApplicationContext();
		context.scan("com.niit.*");
		context.refresh();
		cartDao=(CartDao) context.getBean("cartDao");
		 productDao = (ProductDao) context.getBean("productDao");
	}
	
	/*@Ignore
	@Test
	public void addCart() {
		Cart cart=new Cart();
		cart.setId(1);
		cart.setOrderId(10);
		cart.setPrice(100);
		cart.setProductId(1);
		cart.setQuantity(10);
		cart.setUsername("ab@gmail.com");
		cartDao.addCart(cart);
	}*/
	
	
//	@Test
//	public void updateCart() {
//		Cart cart=new Cart();
//		cart.setId(1);
//		cart.setOrderId(10);
//		cart.setPrice(100);
//		cart.setProductId(14);
//		cart.setQuantity(1000);
//		cart.setUsername("ab@gmail.com");
//		cartDao.updateCart(cart);
//	}
//	
//	@Ignore
//	@Test
//	public void addCart() {
//		Cart cart=new Cart();
//		cart.setId(2);
//		cart.setOrderId(101);
	
//		cart.setPrice(100);
//		cart.setProductId(1);
//		cart.setQuantity(10);
//		cart.setUsername("abc@gmail.com");
//		cartDao.addCart(cart);
//	}
//	
//	@Ignore
//	@Test
//	public void getCart() {
//		Cart cart=new Cart();
//		cart.setId(2);
//		Cart cart1=cartDao.getSingleCartItem(cart.getId());
//		System.out.println(cart1.getUsername());
//	}
//	
//	
//	@Test
//	public void retrieveCart() {
//		
//		List<Cart> list=cartDao.listCart("ab@gmail.com");
//		for (Cart cart : list) {
//			System.out.println(cart.getId());
//		}
//	}
	@Ignore
	@Test
	public void deleteUserCart(){
		Cart cart=new Cart();
		cart.setUsername("ab@gmail.com");
		cartDao.deleteUserCart(cart.getUsername());
	}
	
	
}
