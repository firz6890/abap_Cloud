*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_ DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.

    " Functional Method
    METHODS get_output
      RETURNING
        VALUE(r_output) TYPE string_table.

 METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.

    CLASS-DATA conn_counter TYPE i.



  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES: BEGIN OF st_details,
             DepartureAirport   TYPE /dmo/airport_from_id,
             DestinationAirport TYPE /dmo/airport_to_id,
             AirlineName        TYPE /dmo/carrier_name,
           END OF st_details.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id   TYPE /dmo/airport_to_id.

    DATA carrier_name TYPE /dmo/carrier_name.


    DATA details TYPE st_details.

ENDCLASS.

CLASS lcl_ IMPLEMENTATION.

METHOD constructor.

*    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
*      RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.

SELECT SINGLE
FROM /DMO/I_Connection
FIELDS DepartureAirport, DestinationAirport, \_Airline-Name as airlinename
WHERE AirlineID = @i_carrier_id AND
      ConnectionID = @i_connection_id
*      INTO ( @airport_from_id, @airport_to_id, @carrier_name  ).
*       INTO @DETAILS. "voy a remplazar el into por un into corresponding
  into CORRESPONDING FIELDS OF @details.

ENDMETHOD.

  METHOD get_output.
    APPEND |--------------------------------|                    TO r_output.
    APPEND |Carrier:     { carrier_id } { details-airlinename }| TO r_output.
    APPEND |Connection:  { connection_id   }|                    TO r_output.
    APPEND |Departure:   { details-departureairport     }|       TO r_output.
    APPEND |Destination: { details-destinationairport   }|       TO r_output.
  ENDMETHOD.


ENDCLASS.
