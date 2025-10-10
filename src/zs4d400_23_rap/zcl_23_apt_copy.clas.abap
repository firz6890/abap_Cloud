CLASS zcl_23_apt_copy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS: IT_rap TYPE tabname VALUE 'Z23FLIGHT'.
ENDCLASS.



CLASS zcl_23_apt_copy IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: it_flight TYPE TABLE OF z23flight.

*.- Llenamos campos
    it_flight = VALUE #(
        ( uuid = '0001' carrid  = 'AA' connid = '0017' airport_id = 'JPN' name = 'Japon aiport' city = 'Osaka' Country = 'JPN'  )
        ( uuid = '0002' carrid = 'LH' connid = '0400' airport_id = 'USA' name = 'Kennedy aiport' city = 'Las Vegas' Country = 'US'  )
        ( uuid = '0003' carrid = 'AE' connid = '0941' airport_id = 'MXN' name = 'Felipe Angeles' city = 'CDMX' Country = 'MX' )
      ).
*.- Eliminamos datos existentes para que no truene el programa
*DELETE z23flight FROM table @it_flight.
delete from z23flight.

    " Insertar nuevos datos
    INSERT z23flight FROM TABLE @it_flight.
    IF sy-subrc = 0.
      out->write( |Table was filled with data.| ).
    ELSE.
      out->write( |Error filling table.| ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
