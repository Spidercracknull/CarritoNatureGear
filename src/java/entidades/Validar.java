/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import DAO.PedidoDAO;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 *
 * @author artem
 */
public class Validar {

    int me = -1;
    float men = -1;

    public int valCant(String num) {
        try {
            int numV = Integer.parseInt(num);
            if (numV > 0 && numV <= 5) {
                return numV;
            } else {
                System.out.println("fa");
                return me;

            }
        } catch (Exception e) {
            System.out.println("fañ");
            return me;
        }

    }
    public double validarC(String num){
    try {
            double numV = Double.parseDouble(num);
            if (numV > 0 && num.length()==6) {
                return numV;
            } else {
                System.out.println("da");
                return me;
            }
        } catch (Exception e) {
            System.out.println("sa ac");
            return me;
        }
    
    }
    public int validaRnUM(String num) {
        try {
            int numV = Integer.parseInt(num);
            if (numV > 0) {
                return numV;
            } else {
                System.out.println("da");
                return me;
            }
        } catch (Exception e) {
            System.out.println("sa ac");
            return me;
        }
    }

    public int validarCuenta(String num) {
        try {
            int longitud = num.length();
            int cuenta = Integer.parseInt(num);
            if (longitud == 6) {
                return cuenta;
            } else {
                System.out.println("32");
                return me;
            }
        } catch (Exception e) {
            System.out.println("sda");
            return me;
        }

    }

    public String validarS(String str) {
        try {
            String expresionRegular = "[<>;\"']|\\u0020";
            Pattern pattern = Pattern.compile(expresionRegular);
            Matcher matcher = pattern.matcher(str);
            if (matcher.find()) {
                System.out.println("fkjañl");
                return null;
            } else {
                return str;
            }
        } catch (Exception e) {
            return null;
        }
    }

    public String validarCorreo(String str) {
        try {

            String expresionRegular = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}";
            Pattern pattern = Pattern.compile(expresionRegular);
            Matcher matcher = pattern.matcher(str);
            if (matcher.find()) {
                return str;
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;

        }
    }

    public float validarSaldo(String saldo) {
        try {
            float sal = Float.parseFloat(saldo);
            if (sal > 0) {
                return sal;
            } else {
                System.out.println("e3");
                return men;
            }
        } catch (Exception e) {
            System.out.println("23");
            return men;
        }
    }

    public boolean validarFecha(int id) {
        try {
            PedidoDAO ped = new PedidoDAO();
            String hora = ped.buscrHora(id);
            LocalTime horaActual = LocalTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
            LocalTime horaBuscadaObj = LocalTime.parse(hora, formatter);
            if (horaActual.isAfter(horaBuscadaObj.plusMinutes(5))) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}
