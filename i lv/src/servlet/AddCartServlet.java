package servlet;

import java.awt.print.Book;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.GoodsBean;

import dao.GoodsDao;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		//验证用户是否登录
		String u = request.getParameter("username");
		request.getSession().setAttribute("username", u);
		if(u != null){
			//获取到商品的id
			String goods_id = request.getParameter("goods_id");
			//通过调用方法得到商品对象的信息
			GoodsDao goodsdao = new GoodsDao();
			GoodsBean goods = goodsdao.getGoodsById(Integer.valueOf(request.getParameter(goods_id)));
			//从Session中获取购物车对象
			HttpSession session = request.getSession();
			Map<GoodsBean,Integer> cart = (Map<GoodsBean,Integer>)session.getAttribute("cart");
			//判断购物车里是否为空
			if(cart == null){
				//若为空。则创建购物车
				cart = new HashMap<GoodsBean, Integer>();
			}
			//向购物车添加商品数量信息
			Integer count = cart.put(goods, 1);
			//如果商品数量不为空，则商品数量+1，否则添加新的商品信息
			if(count != null) {
				cart.put(goods, count + 1);
			}  
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		else{
			response.sendRedirect("login.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
