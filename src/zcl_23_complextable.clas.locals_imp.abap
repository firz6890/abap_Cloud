*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.

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
    CLASS-METHODS class_constructor.





  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES: BEGIN OF st_details,
             DepartureAirport   TYPE /dmo/airport_from_id,
             DestinationAirport TYPE /dmo/airport_to_id,
             AirlineName        TYPE /dmo/carrier_name,
           END OF st_details.

    TYPES:
      BEGIN OF st_airpoRt,
        airportid TYPE /dmo/airport_id,
        name      TYPE /dmo/airport_name,
      END OF st_airpoRt.

    TYPES tt_aiRports TYPE STANDARD TABLE OF st_airport
            WITH NON-UNIQUE DEFAULT KEY.

    CLASS-DATA airports TYPE tt_airports.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id   TYPE /dmo/airport_to_id.

    DATA carrier_name TYPE /dmo/carrier_name.


    DATA details TYPE st_details.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

    SELECT FROM /DMO/I_Airport
              FIELDS AirportID, Name
                INTO TABLE @airports.


  ENDMETHOD.

  METHOD constructor.

*    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
*      RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.

    SELECT SINGLE
    FROM /DMO/I_Connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name AS airlinename
    WHERE AirlineID = @i_carrier_id AND
          ConnectionID = @i_connection_id
*      INTO ( @airport_from_id, @airport_to_id, @carrier_name  ).
*       INTO @DETAILS. "voy a remplazar el into por un into corresponding
      INTO CORRESPONDING FIELDS OF @details.
*********************************************************************


  ENDMETHOD.

  METHOD get_output.

    DATA(departure) = airports[ airportid = details-DepartureAirport ].
    DATA(destination) = airports[ airportid = details-destinationairport ].

*.- el ejercicio comentaba esto tambien
*Optional: Omit the structured data object and use the table expressions directly in the string templates.
*
*Comment the code lines where you fill the structures departure and destination.
*
*In the string template replace departure-name with airports[ airportid = details-departureairport ]-name.
*
*Similarly replace destination-name with airports[ airportid = details-destination ]-name.

*.- fin



    APPEND |Departure:   { details-departureairport   } { departure-name   }| TO r_output.
    APPEND |Destination: { details-destinationairport } { destination-name }| TO r_output.

*    APPEND |--------------------------------|                    TO r_output.
*    APPEND |Carrier:     { carrier_id } { details-airlinename }| TO r_output.
*    APPEND |Connection:  { connection_id   }|                    TO r_output.
*    APPEND |Departure:   { details-departureairport     }|       TO r_output.
*    APPEND |Destination: { details-destinationairport   }|       TO r_output.
  ENDMETHOD.


ENDCLASS.
