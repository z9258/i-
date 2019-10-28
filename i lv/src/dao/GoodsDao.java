package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.GoodsBean;

public class GoodsDao {
	public ArrayList<GoodsBean> getAllGoods(){
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
			
			String sql = "select * from goods;";//查询sql语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			 
			while(rs.next()){
				GoodsBean goods = new GoodsBean();
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
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
	//根据商品编号获取商品
	public GoodsBean getGoodsById(int id){
		Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/goods?useSSL=false&serverTimezone=UTC";
			String userName = "root";
			String passWord = "zc971126";
			conn = DriverManager.getConnection(url,userName,passWord);//连接数据库
			
			String sql = "select * from goods where goods_id=?;";//查询sql语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,id);
			rs = stmt.executeQuery();
			 
			if(rs.next()){
				GoodsBean goods = new GoodsBean();
				goods.setGoods_id(rs.getInt("goods_id"));
				goods.setGoods_name(rs.getString("goods_name"));
				goods.setGoods_type(rs.getString("goods_type"));
				goods.setGoods_intro(rs.getString("goods_intro"));
				goods.setGoods_img(rs.getString("goods_img"));
				goods.setGoods_food(rs.getString("goods_food"));
				goods.setGoods_price(rs.getDouble("goods_price"));
				goods.setGoods_stuPrice(rs.getDouble("goods_stuPrice"));
				goods.setGoods_chPrice(rs.getDouble("goods_chPrice"));
				return goods;
			}
			else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
	
	
}
