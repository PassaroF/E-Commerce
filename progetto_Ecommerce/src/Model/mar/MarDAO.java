package Model.mar;

import Model.DAOInterface;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

    public class MarDAO implements DAOInterface<MarBean, Integer> {
    private static final String TABLE_NAME = "prodotti";
    private static final DataSource ds;
    private static final List<String> ORDERS = new ArrayList<>(Arrays.asList("nome", "prezzo"));
    
    // Connessione database
    static {
        try {
            Context init = new InitialContext();
            Context env = (Context) init.lookup("java:comp/env");

            ds = (DataSource) env.lookup("jdbc/byteshop");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }
    
    @Override
    public synchronized MarBean doRetrieveByKey(Integer code) throws SQLException {
        MarBean marBean = new MarBean();

        String query = "SELECT * FROM " + TABLE_NAME + " WHERE ID = ?";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, code);

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            setMar(resultSet, marBean);
        }

        return marBean;
    }
    
    @Override
    public void doSave(MarBean mar) throws SQLException {
        String query = "INSERT INTO " + TABLE_NAME + " (nome, immagine, prezzo, categoria_id)" + " VALUES (?, ?, ?, ?)";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            setMarStatement(mar, preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    @Override
    public void doUpdate(MarBean mar) throws SQLException {
        String query = "UPDATE " + TABLE_NAME +
                       " SET nome = ?, immagine = ?, prezzo = ?, categoria_id = ? " +
                       "WHERE ID = ?";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            setMarStatement(mar, preparedStatement);
            preparedStatement.setInt(8, mar.getID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    @Override
    public boolean doDelete(Integer code) throws SQLException {
        int result;

        String query = "DELETE FROM " + TABLE_NAME + " WHERE ID = ?";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, code);

            result = preparedStatement.executeUpdate();
        }

        return result != 0;
    }  
    
    public int getMaxID() throws SQLException {
        String sessionCacheQuery = "SET @@SESSION.information_schema_stats_expiry = 0;";
        String query = "SELECT AUTO_INCREMENT " +
                       "FROM information_schema.tables WHERE table_name = '" + TABLE_NAME +
                       "' AND table_schema = 'byteshop'";

        int ID;

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            connection.createStatement().execute(sessionCacheQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            ID = resultSet.getInt("AUTO_INCREMENT");
        }

        return ID;
    }
    
    private void setMar(ResultSet resultSet, MarBean marBean) throws SQLException {
        marBean.setID(resultSet.getInt("ID"));
        marBean.setNome(resultSet.getString("nome"));
        marBean.setimg(resultSet.getString("immagine"));
        marBean.setPrezzo(resultSet.getFloat("prezzo"));
        marBean.setcategoria(resultSet.getInt("categoria_id"));
    }
    
    private void setMarStatement(MarBean mar, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement.setString(1, mar.getNome());
        preparedStatement.setString(2, mar.getimg());
        preparedStatement.setFloat(3, mar.getPrezzo());
}
    }
