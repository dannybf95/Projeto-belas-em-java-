import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SeuServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        Connection conexao = null;
        try {
            // Conectando ao banco de dados (substitua com as informações do seu banco)
            String url = "jdbc:mysql://127.0.0.1/belas";
            String user = "root";
            String password = "";

            conexao = DriverManager.getConnection(url, user, password);

            // Verificar a conexão
            if (conexao == null) {
                response.getWriter().write("Erro na conexão.");
                return;
            }

            // Obtendo os dados do formulário
            String email = request.getParameter("Email");
            String usuario = request.getParameter("Usuario");
            String senha = request.getParameter("Senha");

            // Consulta os dados do banco de dados
            String sql = "SELECT Email FROM login_table";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String existingEmail = rs.getString("Email");
                if (email.equals(existingEmail)) {
                    response.getWriter().write("E-mail já cadastrado!");
                    response.setHeader("Refresh", "3;url=/EspacoBelas/EspacoBelas/formulario.jsp");
                    return;
                }
            }

            // Inserir dados na tabela
            sql = "INSERT INTO login_table (Usuario, Email, Senha) VALUES (?, ?, ?)";
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, usuario);
            stmt.setString(2, email);
            stmt.setString(3, senha);
            stmt.executeUpdate();

            // Redirecionar para a página de sucesso
            response.sendRedirect("/EspacoBelas/belasphp/login/actionCadastrar.jsp?usuario=" + usuario + "&Email=" + email + "&Senha=" + senha);
        } catch (Exception e) {
            response.getWriter().write("Erro: " + e.getMessage());
        } finally {
            if (conexao != null) {
                try {
                    conexao.close();
                } catch (SQLException e) {
                    response.getWriter().write("Erro ao fechar a conexão com o banco de dados: " + e.getMessage());
                }
            }
        }
    }
}
