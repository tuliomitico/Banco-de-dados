/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bd1;
import java.sql.*;
import static java.lang.System.*;
import java.util.Scanner;
/**
 *
 * @author aluno
 */
public class Bd1 {

    /**
     * @param args the command line arguments
     */
    public Connection setConnection() throws SQLException{
    String host = "10.27.159.214:5432";
    String database = "bd_aula";
    String url ="jdbc:postgresql://" + host + "/" + database;
    String user = "aluno1";
    String password ="aluno1";
    Connection conexao = DriverManager.getConnection(url,user,password);
    out.println("Criou a conexao");
    return conexao;
    }
    
    
    
    
    public Bd1() {
        try{
        Class.forName("org.postgresql.Driver");
        out.println("Carregou");
        } catch (ClassNotFoundException ex){ex.printStackTrace();}
    }
    
     public void exemploConsultaStatment(Connection conexao) throws
    SQLException{
    Scanner scan = new Scanner(System.in);
    out.println("Digite a consulta:");
    
    String sql = scan.nextLine();
    //String sql = "Select cpf as c,departamento as depto, "
    //        + "regime_trabalho as r from universidade.professor";
    Statement comando = conexao.createStatement();
    Statement comando1 = conexao.createStatement();
    out.println("Executar consulta: " + sql);
    //ResultSet resultado1 = comando.executeQuery("set search_path to universidade");
    ResultSet resultado = comando.executeQuery(sql);
    ResultSetMetaData meta = resultado.getMetaData();
    out.println(meta.getColumnCount());
    for(int i= 1;i<=meta.getColumnCount();i++) {
        out.print(meta.getColumnName(i) +":"+ meta.getColumnTypeName(i)
        +"|");
    }
    while(resultado.next()){
        for(int i=1;i<meta.getColumnCount();i++) {
            out.print(resultado.getString(i)+"|");
        }
        out.println();
    }
    /*while(resultado.next()){
        String cpf = resultado.getString("cpf");
	String departamento = resultado.getString("departamento");
	int regime  =resultado.getInt("regime_trabalho");
	//String nome3 = resultado.getString(2);
	out.println(cpf + "\t" + departamento + "\t" + regime);
        //String cpf = resultado.getString("cpf");
        //String cpf2 = resultado.getString(1);
        //String cpf3;
        //String nome3 = resultado.getString(2);
        //out.println(cpf);
        }*/
    comando.close();
    }   
     
    public static void main(String[] args) {
        // TODO code application logic here
        Bd1 teste = new Bd1();
        Connection con;
        try {con=teste.setConnection();
             teste.exemploConsultaStatment(con);
        } catch (SQLException e){e.printStackTrace();}
        
    }

    
}
