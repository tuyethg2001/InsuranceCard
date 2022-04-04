/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.externalmodule.PaginationModule;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Accident;
import model.Account;
import model.Compensation;
import model.CompensationStatusCode;
import model.Contract;
import model.ContractStatusCode;
import model.Customer;
import model.Product;

/**
 *
 * @author area1
 */
public class CompensationDBContext extends DBContext {

    public int deleteCompensation(int compensationID, int status, boolean isDelete) {
        int rowAffects = 0;
        String sql_update = "UPDATE [Compensation]\n"
                + "   SET [isDelete] = ?\n"
                + " WHERE Compensation.Status=? AND Compensation.ID=?";
        try {
            PreparedStatement psm_update = connection.prepareStatement(sql_update);
            int i = 0;
            psm_update.setBoolean(++i, isDelete);
            psm_update.setInt(++i, status);
            psm_update.setInt(++i, compensationID);
            rowAffects = psm_update.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowAffects;
    }

    public Compensation getCompensationByCustomer(int compensationID, int customerID) {
        String sql_select_compensation = "SELECT Contract.ID AS ContractID, Product.Title AS ProductTitle, Contract.Status AS ContractStatus,\n"
                + "		ContractStatusCode.StatusName AS ContractStatusName,\n"
                + "		Contract.StartDate, Contract.EndDate, Compensation.AccidentID,\n"
                + "		Accident.Title, Accident.AccidentDate, Accident.Attachment AS AccidentAttachment, \n"
                + "		Accident.CreatedDate AS AccidentCreatedDate,\n"
                + "		Accident.HumanDamage, Accident.VehicleDamage,\n"
                + "		Compensation.ID, Compensation.Status, CompensationStatusCode.StatusName,\n"
                + "		Compensation.CreatedDate, Compensation.ResolveDate, Compensation.DriverName,\n"
                + "		Compensation.Attachment, Compensation.Description, Compensation.ResolveNote\n"
                + "  FROM [Compensation] INNER JOIN Accident ON Compensation.AccidentID = Accident.ID\n"
                + "		INNER JOIN CompensationStatusCode ON CompensationStatusCode.StatusCode=Compensation.Status\n"
                + "		INNER JOIN Contract ON Accident.ContractID = Contract.ID\n"
                + "		INNER JOIN Product ON Product.ID = Contract.ProductID\n"
                + "		INNER JOIN ContractStatusCode ON ContractStatusCode.StatusCode=Contract.Status\n"
                + "	WHERE Compensation.isDelete = 0 AND Compensation.ID = ? AND Contract.CustomerID = ?";
        try {
            PreparedStatement psm_select_compesation = connection.prepareStatement(sql_select_compensation);
            int i = 0;
            psm_select_compesation.setInt(++i, compensationID);
            psm_select_compesation.setInt(++i, customerID);
            ResultSet rs_select_compensation = psm_select_compesation.executeQuery();
            if (rs_select_compensation.next()) {
                Compensation compensation = new Compensation();
                compensation.setId(rs_select_compensation.getInt(("ID")));
                compensation.setAttachment(rs_select_compensation.getString("Attachment"));
                compensation.setCreateDate(rs_select_compensation.getTimestamp("CreatedDate"));
                compensation.setDescription(rs_select_compensation.getString("Description"));
                compensation.setDriverName(rs_select_compensation.getString("DriverName"));
                compensation.setResolveDate(rs_select_compensation.getTimestamp("ResolveDate"));
                compensation.setResolveNote(rs_select_compensation.getString("ResolveNote"));

                CompensationStatusCode compensationSatus = new CompensationStatusCode();
                compensationSatus.setStatusCode(rs_select_compensation.getShort("Status"));
                compensationSatus.setStatusName(rs_select_compensation.getString("StatusName"));
                compensation.setStatus(compensationSatus);
                Accident accident = new Accident();
                accident.setId(rs_select_compensation.getInt("AccidentID"));
                accident.setAccidentDate(rs_select_compensation.getTimestamp("AccidentDate"));
                accident.setAttachment(rs_select_compensation.getString("AccidentAttachment"));
                accident.setCreatedDate(rs_select_compensation.getTimestamp("AccidentCreatedDate"));
                accident.setHumanDamage(rs_select_compensation.getString("HumanDamage"));
//                accident.setId(rs_select_compensation.getInt(""));
                accident.setTitle(rs_select_compensation.getString("Title"));
                accident.setVehicleDamage(rs_select_compensation.getString("VehicleDamage"));

                Contract contract = new Contract();
                contract.setId(rs_select_compensation.getInt("ContractID"));
                contract.setStartDate(rs_select_compensation.getTimestamp("StartDate"));
                contract.setEndDate(rs_select_compensation.getTimestamp("EndDate"));

                ContractStatusCode contractStatus = new ContractStatusCode();
                contractStatus.setStatusCode(rs_select_compensation.getShort("ContractStatus"));
                contractStatus.setStatusName(rs_select_compensation.getString("ContractStatusName"));
                contract.setStatusCode(contractStatus);
                Product product = new Product();
                product.setTitle(rs_select_compensation.getString("ProductTitle"));
                contract.setProduct(product);
                accident.setContract(contract);
                compensation.setAccident(accident);

                return compensation;

            }
        } catch (SQLException ex) {
            Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public HashMap<Integer, Compensation> getCompensationsByStaff(int staffId, String query, String queryChoose,
            int pageIndex, String compensationStatus, String orderby, String ordertype) {
        int[] recordFromTo = PaginationModule.calcFromToRecord(pageIndex, 20);
        HashMap<Integer, Compensation> compensations = new HashMap<>();
        if (query == null) {
            query = "";
        }
        if (ordertype == null || ordertype.isEmpty()) {
            ordertype = "ASC";
        }
        if (compensationStatus == null || compensationStatus.isEmpty()) {
            compensationStatus = "0, 1, 2";
        }
        orderby = (orderby == null) ? "" : orderby;
        switch (orderby) {
            case "compensationid":
                orderby = "Compensation.ID";
                break;
            case "contractid":
                orderby = "Accident.ContractID";
                break;
            case "title":
                orderby = "Accident.Title";
                break;
            case "created":
                orderby = "Compensation.CreatedDate";
                break;
            case "resole":
                orderby = "Compensation.ResolveDate";
                break;
            default:
                orderby = "Compensation.ID";
                break;
        }
        if (queryChoose == null) {
            queryChoose = "";
        }
        String querySearch = "1 = 1";
        switch (queryChoose) {
            case "accidenttitle":
                querySearch = "Accident.Title LIKE '%' + ? + '%' ";
                break;
            case "accidentid":
                querySearch = "Accident.ID LIKE ?";
                break;
            case "compensationid":
                querySearch = "Compensation.ID = ?";
                break;
            case "contractid":
                querySearch = "Contract.ID LIKE ? ";
                break;
            default:
                break;
        }
        try {
            String sql_select_compensation = "SELECT * FROM\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY " + orderby + " " + ordertype + ") AS Row_count,\n"
                    + "		Compensation.ID,\n"
                    + "		Accident.ContractID,\n"
                    + "		Accident.Title,\n"
                    + "		Compensation.CreatedDate,\n"
                    + "		Compensation.ResolveDate,\n"
                    + "		Compensation.Status,\n"
                    + "                                  CompensationStatusCode.StatusName\n"
                    + "  FROM [Compensation] INNER JOIN Accident ON Compensation.AccidentID=Accident.ID\n"
                    + "		INNER JOIN CompensationStatusCode ON CompensationStatusCode.StatusCode=Compensation.Status\n"
                    + "		INNER JOIN Contract ON Contract.ID  = Accident.ContractID\n"
                    + "		JOIN Customer_Staff ON Contract.CustomerID = Customer_Staff.CustomerID\n"
                    + "		JOIN ACCOUNT ON ACCOUNT.ID = Customer_Staff.CustomerID\n"
                    + "		JOIN Customer ON Customer.AccountID = Contract.CustomerID\n"
                    + "  WHERE Customer_Staff.StaffID=? AND Customer_Staff.EndDate IS NULL AND Compensation.isDelete = 0\n"
                    + "  AND (" + querySearch + ") AND Compensation.Status IN (" + compensationStatus + ")) AS Main\n"
                    + "  WHERE Main.Row_count BETWEEN ? AND ?";

            PreparedStatement stm_select_compensation = connection.prepareStatement(sql_select_compensation);

            int i = 0;
            stm_select_compensation.setInt(++i, staffId);
            if (!(queryChoose == null || queryChoose.isEmpty())) {
                stm_select_compensation.setString(++i, query);
            }

            stm_select_compensation.setInt(++i, recordFromTo[0]);
            stm_select_compensation.setInt(++i, recordFromTo[1]);
            ResultSet rs_select_compensation = stm_select_compensation.executeQuery();
            while (rs_select_compensation.next()) {
                Compensation compensation = new Compensation();
                compensation.setId(rs_select_compensation.getInt("ID"));
                compensation.setCreateDate(rs_select_compensation.getTimestamp("CreatedDate"));
                compensation.setResolveDate(rs_select_compensation.getTimestamp("ResolveDate"));

                Accident accident = new Accident();
//                accident.setId(rs_select_contract.getInt(""));
                accident.setTitle(rs_select_compensation.getString("Title"));

                Contract contract = new Contract();
                contract.setId(rs_select_compensation.getInt("ContractID"));
                accident.setContract(contract);
                compensation.setAccident(accident);

                CompensationStatusCode status = new CompensationStatusCode();
                status.setStatusCode(rs_select_compensation.getInt("Status"));
                status.setStatusName(rs_select_compensation.getString("StatusName"));
                compensation.setStatus(status);
                compensations.put(rs_select_compensation.getInt("Row_count"), compensation);
            }
            return compensations;
        } catch (SQLException ex) {
            Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int totalCompensationsByStaff(int staffId, String query, String queryChoose, String compensationStatus) {
        int totalContract = 0;
        if (query == null) {
            query = "";
        }
        if (compensationStatus == null || compensationStatus.isEmpty()) {
            compensationStatus = "0, 1, 2";
        }
        if (queryChoose == null) {
            queryChoose = "";
        }
        String querySearch = "1 = 1";
        switch (queryChoose) {
            case "accidenttitle":
                querySearch = "Accident.Title LIKE '%' + ? + '%' ";
                break;
            case "accidentid":
                querySearch = "Accident.ID LIKE ?";
                break;
            case "compensationid":
                querySearch = "Compensation.ID = ?";
                break;
            case "contractid":
                querySearch = "Contract.ID LIKE ? ";
                break;
            default:
                break;
        }

        try {
            String sql_total = "SELECT COUNT(Compensation.ID) AS TotalCompensation\n"
                    + "  FROM [Compensation] INNER JOIN Accident ON Compensation.AccidentID=Accident.ID\n"
                    + "		INNER JOIN CompensationStatusCode ON CompensationStatusCode.StatusCode=Compensation.Status\n"
                    + "		INNER JOIN Contract ON Contract.ID  = Accident.ContractID\n"
                    + "		JOIN Customer_Staff ON Contract.CustomerID = Customer_Staff.CustomerID\n"
                    + "		JOIN ACCOUNT ON ACCOUNT.ID = Customer_Staff.CustomerID\n"
                    + "		JOIN Customer ON Customer.AccountID = Contract.CustomerID\n"
                    + "  WHERE Customer_Staff.StaffID=? AND Customer_Staff.EndDate IS NULL AND Compensation.isDelete = 0\n"
                    + "  AND (" + querySearch + ") AND Compensation.Status IN (" + compensationStatus + ")";
            PreparedStatement stm_total = connection.prepareStatement(sql_total);
            int i = 0;
            stm_total.setInt(++i, staffId);
            if (!(queryChoose == null || queryChoose.isEmpty())) {
                stm_total.setString(++i, query);
            }

            ResultSet rs_total = stm_total.executeQuery();
            if (rs_total.next()) {
                totalContract = rs_total.getInt("TotalCompensation");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalContract;
    }

    public void setCompensation(Compensation compensation) {
        try {
            connection.setAutoCommit(false);
//            AccidentDBContext accidentDBC = new AccidentDBContext();
//            accidentDBC.setAccident(compensation.getAccident());
            Accident accident = compensation.getAccident();
            String sql_insert_accident = "INSERT INTO [Accident]\n"
                    + "           ([AccidentDate]\n"
                    + "           ,[Title]\n"
                    + "           ,[CreatedDate]\n"
                    + "           ,[Attachment]\n"
                    + "           ,[HumanDamage]\n"
                    + "           ,[VehicleDamage]\n"
                    + "           ,[ContractID])\n"
                    + "     VALUES\n"
                    + "           (? ,? ,? ,? ,? ,?,?)";

            PreparedStatement psm_insert_accident = connection.prepareStatement(sql_insert_accident);
            int i = 0;
            psm_insert_accident.setTimestamp(++i, accident.getAccidentDate());
            psm_insert_accident.setString(++i, accident.getTitle());
            psm_insert_accident.setTimestamp(++i, accident.getCreatedDate());
            psm_insert_accident.setString(++i, accident.getAttachment());
            psm_insert_accident.setString(++i, accident.getHumanDamage());
            psm_insert_accident.setString(++i, accident.getVehicleDamage());
            psm_insert_accident.setInt(++i, accident.getContract().getId());

            psm_insert_accident.executeUpdate();
            String sql_select_accident_identity = "SELECT @@IDENTITY AS AccidentId";
            PreparedStatement psm_select_accident_identity = connection.prepareStatement(sql_select_accident_identity);
            ResultSet rs_select_accident_identity = psm_select_accident_identity.executeQuery();
            if (rs_select_accident_identity.next()) {
                compensation.getAccident().setId(rs_select_accident_identity.getInt("AccidentId"));
            }
            String sql_insert_compensation = "INSERT INTO [Compensation]\n"
                    + "           ([DriverName]\n"
                    + "           ,[CreatedDate]\n"
                    + "           ,[Status]\n"
                    + "           ,[Description]\n"
                    + "           ,[Attachment]\n"
                    + "           ,[AccidentID])\n"
                    + "     VALUES\n"
                    + "           (?, ?, 2, ?, ?, ?)";

            PreparedStatement psm_insert_compensation = connection.prepareStatement(sql_insert_compensation);
            i = 0;
            psm_insert_compensation.setString(++i, compensation.getDriverName());
            psm_insert_compensation.setTimestamp(++i, compensation.getCreateDate());
            psm_insert_compensation.setString(++i, compensation.getDescription());
            psm_insert_compensation.setString(++i, compensation.getAttachment());
            psm_insert_compensation.setInt(++i, compensation.getAccident().getId());
            psm_insert_compensation.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public int getCompensationQuantity(int customerID) {
        int compensationQuantity = 0;
        try {
            String sql_count_compensation = "SELECT COUNT(COMPENSATION.ID) AS PendingRequestCompensation\n"
                    + "  FROM [Compensation] INNER JOIN Accident\n"
                    + "	ON Compensation.AccidentID = Accident.ID\n"
                    + "	INNER JOIN [Contract] ON Contract.ID = Accident.ContractID\n"
                    + "  WHERE (Contract.isDelete = 0 AND AccidenT.isDelete = 0\n"
                    + "		AND Compensation.isDelete=0) AND Compensation.Status IN (2) \n"
                    + "		AND (Contract.CustomerID = ?)";
            PreparedStatement psm_count_compenstion = connection.prepareStatement(sql_count_compensation);
            psm_count_compenstion.setInt(1, customerID);
            ResultSet rs_counResultSet = psm_count_compenstion.executeQuery();
            if (rs_counResultSet.next()) {
                compensationQuantity = rs_counResultSet.getInt("PendingRequestCompensation");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return compensationQuantity;
    }

    public ArrayList<Compensation> getContractCompensations(int contractID) {
        ArrayList<Compensation> compensations = new ArrayList<>();
        try {
            String sql = "select c.ID\n"
                    + "	, c.CreatedDate\n"
                    + "	, ResolveDate\n"
                    + "	, Status\n"
                    + "	, StatusName\n"
                    + "from Compensation c inner join CompensationStatusCode cs\n"
                    + "on c.Status = cs.StatusCode\n"
                    + "inner join Accident a\n"
                    + "on c.AccidentID = a.ID\n"
                    + "where a.ContractID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, contractID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CompensationStatusCode comStatus = new CompensationStatusCode();
                comStatus.setStatusCode(rs.getInt("Status"));
                comStatus.setStatusName(rs.getString("StatusName"));

                Compensation com = new Compensation();
                com.setId(rs.getInt("ID"));
                com.setCreateDate(rs.getTimestamp("CreatedDate"));
                com.setResolveDate(rs.getTimestamp("ResolveDate"));
                com.setStatus(comStatus);
                compensations.add(com);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return compensations;
    }

    //Resolve Compensation
    public Compensation getCompensation(int id) {
        try {
            String sql = "select comp.ID, DriverName, comp.CreatedDate, comp.ResolveDate, comp.ResolveNote,"
                    + " csc.StatusCode, csc.StatusName, comp.[Description], comp.Attachment, AccidentID\n"
                    + "from Compensation comp inner join Accident a on comp.AccidentID = a.ID\n"
                    + "						inner join CompensationStatusCode csc on comp.[Status] = csc.StatusCode\n"
                    + "						left join [Contract] cont on a.ContractID = cont.ID\n"
                    + "where comp.[ID] = ?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Compensation c = null;
            while (rs.next()) {
                if (c == null) {
                    c = new Compensation();
                    c.setId(id);
                    AccidentDBContext dbA = new AccidentDBContext();
                    Accident accident = dbA.getAccident(id);
                    c.setAccident(accident);
                    c.setDriverName(rs.getString("DriverName"));
                    c.setCreateDate(rs.getTimestamp("CreatedDate"));
                    c.setResolveDate(rs.getTimestamp("ResolveDate"));
                    c.setResolveNote(rs.getString("ResolveNote"));
                    CompensationStatusCode status = new CompensationStatusCode();
                    status.setStatusCode(rs.getInt("StatusCode"));
                    status.setStatusName(rs.getString("StatusName"));
                    c.setStatus(status);
                    c.setDescription(rs.getString("Description"));
                    c.setAttachment(rs.getString("Attachment"));
                }
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateStatusCompensation(Compensation compensation) {
        try {
            String sql = "UPDATE [Compensation]\n"
                    + "   SET [ResolveDate] = ?\n"
                    + "      ,[ResolveNote] = ?\n"
                    + "      ,[Status] = ?\n"
                    + "      \n"
                    + " WHERE [ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, compensation.getResolveDate());
            stm.setString(2, compensation.getResolveNote());
            stm.setInt(3, compensation.getStatus().getStatusCode());
            stm.setInt(4, compensation.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Compensation> searchCompensationHis(int cusID, int pageSize, int pageIndex, String search, String from, String to, int statusID) {
        ArrayList<Compensation> compensations = new ArrayList<>();
        try {
            String sql = "with compenHis as (select cp.ID\n"
                    + "						, DriverName\n"
                    + "						, cp.CreatedDate\n"
                    + "						, cp.ResolveDate\n"
                    + "						, cp.Status\n"
                    + "						, cpc.StatusName\n"
                    + "						, ContractID\n"
                    + "						, ROW_NUMBER() over (order by cp.ID) as rowNumber\n"
                    + "					from Compensation cp inner join Accident a\n"
                    + "					on cp.AccidentID = a.ID\n"
                    + "					inner join Contract ct\n"
                    + "					on a.ContractID = ct.ID\n"
                    + "					inner join CompensationStatusCode cpc\n"
                    + "					on cp.Status = cpc.StatusCode\n"
                    + "					where CustomerID = ?\n"
                    + "						and (DriverName like N'%' + ? + '%'\n"
                    + "							or CONVERT(varchar, cp.CreatedDate, 120) like '%' + ? + '%'\n"
                    + "							or CONVERT(varchar, cp.ResolveDate, 120) like '%' + ? + '%'\n"
                    + "							or cpc.StatusName like '%' + ? + '%'\n"
                    + "							or CONVERT(varchar, ContractID) like '%' + ? + '%')";
            if (from != null) {
                sql += "\nand CONVERT(date, cp.CreatedDate) >= CONVERT(date, ?)";
            }
            if (to != null) {
                sql += "\nand CONVERT(date, cp.CreatedDate) <= CONVERT(date, ?)"
                        + "\nand CONVERT(date, cp.ResolveDate) <= CONVERT(date, ?)";
            }
            if (statusID != -1) {
                sql += "\nand cp.Status = ?";
            }
            sql += ")\nselect ID\n"
                    + "	, DriverName\n"
                    + "	, CreatedDate\n"
                    + "	, ResolveDate\n"
                    + "	, Status\n"
                    + "	, StatusName\n"
                    + "	, ContractID\n"
                    + "from compenHis\n"
                    + "where rowNumber >= (? - 1) * ? + 1\n"
                    + "	and rowNumber <= ? * ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            int index = 1;
            ps.setInt(index++, cusID);
            ps.setString(index++, search);
            ps.setString(index++, search);
            ps.setString(index++, search);
            ps.setString(index++, search);
            ps.setString(index++, search);
            if (from != null) {
                ps.setString(index++, from);
            }
            if (to != null) {
                ps.setString(index++, to);
                ps.setString(index++, to);
            }
            if (statusID != -1) {
                ps.setInt(index++, statusID);
            }
            ps.setInt(index++, pageIndex);
            ps.setInt(index++, pageSize);
            ps.setInt(index++, pageIndex);
            ps.setInt(index, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CompensationStatusCode compenStatus = new CompensationStatusCode();
                compenStatus.setStatusCode(rs.getInt("Status"));
                compenStatus.setStatusName(rs.getString("StatusName"));

                Contract contract = new Contract();
                contract.setId(rs.getInt("ContractID"));

                Accident accident = new Accident();
                accident.setContract(contract);

                Compensation compen = new Compensation();
                compen.setId(rs.getInt("ID"));
                compen.setDriverName(rs.getString("DriverName"));
                compen.setCreateDate(rs.getTimestamp("CreatedDate"));
                compen.setResolveDate(rs.getTimestamp("ResolveDate"));
                compen.setStatus(compenStatus);
                compen.setAccident(accident);
                compensations.add(compen);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return compensations;
    }

    public int getTotalCustomerCompensation(int customerID, String search, String from, String to, int statusID) {
        int total = 0;
        try {
            String sql = "select COUNT(*) as total\n"
                    + "from Compensation cp inner join Accident a\n"
                    + "on cp.AccidentID = a.ID\n"
                    + "inner join Contract ct\n"
                    + "on a.ContractID = ct.ID\n"
                    + "inner join CompensationStatusCode cpc\n"
                    + "on cp.Status = cpc.StatusCode\n"
                    + "where CustomerID = ?\n"
                    + "	and (DriverName like N'%' + ? + '%'\n"
                    + "		or CONVERT(varchar, cp.CreatedDate, 120) like N'%' + ? + '%'\n"
                    + "		or CONVERT(varchar, cp.ResolveDate, 120) like '%' + ? + '%'\n"
                    + "		or cpc.StatusName like '%' + ? + '%'\n"
                    + "		or CONVERT(varchar, ContractID) like '%' + ? + '%')";
            if (from != null) {
                sql += "\nand CONVERT(date, cp.CreatedDate) >= CONVERT(date, ?)";
            }
            if (to != null) {
                sql += "\nand CONVERT(date, cp.CreatedDate) <= CONVERT(date, ?)"
                        + "\nand CONVERT(date, cp.ResolveDate) <= CONVERT(date, ?)";
            }
            if (statusID != -1) {
                sql += "\nand cp.Status = ?";
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            int index = 1;
            ps.setInt(index++, customerID);
            ps.setString(index++, search);
            ps.setString(index++, search);
            ps.setString(index++, search);
            ps.setString(index++, search);
            ps.setString(index++, search);
            if (from != null) {
                ps.setString(index++, from);
            }
            if (to != null) {
                ps.setString(index++, to);
                ps.setString(index++, to);
            }
            if (statusID != -1) {
                ps.setInt(index++, statusID);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompensationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

}
