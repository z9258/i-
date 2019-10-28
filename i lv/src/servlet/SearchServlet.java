package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.GoodsBean;

/**
 * Servlet implementation class SearchSevlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");//设置编码格式
		
		PrintWriter pw = response.getWriter();//定义输出流写数据
		String name = request.getParameter("search");//获取输入框的值
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<GoodsBean> list = new ArrayList<GoodsBean>();//景区集合
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/goods?useSSL=false&serverTimezone=UTC";
			String userName = "root";
			String passWord = "zc971126";
			conn = DriverManager.getConnection(url,userName,passWord);//连接数据库
			GoodsBean goods = null;
			String sql = "select * from goods where goods_name like ?;";//查询sql语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,"%" +name+ "%");
			rs = stmt.executeQuery();
			while(rs.next()){
				goods = new GoodsBean();
				goods.setGoods_id(rs.getInt("goods_id"));
				goods.setGoods_name(rs.getString("goods_name"));
				goods.setGoods_type(rs.getString("goods_type"));
				goods.setGoods_intro(rs.getString("goods_intro"));
				goods.setGoods_img(rs.getString("goods_img"));
				goods.setGoods_food(rs.getString("goods_food"));
				goods.setGoods_price(rs.getDouble("goods_price"));
				goods.setGoods_stuPrice(rs.getDouble("goods_stuPrice"));
				goods.setGoods_chPrice(rs.getDouble("goods_chPrice"));
				list.add(goods);
			}
			
			//conn.close();
			if(name != null && name.length() >0){
				request.setAttribute("goods", list);
				//记得request.setAttribute("goods", list);后面参数未需要传送的集合
//				response.sendRedirect("search-info.jsp");
				request.getRequestDispatcher("search-info.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			if(rs != null){
				try{
                    rs.close();
                    rs = null;
                }catch(Exception e){
                    e.printStackTrace();
                }
				
			}
			
			if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
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
