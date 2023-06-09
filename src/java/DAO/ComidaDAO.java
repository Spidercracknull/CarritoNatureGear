/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import conexion.Conexion;
import entidades.Comidas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class ComidaDAO {
    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn= new Conexion();
    
    public List imprimir(){
    ArrayList<Comidas> list= new ArrayList<>();
        String sql="select * from productos where stock>0;";
        try {
            Comidas com;

            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                com=new Comidas(
                rs.getInt("id"),
                rs.getString("nombre"),
                rs.getString("descripcion"),
                rs.getFloat("precio"),
                rs.getInt("stock"),
                rs.getString("imagen")
                );
                list.add(com);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        return list;
    }
    
    
    
    public boolean insertar(Comidas com)
    {    
    String sql="insert into productos values('"+com.getId()+"','"+com.getNombre()+"','"+com.getDescripcion()+"',"+com.getPrecio()+","+com.getEstado()+",'"+com.getImg()+"')";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        return true;
        }catch(Exception e){
            System.err.println("Error"+e);
            return false;
        }       
    }
    public boolean eliminar (int id){
    String sql="delete from productos where id="+id+";";
        try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }   
    return false;
    }

    public boolean cambiar_stock(int estado, int id){
        String sql="  UPDATE productos SET stock = '"+estado+"' WHERE id = "+id+";";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error "+e);
            return false;
        }
    return true;    
    }
    public String buscar_por_id(int id){
        String sql="Select nombre from productos where id='"+id+"';";
        try{
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            if(rs.next()){
                if(rs.getString("nombre")!=null ){
                    return rs.getString("nombre");
                }
            }
        }
        catch(Exception e)
        {
            System.out.println("Error: "+e);
            return null;
        }
    return "ho";
    }
    
    public Comidas buscarss(int id){
    String sql="Select * from productos where id='"+id+"';";
    try{
        con=cn.getConnection();
        st=con.createStatement();
        rs=st.executeQuery(sql);
        if(rs.next()){
        if(rs.getString("nombre")!=null){
            Comidas com=new Comidas(
            rs.getInt("id"),
            rs.getString("nombre"),
            rs.getString("descripcion"),
            rs.getFloat("precio"),
            rs.getInt("stock"),
            rs.getString("imagen")
            );
            return com; 
        }
        }
    }
    catch(Exception e)
    {
        System.out.println("Error: "+e);
        return null;
    }
    return null;
    }
    public int id(){
    int no_cuenta=0;
    String sql="select id from productos";
        try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                
             if(rs.getInt("id")>=no_cuenta){
             no_cuenta=rs.getInt("id");
             }
            }
     } catch (Exception e) {
            System.err.println("Error"+e);
            return -1;
        }
    return no_cuenta+1;
    }
    public int buscarStock(int id){
    String sql="select stock from productos where id="+id+"";
    try{
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            if(rs.next()){
                if(rs.getString("stock")!=null ){
                    return rs.getInt("stock");
                }
            }
        }
        catch(Exception e)
        {
            System.out.println("Error: "+e);
            return -1;
        }
    return -1;
    }
}


