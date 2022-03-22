using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;

namespace crud.Models
{
    public class DBConnection
    {
        public SqlConnection connection;

        public DBConnection()
        {
            connection = new SqlConnection
                   (DBconfig.connectionstr);
        }
    }
}
