/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import conexion.Conexion;
import entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn = new Conexion();

    public List imprimir() {
        Cliente usu = new Cliente();
        ArrayList<Cliente> list = new ArrayList<>();
        String sql = "select * from usuario";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                usu.setNombre(rs.getString("nombre"));
                usu.setCorreo(rs.getString("correo"));
                usu.setContraseña(rs.getString("contraseña"));
                list.add(usu);
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
            return null;
        }
        return list;
    }

    public boolean registrar(Cliente usu) {
        String sql = "insert into usuario values('" + usu.getNo_cuenta() + "','" + usu.getNombre() + "','" + usu.getCorreo() + "','" + usu.getContraseña() + "','" + usu.getSaldo() + "')";
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

    public Cliente login(String correo, String contraseña) {
        String sql = "Select * from usuario where nombre='" + correo + "';";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString("password").equalsIgnoreCase(contraseña) && rs.getString("password") != null) {
                    Cliente usu = new Cliente(
                            rs.getInt("nocuenta"),
                            rs.getString("nombre"),
                            rs.getString("correo"),
                            rs.getFloat("saldo")
                    );
                    return usu;
                }
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
            return null;
        }
        return null;
    }

    public int nocuenta() {
        int nocuenta = (int) (Math.random() * 999999 + 100000);
        String sql = "select * from usuario where nocuenta=" + nocuenta + "";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {

                if (rs.getInt("nocuenta") == nocuenta) {
                    nocuenta = (int) (Math.random() * 999999 + 100000);
                }
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
            return -1;
        }
        return nocuenta;
    }

    public float buscar(int nocuenta) {
        String sql = "select saldo from usuario where nocuenta=" + nocuenta + ";";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            return rs.getFloat("saldo");

        } catch (Exception e) {
            System.err.println("Error" + e);
            return -1;
        }
    }

    public boolean eliminar(int id) {
        String sql = "delete from usuario where nocuenta=" + id + ";";
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

    public boolean guardar_saldo(float saldo, int nocuenta) {
        String sql = "UPDATE usuario SET saldo = '" + saldo + "' WHERE nocuenta = " + nocuenta + ";";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
            return false;
        }
    }

    public boolean restar(int id, float resta) {
        String sql = "update usuario set saldo='" + resta + "' where nocuenta=" + id + ";";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
            return false;
        }
    }

    public Cliente buscar_o(int id) {
        Cliente cli;
        String sql = "select * from usuario where nocuenta=" + id + ";";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                cli = new Cliente(
                        rs.getInt("nocuenta"),
                        rs.getString("nombre"),
                        rs.getString("correo"),
                        rs.getString("password"),
                        rs.getFloat("saldo")
                );
                return cli;
            }

        } catch (Exception e) {
            System.err.println("Error" + e);
            return null;
        }
        return null;
    }
}
