CLASS zcl_23_instance_itab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_23_instance_itab IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection  TYPE REF TO lcl_connection.
    DATA connections  TYPE TABLE OF REF TO lcl_connection.

* First Instance
**********************************************************************
*    connection = NEW #(  ).
*
*    TRY.
*        connection->set_attributes(
*        EXPORTING
*          i_carrier_id    = 'LH'
*          i_connection_id = '0400'
*          ).


*    TRY.
*        connection->set_attributes(
*        EXPORTING
*          i_carrier_id    = 'LH'
*          i_connection_id = '0400'
*          ).
*
*
**  connection->carrier_id    = 'LH'.
**  connection->connection_id = '0400'.

* Ejemplo de instancia con constructor
    TRY.
        connection = NEW #(
        i_carrier_id    = 'LH'
                            i_connection_id = '0400'
                             ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed connection 1' ).
    ENDTRY.

* Second Instance
**********************************************************************
*    connection = NEW #(  ).
*
*    TRY.
*        connection->set_attributes(
*        EXPORTING
*          i_carrier_id    = 'AA'
*          i_connection_id = '0017').
*
*
**  connection->carrier_id    = 'AA'.
**    connection->connection_id = '0017'.

* Ejemplo de instancia con constructor
    TRY.
        connection = NEW #(
            i_carrier_id    = 'AA'
                                i_connection_id = '0017'
                                 ).


        APPEND connection TO connections.
*
      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed connection 2' ).
    ENDTRY.


* Third Instance
**********************************************************************
*    connection = NEW #(  ).
*
*    TRY.
*        connection->set_attributes(
*        EXPORTING
*          i_carrier_id    = ' ' "Aqui quite el valor para hacer la prueba del llamado de la excepcion
*          i_connection_id = '0001'
*          ).
*
*
**    connection->carrier_id    = 'SQ'.
**    connection->connection_id = '0001'.

* Ejemplo de instancia con constructor
    TRY.
        connection = NEW #(
            i_carrier_id    = 'SQ'
                                i_connection_id = '0001'
                                 ).


        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed connection 3` ).
    ENDTRY.


* Output
**********************************************************************
    LOOP AT connections INTO connection.

      out->write( connection->get_output( ) ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
