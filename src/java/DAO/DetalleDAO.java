/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import conexion.Conexion;
import entidades.Cliente;
import entidades.Comidas;
import entidades.Detalle;
import entidades.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DetalleDAO {

    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn= new Conexion();
    
    
    public List visualizar_detalle(int no_cuenta){
    String sql="select * from detalle where id_p="+no_cuenta+";";
    Detalle det;
    ArrayList<Detalle> list=new ArrayList();
    try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                det=new Detalle(
                        rs.getInt("id_pro"),
                        rs.getInt("id_p"),
                        rs.getInt("cantidad")
                );
                list.add(det);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
            return null;
        }
        return list;
    }
   
    public boolean pedir(int id,int id_pedido, int cantidad)
    {
    String sql = "INSERT INTO detalle (id_p, cantidad, id_pro) VALUES ('"+id_pedido+"','"+cantidad+"','"+id+"')";
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
    
    public boolean eliminarDetalle(int id_pedido){
    String sql="delete from detalle where id_p="+id_pedido+";";
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
    public float buscar(int id_pedido)
    {
    float total=0;
    String sql="select * from pedido where id_p="+id_pedido+";";
    try{
    con=cn.getConnection();
    st=con.createStatement();
    rs=st.executeQuery(sql);
    while(rs.next()){
    return rs.getFloat("total");
    }
    }
    catch(Exception e){
            System.err.println("Error"+e);
            return -1;
        }  
    return total;
    }
}