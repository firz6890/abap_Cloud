CLASS zcl_23_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_23_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.

    agencies_upd = VALUE #(  ( agencyid = '070023' name = 'Fabians Airlines' ) ).

    MODIFY ENTITIES OF /DMO/I_AgencyTP
    ENTITY /DMO/Agency
    UPDATE FIELDS ( name )
    WITH agencies_upd.

    COMMIT ENTITIES.

    out->write( 'Method execution finished!' ).

  ENDMETHOD.
ENDCLASS.
