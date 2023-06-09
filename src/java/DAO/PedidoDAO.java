/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import conexion.Conexion;
import entidades.Comidas;
import entidades.Pedido;
import entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {

    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn = new Conexion();

    public List visSaldo() {
        String sql = "select * from pedido where estado='saldo'";
        Pedido ped;
        ArrayList<Pedido> list = new ArrayList();
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                ped = new Pedido(
                        rs.getInt("id_p"),
                        rs.getInt("usu"),
                        rs.getFloat("total"),
                        rs.getString("fecha")
                );
                list.add(ped);
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
            return null;
        }
        return list;
    }

    public boolean cambiar_stock(String estado, int id, Cliente usu) {
        String sql = "  UPDATE pedido SET estado = '" + estado + "' WHERE id_p = " + id + ";";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error " + e);
            return false;
        }
    }

    public boolean cambiar_stockC(String estado, int id) {
        String sql = "  UPDATE pedido SET estado = '" + estado + "' WHERE id_p = " + id + ";";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error " + e);
            return false;
        }
    }

    public int id() {
        int usu = 0;
        String sql = "select id_p from pedido";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {

                if (rs.getInt("id_p") >= usu) {
                    usu = rs.getInt("id_p");
                }
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
            return -1;
        }
        return usu + 1;
    }

    public boolean pedir(Cliente usu, String fecha, int id, float total) {
        String sql = "insert into pedido values(" + id + ",'" + usu.getNo_cuenta() + "','" + total + "','" + fecha + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error" + e);
            return false;
        }

        return true;
    }

    public boolean eliminarPedido(int id_p) {
        String sql = "delete from pedido where id_p=" + id_p + ";";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error" + e);
            return false;
        }
        return true;
    }

    public float buscarSaldo(int id) {
        String sql = "select * from pedido where id_p=" + id + ";";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                return rs.getFloat("total");
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
            return -1;

        }
        return -1;
    }

    public String buscrHora(int id) {
        String sql = "Select * from pedido where id_p='" + id + "';";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                return rs.getString("hora");
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
            return null;
        }
        return null;
    }

    public boolean act(int id, String usu, String pas) {
        String sql = "update usuario set nombre='" + usu + "', password='" + pas + "' where nocuenta=" + id + "";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error" + e);
            return false;
        }
    }

    public boolean consultar(double codigo) {
        String sql = "select * from codigo where codigo=" + codigo + ";";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                if (rs.getInt("codigo") == codigo) {
                    return true;
                }
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
            return false;
        }
        return false;
    }
    public List visualizar_pedidos_vista_cliente(int no_cuenta) {
        String sql = "select * from pedido where usu=" + no_cuenta + ";";
        Pedido ped;
        ArrayList<Pedido> list = new ArrayList();
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                ped= new Pedido(
                        rs.getInt("id_p"),
                        rs.getInt("usu"),
                        rs.getFloat("total"),
                        rs.getString("fecha")
                );

                list.add(ped);
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
            return null;
        }
        return list;
    }
}
