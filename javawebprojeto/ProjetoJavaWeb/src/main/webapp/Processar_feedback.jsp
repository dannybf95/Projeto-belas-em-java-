import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/seuservlet") // Mapeie este servlet para a URL desejada
public class SeuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        
        Connection conn = null;
        try {
            // Dados de conexão ao banco de dados (substitua com as informações do seu banco)
            String url = "jdbc:mysql://localhost/belas";
            String user = "root";
            String password = "";

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            // Verificar a conexão
            if (conn == null) {
                response.getWriter().println("Conexão falhou.");
                return;
            }

            // Obtendo os dados do formulário
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String comentario = request.getParameter("comentario");

            // Inserir os dados na tabela do banco de dados usando consulta preparada
            String sql = "INSERT INTO feedback (nome, email, comentario) VALUES (?, ?, ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, email);
            stmt.setString(3, comentario);

            if (stmt.executeUpdate() > 0) {
                // Redirecionar para feedback.html com a mensagem de sucesso na URL
                response.sendRedirect("feedback.html?status=Feedback enviado com sucesso!");
            } else {
                response.getWriter().println("Erro ao enviar o feedback.");
            }
        } catch (Exception e) {
            response.getWriter().println("Erro: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    response.getWriter().println("Erro ao fechar a conexão com o banco de dados: " + e.getMessage());
                }
            }
        }
    }
}
