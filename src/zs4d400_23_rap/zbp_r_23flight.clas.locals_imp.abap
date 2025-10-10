CLASS lhc_zr_23flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validatePrice.

ENDCLASS.

CLASS lhc_zr_23flight IMPLEMENTATION.

  METHOD get_global_authorizations.

  ENDMETHOD.
  METHOD validatePrice.
  ENDMETHOD.

ENDCLASS.
