/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.ProductStatusCode;

/**
 *
 * @author area1
 */
public class ProductDBContext extends DBContext {

    public void setIsDelete(boolean isDelete, int productID) {
        String sql_update_status_product = "UPDATE [Product]\n"
                + "   SET isDelete = ?\n"
                + " WHERE Product.ID = ?";
        try {
            PreparedStatement psm_update_status_product = connection.prepareStatement(sql_update_status_product);
            int i = 0;
            psm_update_status_product.setBoolean(++i, isDelete);
            psm_update_status_product.setInt(++i, productID);
            psm_update_status_product.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Product> getTop3ProductsRankByContract() {
        ArrayList<Product> top10Product = new ArrayList<>();
        String sql_select_top10product = "SELECT TOP 3 COUNT(Contract.ID) AS NumberContracts,\n"
                + "		SUM(Contract.ContractFee) AS Revenues,\n"
                + " Product.ID, Product.Title\n"
                + "  FROM [Product] LEFT JOIN Contract ON Product.ID = Contract.ProductID\n"
                + "  WHERE Product.isDelete = 0 AND Contract.isDelete = 0 AND Contract.Status IN (1,3)\n"
                + "  GROUP BY Product.ID, Product.Title\n"
                + "  ORDER BY COUNT(Contract.ID) DESC, SUM(Contract.ContractFee) DESC";
        try {
            PreparedStatement psm_select_top10product = connection.prepareStatement(sql_select_top10product);
            ResultSet rs_select_top10product = psm_select_top10product.executeQuery();
            while (rs_select_top10product.next()) {
                Product product = new Product();
                product.setId(rs_select_top10product.getInt("ID"));
                product.setTitle(rs_select_top10product.getString("Title"));
                top10Product.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return top10Product;

    }

    public HashMap<Product, Integer> getProductsRankByContract() {
        HashMap<Product, Integer> top10Product = new HashMap<>();
        String sql_select_top10product = "SELECT COUNT(Contract.ID) AS NumberContracts,\n"
                + "		SUM(Contract.ContractFee) AS Revenues,\n"
                + " Product.ID, Product.Title\n"
                + "  FROM [Product] LEFT JOIN Contract ON Product.ID = Contract.ProductID\n"
                + "  WHERE Product.isDelete = 0 AND Contract.isDelete = 0 AND Contract.Status IN (1,3)\n"
                + "  GROUP BY Product.ID, Product.Title\n";
        try {
            PreparedStatement psm_select_top10product = connection.prepareStatement(sql_select_top10product);
            ResultSet rs_select_top10product = psm_select_top10product.executeQuery();
            while (rs_select_top10product.next()) {
                Product product = new Product();
                product.setId(rs_select_top10product.getInt("ID"));
                product.setTitle(rs_select_top10product.getString("Title"));
                int numberContracts = rs_select_top10product.getInt("NumberContracts");
                top10Product.put(product, numberContracts);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return top10Product;

    }

    public int getTotalActiveProducts() {
        int total = 0;
        String sql_select_totalproduct = "SELECT COUNT(Product.[ID]) AS NumberProducts\n"
                + "  FROM [Product]\n"
                + "  WHERE Product.Status IN (1) AND Product.isDelete = 0";

        try {
            PreparedStatement psm_select_totalproduct = connection.prepareStatement(sql_select_totalproduct);
            ResultSet rs_select_totalproduct = psm_select_totalproduct.executeQuery();
            if (rs_select_totalproduct.next()) {
                total = rs_select_totalproduct.getInt("NumberProducts");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public Product getProduct(int productID) {
        String sql_select_product = "SELECT [ID]\n"
                + "      ,[Title]\n"
                + "      ,[Description]\n"
                + "      ,[Price]\n"
                + "      ,[ImageURL]\n"
                + "      ,[StatusCode]\n"
                + "	  ,[StatusName]\n"
                + "      ,p.[isDelete]\n"
                + "      ,[ContentDetail]\n"
                + "      ,[StartDate]\n"
                + "  FROM [Product] p JOIN [ProductStatusCode] psc\n"
                + "  ON p.Status = psc.StatusCode\n"
                + "  WHERE p.ID = ? AND (p.isDelete = 0 OR p.isDelete is NULL)";
        try {
            PreparedStatement psm_select_product = connection.prepareStatement(sql_select_product);
            psm_select_product.setInt(1, productID);
            ResultSet rs_select_product = psm_select_product.executeQuery();
            if (rs_select_product.next()) {
                Product product = new Product();
                product.setId(productID);
                product.setTitle(rs_select_product.getString("Title"));
                product.setImageURL(rs_select_product.getString("ImageURL"));

                ProductStatusCode statusCode = new ProductStatusCode();
                statusCode.setStatusCode(rs_select_product.getShort("StatusCode"));
                statusCode.setStatusName(rs_select_product.getString("StatusName"));

                product.setStatusCode(statusCode);
                product.setDescription(rs_select_product.getString("Description"));
                product.setStartDate(rs_select_product.getTimestamp("StartDate"));
                product.setPrice(rs_select_product.getDouble("Price"));
                product.setContentDetail(rs_select_product.getString("ContentDetail"));

                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<Product> getProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql_Select_Product = "SELECT [ID]\n"
                    + "      ,[Title]\n"
                    + "      ,[Description]\n"
                    + "      ,[Price]\n"
                    + "      ,[ImageURL]\n"
                    + "      ,[Status]\n"
                    + "      ,[isDelete]\n"
                    + "  FROM [Product] WHERE Status IN (1) AND isDelete = 0";
            PreparedStatement psm_Select_Product = connection.prepareStatement(sql_Select_Product);
            ResultSet rs = psm_Select_Product.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("ID"));
                product.setTitle(rs.getString("Title"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getFloat("Price"));
                product.setImageURL(rs.getString("ImageURL"));
                product.setStatus(rs.getShort("Status"));
                product.setIsDelete(rs.getBoolean("isDelete"));

                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProductsByMod() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql_Select_Product = "SELECT [ID]\n"
                    + "      ,[Title]\n"
                    + "      ,[Description]\n"
                    + "      ,[Price]\n"
                    + "      ,[ImageURL]\n"
                    + "      ,[Status]\n"
                    + "      ,[isDelete]\n"
                    + "  FROM [Product]\n"
                    + " WHERE isDelete = 0";
            PreparedStatement psm_Select_Product = connection.prepareStatement(sql_Select_Product);
            ResultSet rs = psm_Select_Product.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("ID"));
                product.setTitle(rs.getString("Title"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getFloat("Price"));
                product.setImageURL(rs.getString("ImageURL"));
                product.setStatus(rs.getShort("Status"));
                product.setIsDelete(rs.getBoolean("isDelete"));

                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getProductsByCustomer(int customerID) {
        try {
            ArrayList<Product> products = new ArrayList<>();
            String sql_select_products = "SELECT DISTINCT\n"
                    + "Product.ID AS ProductID\n"
                    + ",Product.ImageURL AS ProductImage\n"
                    + ",Product.Title AS ProductTitle\n"
                    + ",Product.Description AS ProductDescription\n"
                    + "                    \n"
                    + "FROM [Contract] INNER JOIN Product ON Contract.ProductID=Product.ID\n"
                    + "WHERE [Contract].Status IN (1) AND [Contract].isDelete=0 AND Product.Status IN (1)\n"
                    + "AND Product.isDelete=0\n"
                    + "AND Contract.CustomerID = ?";
            PreparedStatement psm_select_product = connection.prepareStatement(sql_select_products);
            psm_select_product.setInt(1, customerID);
            ResultSet rs_select_products = psm_select_product.executeQuery();
            while (rs_select_products.next()) {
                Product product = new Product();
                product.setId(rs_select_products.getInt("ProductID"));
                product.setImageURL(rs_select_products.getString("ProductImage"));
                product.setTitle(rs_select_products.getString("ProductTitle"));
                product.setDescription(rs_select_products.getString("ProductDescription"));

                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product getProductByID(int pId) {
        try {
            String sql_select_products = "SELECT [ID]\n"
                    + "      ,[Title]\n"
                    + "      ,[Price]\n"
                    + "      ,[Status]\n"
                    + "  FROM [Product]\n"
                    + "  WHERE [ID] = ?";
            PreparedStatement psm_select_product = connection.prepareStatement(sql_select_products);
            psm_select_product.setInt(1, pId);
            ResultSet rs_select_products = psm_select_product.executeQuery();
            if (rs_select_products.next()) {
                Product product = new Product();
                product.setId(rs_select_products.getInt("ID"));
                product.setTitle(rs_select_products.getString("Title"));
                product.setPrice(rs_select_products.getDouble("Price"));
                product.setStatus(rs_select_products.getShort("Status"));

                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public short checkStatus(int id) {
        short check = 0;

        try {
            String sql = "SELECT [Status]\n"
                    + "  FROM [Product]\n"
                    + "  WHERE ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                if (rs.getShort("Status") == 1) {
                    check = 1;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public void createProduct(Product product) {
        try {
            String sql = "INSERT INTO [Product]\n"
                    + "           ([Title]\n"
                    + "           ,[Description]\n"
                    + "           ,[Price]\n"
                    + "           ,[ImageURL]\n"
                    + "           ,[Status]\n"
                    + "           ,[isDelete]\n"
                    + "           ,[ContentDetail]\n"
                    + "           ,[StartDate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, product.getTitle());
            stm.setString(2, product.getDescription());
            stm.setDouble(3, product.getPrice());
            stm.setString(4, product.getImageURL());
            stm.setShort(5, product.getStatus());
            stm.setBoolean(6, product.isIsDelete());
            stm.setString(7, product.getContentDetail());
            stm.setTimestamp(8, product.getStartDate());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Product getProductToUpdate(int proId) {
        try {
            String sql = "SELECT [ID]\n"
                    + ",[Title]\n"
                    + ",[Description]\n"
                    + ",[Price]\n"
                    + ",[ImageURL]\n"
                    + ",[StatusCode]\n"
                    + ",[StatusName]\n"
                    + ",p.[isDelete]\n"
                    + ",[ContentDetail]\n"
                    + ",[StartDate]\n"
                    + ",[UpdateTime]\n"
                    + "FROM [Product] p JOIN [ProductStatusCode] psc ON p.Status = psc.StatusCode\n"
                    + "				left join [ProductUpdateTime] put on p.[ID] = put.[ProductID]\n"
                    + "\n"
                    + "WHERE p.ID = ? AND (p.isDelete = 0 OR p.isDelete is NULL)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, proId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setId(proId);
                product.setTitle(rs.getString("Title"));
                product.setImageURL(rs.getString("ImageURL"));

                ProductStatusCode statusCode = new ProductStatusCode();
                statusCode.setStatusCode(rs.getShort("StatusCode"));
                statusCode.setStatusName(rs.getString("StatusName"));

                product.setStatusCode(statusCode);
                product.setDescription(rs.getString("Description"));
                product.setStartDate(rs.getTimestamp("StartDate"));
                product.setPrice(rs.getDouble("Price"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setUpdateDate(rs.getTimestamp("UpdateTime"));
//                if (product.getUpdateDate() != null) {
//                    product.getUpdateTime().add(product.getUpdateDate());
//
//                }
                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateProduct(Product product) {
        try {
            connection.setAutoCommit(false);
            //update product
            String sql_product = "UPDATE [Product]\n"
                    + "   SET [Title] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[Price] = ?\n"
                    + "      ,[ImageURL] = ?\n"
                    + "      ,[Status] = ?\n"
                    + "      ,[ContentDetail] = ?\n"
                    + "      ,[StartDate] = ?\n"
                    + " WHERE [ID] = ?";
            PreparedStatement stm_product = connection.prepareStatement(sql_product);
            stm_product.setString(1, product.getTitle());
            stm_product.setString(2, product.getDescription());
            stm_product.setDouble(3, product.getPrice());
            stm_product.setString(4, product.getImageURL());
            stm_product.setShort(5, product.getStatusCode().getStatusCode());
            stm_product.setString(6, product.getContentDetail());
            stm_product.setTimestamp(7, product.getStartDate());
            stm_product.setInt(8, product.getId());
            stm_product.executeUpdate();

            //insert product_update_time
            String sql_update_time = "INSERT INTO [ProductUpdateTime]\n"
                    + "           ([ProductID]\n"
                    + "           ,[UpdateTime])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement stm_update_time = connection.prepareStatement(sql_update_time);
            stm_update_time.setInt(1, product.getId());
            stm_update_time.setTimestamp(2, product.getUpdateDate());
            stm_update_time.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            try {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
