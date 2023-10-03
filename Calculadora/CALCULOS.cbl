      ******************************************************************
      * Author:  Christian Pulgar
      * Date:    12/09/2023
      * Purpose: Calculadora em COBOL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULOS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-MODO                  PIC X(01).

       77 WS-NUMERO-1                 PIC 9(02).
       77 WS-NUMERO-2                 PIC 9(02).

       77 WS-RESULT                PIC 9(03).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            INITIALISE WS-MODO
                       WS-NUMERO-1
                       WS-NUMERO-2
                       WS-RESULT

            DISPLAY "*************************************************"
            DISPLAY "Seleccione la operación:"
            DISPLAY "<1> para sumar"
            DISPLAY "<2> para restar"
            DISPLAY "<3> para dividir"
            DISPLAY "<4> para multiplicar"
            DISPLAY "*************************************************"
            ACCEPT WS-MODO

            DISPLAY "Primer numero:"
            ACCEPT WS-NUMERO-1

            DISPLAY "Segundo numero:"
            ACCEPT WS-NUMERO-2


            EVALUATE WS-MODO
                   WHEN "1"
                       PERFORM PROC-SUMAR
                               THRU PROC-SUMAR-END
                   WHEN "2"
                       PERFORM PROC-RESTA
                               THRU PROC-RESTA-END
                   WHEN "3"
                       PERFORM PROC-DIVIDIR
                               THRU PROC-DIVIDIR-END
                   WHEN "4"
                       PERFORM PROC-MULTIPLICAR
                               THRU PROC-MULTIPLICAR-END
                   WHEN OTHER
                       DISPLAY "Valor Invalido!"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
            END-EVALUATE

            DISPLAY "*************************************************"
            DISPLAY "Desea continuar?"
            DISPLAY "<S> para continuar"
            DISPLAY "<CUALQUER TECLA> para salir"
            DISPLAY "*************************************************"
            ACCEPT WS-MODO

            EVALUATE WS-MODO
                   WHEN "S"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
                   WHEN "s"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
                   WHEN OTHER
                       PERFORM PROC-ENCERRAR

            END-EVALUATE

            .
       MAIN-PROCEDURE-END.

       PROC-SUMAR.
            COMPUTE WS-RESULT = WS-NUMERO-1 + WS-NUMERO-2

            DISPLAY "La suma de " WS-NUMERO-1 " y " WS-NUMERO-2
                    " es : " WS-RESULT
            .
       PROC-SUMAR-END.

       PROC-RESTA.
            COMPUTE WS-RESULT = WS-NUMERO-1 - WS-NUMERO-2

            DISPLAY "A resta de " WS-NUMERO-1 " y " WS-NUMERO-2
                    " es: " WS-RESULT
            .
       PROC-RESTA-END.

       PROC-DIVIDIR.
            COMPUTE WS-RESULT = WS-NUMERO-1 / WS-NUMERO-2

            DISPLAY "A division de " WS-NUMERO-1 " y " WS-NUMERO-2
                    " es: " WS-RESULT
            .
       PROC-DIVIDIR-END.

       PROC-MULTIPLICAR.
            COMPUTE WS-RESULT = WS-NUMERO-1 * WS-NUMERO-2

            DISPLAY "A multiplicacion de " WS-NUMERO-1 " y " WS-NUMERO-2
                    " es: " WS-RESULT
            .
       PROC-MULTIPLICAR-END.

       PROC-ENCERRAR.
            STOP RUN.
       END PROGRAM CALCULOS.
