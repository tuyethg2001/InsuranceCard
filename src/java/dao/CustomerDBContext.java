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
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.AccountStatusCode;
import model.Customer;
import model.CustomerStaff;
import model.Staff;

/**
 *
 * @author area1
 */
public class CustomerDBContext extends DBContext {

    public int getTotalActiveCustomers() {
        int total = 0;

        String sql_select_totalcustomer = "SELECT Count(Customer.[AccountID]) AS NumberCustomer\n"
                + "  FROM [Customer] INNER JOIN Account ON Customer.AccountID = Account.ID\n"
                + "  WHERE CUSTOMER.isDelete = 0 ";
        try {
            PreparedStatement psm_select_totalcustomer = connection.prepareStatement(sql_select_totalcustomer);
            ResultSet rs_select_totalcustomer = psm_select_totalcustomer.executeQuery();
            if (rs_select_totalcustomer.next()) {
                total = rs_select_totalcustomer.getInt("NumberCustomer");
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public Customer getCustomerByAccount(Account account) {
        try {
            String sql_select_customer = "SELECT [AccountID]\n"
                    + "      ,[FirstName]\n"
                    + "      ,[LastName]\n"
                    + "      ,[Address]\n"
                    + "      ,[Dob]\n"
                    + "      ,[JoinDate]\n"
                    + "      ,[Phone]\n"
                    + "      ,[PersonalID]\n"
                    + "      ,[Province]\n"
                    + "      ,[District]\n"
                    + "      ,[isDelete]\n"
                    + "  FROM [Customer]\n"
                    + "  where [AccountID] = ?";
            PreparedStatement psm_select_customer = connection.prepareStatement(sql_select_customer);
            psm_select_customer.setInt(1, account.getId());
            ResultSet rs_select_customer = psm_select_customer.executeQuery();

            if (rs_select_customer.next()) {
                Customer cus = new Customer();
                cus.setFirstName(rs_select_customer.getString("Firstname"));
                cus.setLastName(rs_select_customer.getString("LastName"));
                cus.setAddress(rs_select_customer.getString("Address"));
                cus.setDob(rs_select_customer.getDate("Dob"));
                cus.setJoinDate(rs_select_customer.getTimestamp("JoinDate"));
                cus.setPhone(rs_select_customer.getString("Phone"));
                cus.setPersonalID(rs_select_customer.getString("PersonalID"));
                cus.setProvince(rs_select_customer.getString("Province"));
                cus.setDistrict(rs_select_customer.getString("District"));
                cus.setAccount(account);

                return cus;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // public void insertCustomerByGoogle(Customer customer) {
    // try {
    // connection.setAutoCommit(false);
    // String sql_insert_account = "INSERT INTO [Account]\n"
    // + " ([Email]\n"
    // + " ,[Role]\n"
    // + " ,[Status]\n"
    // + " ,[GoogleID])\n"
    // + " VALUES\n"
    // + " (?\n"
    // + " ,0\n"
    // + " ,1\n"
    // + " ,?)";
    // PreparedStatement psm_insert_account =
    // connection.prepareStatement(sql_insert_account);
    // psm_insert_account.setString(1, customer.getAccount().getEmail());
    // psm_insert_account.setString(2, customer.getAccount().getGoogleID());
    // psm_insert_account.executeUpdate();
    // //select accountId to insert into customer table
    // String sql_get_accountid = "select @@identity as account_id";
    // PreparedStatement stm_get_accountid =
    // connection.prepareStatement(sql_get_accountid);
    // ResultSet rs_accountid = stm_get_accountid.executeQuery();
    // if (rs_accountid.next()) {
    // customer.getAccount().setId(rs_accountid.getInt("account_id"));
    // }
    // //
    //
    // String sql_insert_customer = "INSERT INTO [dbo].[Customer]\n"
    // + " ([AccountID]\n"
    // + " ,[FirstName]\n"
    // + " ,[LastName]\n"
    // + " ,[JoinDate])\n"
    // + " VALUES\n"
    // + " (?\n"
    // + " ,?\n"
    // + " ,?\n"
    // + " ,?)";
    // PreparedStatement psm_insert_customer =
    // connection.prepareStatement(sql_insert_customer);
    // psm_insert_customer.setInt(1, customer.getAccount().getId());
    // psm_insert_customer.setNString(2, customer.getFirstName());
    // psm_insert_customer.setNString(3, customer.getLastName());
    // psm_insert_customer.setTimestamp(4, customer.getJoinDate());
    //
    // psm_insert_customer.executeUpdate();
    // connection.commit();
    //
    // } catch (SQLException ex) {
    // try {
    // connection.rollback();
    // } catch (SQLException ex1) {
    // Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null,
    // ex1);
    // }
    // Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null,
    // ex);
    // } finally {
    // try {
    // connection.setAutoCommit(true);
    // } catch (SQLException ex) {
    // Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null,
    // ex);
    // }
    // }
    //
    // }
    public CustomerStaff getCustomerDashboard(int customerID) {
        try {
            // connection.setAutoCommit(false);
            String sql_Select_Customer = "SELECT [Customer].AccountID AS CustomerID\n"
                    + "      ,[Customer].[FirstName] AS CustomerFirstname\n"
                    + "      ,[Customer].[LastName] AS CustomerLastName,\n"
                    + "	  Staff.AccountID AS StaffID,\n"
                    + "	  Staff.FirstName AS StaffFirstname, Staff.LastName AS StaffLastname,\n"
                    + "	  Staff.Phone AS Staffphone, AccountStaff.Email AS Staffemail\n"
                    + "  FROM [Customer] INNER JOIN Customer_Staff ON Customer.AccountID = Customer_Staff.CustomerID\n"
                    + "  INNER JOIN Staff ON Customer_Staff.StaffID=Staff.AccountID\n"
                    + "  INNER JOIN Account AS AccounTStaff ON Staff.AccountID = AccounTStaff.ID\n"
                    + "  WHERE AccounTStaff.[Status] IN (1) AND Customer_Staff.EndDate IS NULL AND\n"
                    + "  Customer.AccountID = ?";
            PreparedStatement psm_Select_Customer = connection.prepareStatement(sql_Select_Customer);
            psm_Select_Customer.setInt(1, customerID);
            ResultSet rs_select_customer = psm_Select_Customer.executeQuery();
            CustomerStaff cs = new CustomerStaff();

            if (rs_select_customer.next()) {
                Customer cus = new Customer();
                cus.setFirstName(rs_select_customer.getString("CustomerFirstname"));
                cus.setLastName(rs_select_customer.getString("CustomerLastName"));
                Staff staff = new Staff();

                staff.setFirstName(rs_select_customer.getString("StaffFirstname"));
                staff.setLastName(rs_select_customer.getString("StaffLastname"));
                staff.setPhone(rs_select_customer.getString("Staffphone"));
                Account account = new Account();
                account.setEmail(rs_select_customer.getString("Staffemail"));
                account.setId(rs_select_customer.getInt("StaffID"));

                staff.setAccount(account);
                cs.setCustomer(cus);
                cs.setStaff(staff);
            }
            // connection.commit();
            return cs;
        } catch (SQLException ex) {
            // try {
            // connection.rollback();
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        // catch (SQLException ex1) {
        // Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null,
        // ex1);
        // }

        // } finally {
        // try {
        //
        // connection.setAutoCommit(true);
        // } catch (SQLException ex) {
        // Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null,
        // ex);
        // }
        // }
        return null;
    }

    public ArrayList<Customer> checkDupRegister() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT [PersonalID]\n"
                    + "	   ,Account.Email\n"
                    + "  FROM [Customer]\n"
                    + "  INNER JOIN Account\n"
                    + "  ON Account.ID = Customer.AccountID"
                    + "  WHERE Customer.PersonalID is not NULL";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account account = new Account();
                account.setEmail(rs.getString("Email").trim());

                Customer customer = new Customer();
                customer.setPersonalID(rs.getString("PersonalID").trim());
                customer.setAccount(account);

                customers.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public void register(Customer customer, Account account) {
        try {
            connection.setAutoCommit(false);
            String sql_account = "INSERT INTO [Account]\n"
                    + "	([Email]\n"
                    + "	,[Password]\n"
                    + "	,[Role]\n"
                    + "	,[Status]\n"
                    + "	,[GoogleID])\n"
                    + "	VALUES\n"
                    + "	(?\n"
                    + "	,?\n"
                    + "	,?\n"
                    + "	,?\n"
                    + "	,?)";

            PreparedStatement stm_account = connection.prepareStatement(sql_account);
            stm_account.setString(1, account.getEmail());
            stm_account.setString(2, account.getPassword());
            stm_account.setBoolean(3, false);
            stm_account.setBoolean(4, true);
            stm_account.setString(5, account.getGoogleID());
            stm_account.executeUpdate();

            String sql_get_accountid = "select @@identity as account_id";
            PreparedStatement stm_get_accountid = connection.prepareStatement(sql_get_accountid);
            ResultSet rs_accountid = stm_get_accountid.executeQuery();

            if (rs_accountid.next()) {
                account.setId(rs_accountid.getInt("account_id"));
                customer.setAccount(account);
            }

            String sql_customer = "INSERT INTO [Customer]\n"
                    + "           ([AccountID]\n"
                    + "           ,[FirstName]\n"
                    + "           ,[LastName]\n"
                    + "           ,[Address]\n"
                    + "           ,[Dob]\n"
                    + "           ,[JoinDate]\n"
                    + "           ,[Phone]\n"
                    + "           ,[PersonalID]\n"
                    + "           ,[Province]\n"
                    + "           ,[District])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm_customer = connection.prepareStatement(sql_customer);
            stm_customer.setInt(1, customer.getAccount().getId());
            stm_customer.setString(2, customer.getFirstName());
            stm_customer.setString(3, customer.getLastName());
            stm_customer.setString(4, customer.getAddress());
            stm_customer.setDate(5, customer.getDob());
            stm_customer.setTimestamp(6, customer.getJoinDate());
            stm_customer.setString(7, customer.getPhone());
            stm_customer.setString(8, customer.getPersonalID());
            stm_customer.setString(9, customer.getProvince());
            stm_customer.setString(10, customer.getDistrict());
            stm_customer.executeUpdate();

            String sql_count_contract = "SELECT top 1 Staff.AccountID as StaffID, \n"
                    + "		count(Contract.CustomerID) as NumberOfContract\n"
                    + "FROM Staff\n"
                    + "	INNER JOIN Account\n"
                    + "	ON Account.ID = Staff.AccountID\n"
                    + "	LEFT JOIN Customer_Staff\n"
                    + "	ON Customer_Staff.StaffID = Staff.AccountID\n"
                    + "	LEFT JOIN Customer\n"
                    + "	ON Customer.AccountID = Customer_Staff.CustomerID\n"
                    + "	LEFT JOIN Contract\n"
                    + "	ON Contract.CustomerID = Customer.AccountID\n"
                    + "WHERE Account.Status = 1 and (Contract.Status in (1, 2, 3, 5) or Contract.Status is null)\n"
                    + "GROUP BY Staff.AccountID\n"
                    + "ORDER BY NumberOfContract asc, StaffID asc";
            PreparedStatement stm_count_contract = connection.prepareStatement(sql_count_contract);
            ResultSet rs_count_contract = stm_count_contract.executeQuery();

            int staffID = 0;
            if (rs_count_contract.next()) {
                staffID = rs_count_contract.getInt("StaffID");
            }

            String sql_custaff = "INSERT INTO [Customer_Staff]\n"
                    + "           ([CustomerID]\n"
                    + "           ,[StaffID]\n"
                    + "           ,[StartDate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm_custaff = connection.prepareStatement(sql_custaff);
            stm_custaff.setInt(1, customer.getAccount().getId());
            stm_custaff.setInt(2, staffID);
            stm_custaff.setTimestamp(3, customer.getJoinDate());
            stm_custaff.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public CustomerStaff viewCustomer(int id) {
        try {
            CustomerStaff cs = new CustomerStaff();

            String sql = "SELECT Customer_Staff.CustomerID\n"
                    + "       ,Customer_Staff.StaffID\n"
                    + "       ,Customer.[FirstName] as customer_FirstName\n"
                    + "       ,Customer.[LastName] as customer_LastName\n"
                    + "       ,[Address]\n"
                    + "       ,[Dob]\n"
                    + "       ,[JoinDate]\n"
                    + "       ,Customer.[Phone]\n"
                    + "       ,[PersonalID]\n"
                    + "       ,Account.Email\n"
                    + "       ,Account.[Status]\n"
                    + "       ,Province\n"
                    + "       ,District\n"
                    + "	   ,Staff.FirstName as staff_FirstName\n"
                    + "	   ,Staff.LastName as staff_LastName\n"
                    + "  FROM [Customer_Staff]\n"
                    + "  INNER JOIN Customer\n"
                    + "			ON Customer.AccountID = Customer_Staff.CustomerID\n"
                    + "  INNER JOIN Staff \n"
                    + "			ON Staff.AccountID = Customer_Staff.StaffID\n"
                    + "  INNER JOIN Account\n"
                    + "			ON Account.ID = Customer.AccountID\n"
                    + "  WHERE CustomerID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                Customer customer = new Customer();
                customer.setFirstName(rs.getString("customer_FirstName"));
                customer.setLastName(rs.getString("customer_LastName"));
                customer.setAddress(rs.getString("Address"));
                customer.setDob(rs.getDate("Dob"));
                customer.setJoinDate(rs.getTimestamp("JoinDate"));
                customer.setPhone(rs.getString("Phone"));
                customer.setPersonalID(rs.getString("PersonalID"));
                customer.setProvince(rs.getString("Province"));
                customer.setDistrict(rs.getString("District"));

                Account cus_account = new Account();
                cus_account.setId(rs.getInt("CustomerID"));
                cus_account.setEmail(rs.getString("Email"));
                cus_account.setStatus(rs.getShort("Status"));

                customer.setAccount(cus_account);

                Account staff_account = new Account();
                staff_account.setId(rs.getInt("StaffID"));

                Staff staff = new Staff();
                staff.setAccount(staff_account);
                staff.setFirstName(rs.getString("staff_FirstName"));
                staff.setLastName(rs.getString("staff_LastName"));

                cs.setCustomer(customer);
                cs.setStaff(staff);
                return cs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void staffCreateCustomer(CustomerStaff cusStaff) {
        try {
            Customer cus = cusStaff.getCustomer();
            connection.setAutoCommit(false);
            // create account for customer
            String sql_acc = "insert into Account (Email\n"
                    + "					, Password\n"
                    + "					, Role\n"
                    + "					, Status\n"
                    + "					, isDelete)\n"
                    + "values (?\n"
                    + "		, ?\n"
                    + "		, 0\n"
                    + "		, 1\n"
                    + "		, 0)";
            PreparedStatement ps_acc = connection.prepareStatement(sql_acc);
            ps_acc.setString(1, cus.getAccount().getEmail());
            ps_acc.setString(2, cus.getAccount().getPassword());
            ps_acc.executeUpdate();
            // get customer's account id
            String sql_get_acc_id = "select @@IDENTITY as aid";
            PreparedStatement ps_get_acc_id = connection.prepareStatement(sql_get_acc_id);
            ResultSet rs_get_id = ps_get_acc_id.executeQuery();
            if (rs_get_id.next()) {
                cus.getAccount().setId(rs_get_id.getInt("aid"));
            }
            // insert customer
            String sql_cus = "insert into Customer (AccountID\n"
                    + "					, FirstName\n"
                    + "					, LastName\n"
                    + "					, Address\n"
                    + "					, Dob\n"
                    + "					, JoinDate\n"
                    + "					, Phone\n"
                    + "					, PersonalID\n"
                    + "					, Province\n"
                    + "					, District)\n"
                    + "values (?\n"
                    + "		, ?\n"
                    + "		, ?\n"
                    + "		, ?\n"
                    + "		, ?\n"
                    + "		, ?\n"
                    + "		, ?\n"
                    + "		, ?\n"
                    + "		, ?\n"
                    + "		, ?)";
            PreparedStatement ps_cus = connection.prepareStatement(sql_cus);
            ps_cus.setInt(1, cus.getAccount().getId());
            ps_cus.setString(2, cus.getFirstName());
            ps_cus.setString(3, cus.getLastName());
            ps_cus.setString(4, cus.getAddress());
            ps_cus.setDate(5, cus.getDob());
            ps_cus.setTimestamp(6, cus.getJoinDate());
            ps_cus.setString(7, cus.getPhone());
            ps_cus.setString(8, cus.getPersonalID());
            ps_cus.setString(9, cus.getProvince());
            ps_cus.setString(10, cus.getDistrict());
            ps_cus.executeUpdate();
            // insert cus_staff
            String sql_cus_staff = "insert into Customer_Staff (CustomerID\n"
                    + "							, StaffID)\n"
                    + "values (?\n"
                    + "		, ?)";
            PreparedStatement ps_cus_staff = connection.prepareStatement(sql_cus_staff);
            ps_cus_staff.setInt(1, cus.getAccount().getId());
            ps_cus_staff.setInt(2, cusStaff.getStaff().getAccount().getId());
            ps_cus_staff.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void staffEditCustomer(Customer cus) {
        try {
            connection.setAutoCommit(false);
            Account acc = cus.getAccount();
            // update cus acc info
            String sql_acc = "update Account\n"
                    + "set Email = ?\n"
                    + "	, Status = ?\n"
                    + "where ID = ?";
            PreparedStatement ps_acc = connection.prepareStatement(sql_acc);
            ps_acc.setString(1, acc.getEmail());
            ps_acc.setInt(2, acc.getStatus());
            ps_acc.setInt(3, acc.getId());
            ps_acc.executeUpdate();
            // update cus info
            String sql_cus = "update Customer\n"
                    + "set FirstName = ?\n"
                    + "	, LastName = ?\n"
                    + "	, Address = ?\n"
                    + "	, Dob = ?\n"
                    + "	, Phone = ?\n"
                    + "	, PersonalID = ?\n"
                    + "	, Province = ?\n"
                    + "	, District = ?\n"
                    + "where AccountID = ?";
            PreparedStatement ps_cus = connection.prepareStatement(sql_cus);
            ps_cus.setString(1, cus.getFirstName());
            ps_cus.setString(2, cus.getLastName());
            ps_cus.setString(3, cus.getAddress());
            ps_cus.setDate(4, cus.getDob());
            ps_cus.setString(5, cus.getPhone());
            ps_cus.setString(6, cus.getPersonalID());
            ps_cus.setString(7, cus.getProvince());
            ps_cus.setString(8, cus.getDistrict());
            ps_cus.setInt(9, acc.getId());
            ps_cus.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Customer> getCustomers(int cusID, String cusName, String phone,
            String province, String district, int pageIndex, int pageSize) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String table_rowNum = "SELECT ROW_NUMBER() OVER (ORDER BY [AccountID] ASC) as rownum, * \n"
                    + "         FROM [Customer] WHERE isDelete = 0 ";
            HashMap<Integer, String[]> params = new HashMap<>();
            int countParam = 0;
            if (cusID != 0) {
                table_rowNum += " AND [AccountID] = ? ";
                countParam++;
                String[] param = new String[2];
                param[0] = "Integer";
                param[1] = cusID + "";
                params.put(countParam, param);
            }
            if (!cusName.isEmpty()) {
                table_rowNum += " AND ([FirstName] like '%'+?+'%' OR [LastName] like '%'+?+'%') ";
                countParam++;
                String[] param = new String[2];
                param[0] = "String";
                param[1] = cusName;
                params.put(countParam, param);

                countParam++;
                param[0] = "String";
                param[1] = cusName;
                params.put(countParam, param);
            }
            if (!phone.isEmpty()) {
                table_rowNum += " AND [Phone] = ? ";
                countParam++;
                String[] param = new String[2];
                param[0] = "String";
                param[1] = phone;
                params.put(countParam, param);
            }
            if (!province.isEmpty()) {
                table_rowNum += " AND [Province] = ? ";
                countParam++;
                String[] param = new String[2];
                param[0] = "String";
                param[1] = province;
                params.put(countParam, param);
            }
            if (!district.isEmpty()) {
                table_rowNum += " AND [District] = ? ";
                countParam++;
                String[] param = new String[2];
                param[0] = "String";
                param[1] = district;
                params.put(countParam, param);
            }

            String sql = "SELECT [AccountID]\n"
                    + "      ,[FirstName]\n"
                    + "      ,[LastName]\n"
                    + "      ,[Address]\n"
                    + "      ,[Dob]\n"
                    + "      ,[JoinDate]\n"
                    + "      ,[Phone]\n"
                    + "      ,[PersonalID]\n"
                    + "      ,[Province]\n"
                    + "      ,[District]\n"
                    + "      ,p.[isDelete]\n"
                    + "      ,[Email]\n"
                    + "      ,[Role]\n"
                    + "      ,[StatusCode]\n"
                    + "	     ,[StatusName]\n"
                    + "      ,a.[isDelete]\n"
                    + "      ,[GoogleID]"
                    + "  FROM "
                    + "  ( " + table_rowNum + " ) as p JOIN [Account] a\n"
                    + "  ON p.AccountID = a.ID "
                    + "  JOIN [AccountStatusCode] sc\n"
                    + "  ON a.[Status] = sc.[StatusCode]\n "
                    + "  WHERE rownum >= (? - 1)*? + 1 AND rownum <= ? * ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, String[]> entry : params.entrySet()) {
                Integer key = entry.getKey();
                String[] value = entry.getValue();
                if (value[0].equals("Integer")) {
                    stm.setInt(key, Integer.parseInt(value[1]));
                }
                if (value[0].equals("String")) {
                    stm.setString(key, value[1]);
                }
            }
            stm.setInt(params.size() + 1, pageIndex);
            stm.setInt(params.size() + 2, pageSize);
            stm.setInt(params.size() + 3, pageIndex);
            stm.setInt(params.size() + 4, pageSize);

            ResultSet rs = stm.executeQuery();
            AccountStatusCode sc;
            Account a;
            Customer c;
            while (rs.next()) {
                sc = new AccountStatusCode(rs.getShort("StatusCode"), rs.getString("StatusName"));

                a = new Account();
                a.setId(rs.getInt("AccountID"));
                a.setEmail(rs.getString("Email"));
                a.setRole(rs.getBoolean("Role"));
                a.setStatusCode(sc);
                a.setGoogleID(rs.getString("GoogleID"));

                c = new Customer();
                c.setAccount(a);
                c.setFirstName(rs.getString("FirstName"));
                c.setLastName(rs.getString("LastName"));
                c.setAddress(rs.getString("Address"));
                c.setDob(rs.getDate("Dob"));
                c.setJoinDate(rs.getTimestamp("JoinDate"));
                c.setPhone(rs.getString("Phone"));
                c.setPersonalID(rs.getString("PersonalID"));
                c.setProvince(rs.getString("Province"));
                c.setDistrict(rs.getString("District"));

                customers.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public int countCustomersWithCondition(int cusID, String cusName, String phone,
            String province, String district) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String table_rowNum = "SELECT ROW_NUMBER() OVER (ORDER BY [AccountID] ASC) as rownum, * \n"
                    + "         FROM [Customer] WHERE isDelete = 0 ";
            HashMap<Integer, String[]> params = new HashMap<>();
            int countParam = 0;
            if (cusID != 0) {
                table_rowNum += " AND [AccountID] = ? ";
                countParam++;
                String[] param = new String[2];
                param[0] = "Integer";
                param[1] = cusID + "";
                params.put(countParam, param);
            }
            if (!cusName.isEmpty()) {
                table_rowNum += " AND ([FirstName] like '%'+?+'%' OR [LastName] like '%'+?+'%') ";
                countParam++;
                String[] param = new String[2];
                param[0] = "String";
                param[1] = cusName;
                params.put(countParam, param);

                countParam++;
                param[0] = "String";
                param[1] = cusName;
                params.put(countParam, param);
            }
            if (!phone.isEmpty()) {
                table_rowNum += " AND [Phone] = ? ";
                countParam++;
                String[] param = new String[2];
                param[0] = "String";
                param[1] = phone;
                params.put(countParam, param);
            }
            if (!province.isEmpty()) {
                table_rowNum += " AND [Province] = ? ";
                countParam++;
                String[] param = new String[2];
                param[0] = "String";
                param[1] = province;
                params.put(countParam, param);
            }
            if (!district.isEmpty()) {
                table_rowNum += " AND [District] = ? ";
                countParam++;
                String[] param = new String[2];
                param[0] = "String";
                param[1] = district;
                params.put(countParam, param);
            }

            String sql = "SELECT COUNT(AccountID) as [total customer]\n"
                    + "  FROM "
                    + "  ( " + table_rowNum + " ) as p";

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, String[]> entry : params.entrySet()) {
                Integer key = entry.getKey();
                String[] value = entry.getValue();
                if (value[0].equals("Integer")) {
                    stm.setInt(key, Integer.parseInt(value[1]));
                }
                if (value[0].equals("String")) {
                    stm.setString(key, value[1]);
                }
            }

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total customer");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void updateInfo(Customer cus) {
        try {
            String sql = "UPDATE [Customer]\n"
                    + "   SET [FirstName] = ?\n"
                    + "      ,[LastName] = ?\n"
                    + "      ,[Address] = ?\n"
                    + "      ,[Dob] = ?\n"
                    + "      ,[Phone] = ?\n"
                    + "      ,[PersonalID] = ?\n"
                    + "      ,[Province] = ?\n"
                    + "      ,[District] = ?\n"
                    + " WHERE [AccountID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, cus.getFirstName());
            stm.setString(2, cus.getLastName());
            stm.setString(3, cus.getAddress());
            stm.setDate(4, cus.getDob());
            stm.setString(5, cus.getPhone());
            stm.setString(6, cus.getPersonalID());
            stm.setString(7, cus.getProvince());
            stm.setString(8, cus.getDistrict());
            stm.setInt(9, cus.getAccount().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
