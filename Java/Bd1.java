package bd1;
import java.sql.*;
import static java.lang.System.*;

public class Bd1{
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
    //carregar driver JDBC do postgres
    Class.forName("org.postgresql.Driver");
    out.println("Carregou");
    } catch (ClassNotFOundException ex){ex.printStackTrace();}
  }
   public void exemploConsultaStatment(Connection conexao) throws
    SQLException{
    String sql = "Select cpf from universidade.professor where departamento = 'DCOMP'";
    Statement comando = conexao.createStatement();
    out.println("Executar consulta: " + sql);
    ResultSet resultado = comando.executeQuery(sql);
    while(resultado.next()){
        String cpf = resultado.getString("cpf");
        String cpf2 = resultado.getString(1);
        //String nome3 = resultado.getString(2);
        out.println(cpf);
        }
    comando.close();
    }   
  
  public static void main(String[] args) {
        // TODO code application logic here
        Bd1 teste = new Bd1();
        try {teste.setConnection();
             teste.exemploConsultaStatment();
        } catch (SQLException e){e.printStackTrace();}
        
    }
}
