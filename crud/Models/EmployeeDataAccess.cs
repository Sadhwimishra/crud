using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using System.Data;

namespace crud.Models
{
    public class EmployeeDataAccess
    {
        DBConnection Dbconnection;
        public EmployeeDataAccess()
        {
            Dbconnection = new DBConnection();
        }

        public List<Employees> GetEmployees()
        {
            string Sp = "SP_EMPLOYEE";
            SqlCommand sql = new SqlCommand(Sp, Dbconnection.connection);
            sql.CommandType = CommandType.StoredProcedure;
            sql.Parameters.AddWithValue("@action", "select_join");
            if(Dbconnection.connection.State==ConnectionState.Closed)
            {
                Dbconnection.connection.Open();
            }
               SqlDataReader dr = sql.ExecuteReader();
               List<Employees>employees = new List<Employees>();
            while(dr.Read())
            {
                Employees Emp = new Employees();
                Emp.id = (int) dr["id"];  
                Emp.name = dr["name"].ToString();
                Emp.email = dr["email"].ToString();
                Emp.mobile = dr["mobile"].ToString();
                Emp.gender = dr["gender"].ToString();
                Emp.DName = dr["department"].ToString();
                employees.Add(Emp);
            }
            Dbconnection.connection.Close();
            return employees;

        }
    }
}
