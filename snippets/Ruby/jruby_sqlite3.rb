####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan
# @description 	Sample script working with the jdbc-sqlite3
# @date 	2016-01-21
# @licence  GPL 2.0
####################################################################################################

require 'jdbc/sqlite3'

Jdbc::SQLite3.load_driver
connection = java.sql.DriverManager.getConnection 'jdbc:sqlite:test.db'
begin
  statement = connection.createStatement
  begin
    statement.executeUpdate("CREATE TABLE tablename (column_a text, column_b text)")
    statement.executeUpdate("INSERT INTO tablename VALUES ('A', 123)")
    statement.executeUpdate("INSERT INTO tablename VALUES ('B', 456)")
    statement.executeUpdate("INSERT INTO tablename VALUES ('C', 'SEVEN EIGHT NINE')")
  rescue java.sql.SQLException => e
    unless e.message == "table tablename already exists" then raise e; end
  end

  rs = statement.executeQuery("select * from tablename")
  column_names = "column_a\tcolumn_b"
  puts column_names
  while rs.next
    puts ["#{rs.getString("column_a")}", "#{rs.getString("column_b")}"].join("\t")
  end
ensure
  rs.close
  statement.close
  connection.close
end

=begin
column_a        column_b
A       123
B       456
C       SEVEN EIGHT NINE
=end
