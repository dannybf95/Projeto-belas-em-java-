import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/seuservlet") // Mapeie este servlet para a URL desejada
public class SeuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        try {
            // Conexão com o banco de dados (substitua com as informações do seu banco)
            String url = "jdbc:mysql://localhost/belas";
            String user = "root";
            String password = "";

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            // Verifique a conexão
            if (conn == null) {
                out.println("Erro na conexão.");
                return;
            }

            // Consulta os dados do banco de dados
            String sql = "SELECT nome, email, comentario FROM feedback";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            out.println("<h3>Feedbacks recebidos:</h3>");
            out.println("<table>");
            out.println("<tr><th>Nome</th><th>Email</th><th>Comentário</th></tr>");

            while (rs.next()) {
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String comentario = rs.getString("comentario");
                out.println("<tr><td>" + nome + "</td><td>" + email + "</td><td>" + comentario + "</td></tr>");
            }

            out.println("</table>");
        } catch (Exception e) {
            out.println("Erro: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.println("Erro ao fechar a conexão com o banco de dados: " + e.getMessage());
                }
            }
        }
    }
}


