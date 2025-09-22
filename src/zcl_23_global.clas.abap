CLASS zcl_23_global DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_23_global IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  data connection type ref to lcl_connection.
*  data connection2 type ref to lcl_connection.
*data: connections type ref to lcl_connection.
data connections type table of ref to lcl_connection.

* First Instance
**********************************************************************
  connection = new #(  ).
  connection->carrier_id    = 'LH'.
  connection->connection_id = '0400'.
*  connection->conn_counter = 10.
  append connection to connections.

* Second Instance
**********************************************************************
  connection = new #(  ).
  connection->carrier_id    = 'AA'.
    connection->connection_id = '0017'.
  append connection to connections.

* Third Instance
**********************************************************************
connection = NEW #(  ).
    connection->carrier_id    = 'SQ'.
    connection->connection_id = '0001'.

    APPEND connection TO connections.


*connection->carrier_id = 'LH'.
*connection->connection_id = '0400'.
*
*connection2 = connection.

lcl_connection=>conn_counter = 10. "ejemplo de llamada de variable con Class-data

  ENDMETHOD.
ENDCLASS.
