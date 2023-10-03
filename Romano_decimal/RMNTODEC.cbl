      ******************************************************************
      * Author:  Christian Pulgar
      * Date:    12/09/2023
      * Purpose: Romanos a decimales
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. RMNTODEC.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-ROMANO                 PIC X(09) VALUE SPACES.
       77 WS-NUMERO               PIC 9(04) VALUE ZEROES.

       77 WS-QTDDGT                PIC 9(02).
       77 WS-STATUS                PIC X(01).
       77 WS-CURDGT                PIC X(01).

       77 WS-COUNT-2               PIC 9(01) VALUE 0.

       PROCEDURE DIVISION.
       P-MAIN.

            INITIALISE WS-ROMANO
                       WS-NUMERO

            DISPLAY
            "**********************************************************"
            DISPLAY
            "*                                                        *"
            DISPLAY
            "*               ROMAN TO DECIMAL CONVERTER               *"
            DISPLAY
            "*              The app does not feature '_'              *"
            DISPLAY
            "*                                                        *"
            DISPLAY
            "**********************************************************"

            DISPLAY " "

            DISPLAY
            "Insert a value to convert: (9 digits-max)"

            ACCEPT WS-ROMANO

            PERFORM P-CALC THRU P-CALC-END.

       P-MAIN-END.

       P-CALC.

            COMPUTE WS-COUNT-2 = 1

            PERFORM 9 TIMES
               MOVE WS-ROMANO(WS-COUNT-2:1) TO WS-CURDGT

               EVALUATE WS-CURDGT
                   WHEN 'M'
                       COMPUTE WS-NUMERO = WS-NUMERO + 1000

                   WHEN 'D'
                       COMPUTE WS-NUMERO = WS-NUMERO + 500

                   WHEN 'C'
                       COMPUTE WS-NUMERO = WS-NUMERO + 100

                   WHEN 'L'
                       COMPUTE WS-NUMERO = WS-NUMERO + 50

                   WHEN 'X'
                       COMPUTE WS-NUMERO = WS-NUMERO + 10

                   WHEN 'V'
                       COMPUTE WS-NUMERO = WS-NUMERO + 5

                   WHEN 'I'
                       COMPUTE WS-NUMERO = WS-NUMERO + 1


                   WHEN 'm'
                       COMPUTE WS-NUMERO = WS-NUMERO + 1000

                   WHEN 'd'
                       COMPUTE WS-NUMERO = WS-NUMERO + 500

                   WHEN 'c'
                       COMPUTE WS-NUMERO = WS-NUMERO + 100

                   WHEN 'l'
                       COMPUTE WS-NUMERO = WS-NUMERO + 50

                   WHEN 'x'
                       COMPUTE WS-NUMERO = WS-NUMERO + 10

                   WHEN 'v'
                       COMPUTE WS-NUMERO = WS-NUMERO + 5

                   WHEN 'i'
                       COMPUTE WS-NUMERO = WS-NUMERO + 1

                   WHEN OTHER
                       COMPUTE WS-NUMERO = WS-NUMERO + 0

               END-EVALUATE

               ADD 1 TO WS-COUNT-2

            END-PERFORM.

            PERFORM P-END

            .
       P-CALC-END.

       P-END.

            DISPLAY
            " "
            DISPLAY
            "**********************************************************"
            DISPLAY
            " "
            DISPLAY
            "The result is: " WS-NUMERO

            DISPLAY
            "**********************************************************"
            DISPLAY
            "*                                                        *"
            DISPLAY
            "*              DO YOU WANT TO CONVERT AGAIN              *"
            DISPLAY
            "*                    Y(yes)\OTHER(no)                    *"
            DISPLAY
            "*                                                        *"
            DISPLAY
            "**********************************************************"

            ACCEPT WS-STATUS

            EVALUATE WS-STATUS
               WHEN "Y"
                   PERFORM P-MAIN THRU P-MAIN-END
               WHEN "y"
                   PERFORM P-MAIN THRU P-MAIN-END
               WHEN OTHER
                   STOP RUN
            END-EVALUATE

            STOP RUN.
       END PROGRAM RMNTODEC.
