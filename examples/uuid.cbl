IDENTIFICATION DIVISION.
PROGRAM-ID.  uuid.

DATA DIVISION.
      

WORKING-STORAGE SECTION.
    
    01 random-bytes.
      10 bytes-group-1    PIC  9(10). 
      10 bytes-group-2    PIC  9(5). 
      10 bytes-group-3    PIC  9(5). 
      10 bytes-group-4    PIC  9(5). 
      10 bytes-group-5    PIC  9(24).


    01 uuid.  
      10 uuid-group-1     PIC   X(8) VALUE ZEROS.
      10 first-delimiter  PIC   X(1) VALUE '-'.
      10 uuid-group-2     PIC   X(4) VALUE ZEROS.
      10 second-delimiter PIC   X(2) VALUE '-4'.
      10 uuid-group-3     PIC   X(3) VALUE ZEROS.
      10 third-delimiter  PIC   X(1) VALUE '-'.
      10 uuid-group-4     PIC   X(4) VALUE ZEROS.
      10 fourth-delimiter PIC   X(1) VALUE '-'.
      10 uuid-group-5     PIC   X(12) VALUE ZEROS.   


    01 WS-CURRENT-DATE-DATA.
      05  WS-CURRENT-DATE.
        10  WS-CURRENT-YEAR         PIC 9(04).
        10  WS-CURRENT-MONTH        PIC 9(02).
        10  WS-CURRENT-DAY          PIC 9(02).
      05  WS-CURRENT-TIME.
        10  WS-CURRENT-HOURS        PIC 9(02).
        10  WS-CURRENT-MINUTE       PIC 9(02).
        10  WS-CURRENT-SECOND       PIC 9(02).
        10  WS-CURRENT-MILLISECONDS PIC 9(02).

    77 decimal-number   PIC 9(18) COMP. 
    77 dec-remainder    PIC 99 COMP. 
    77 dec-quotient     PIC 9(9) COMP. 
    77 hex-digits       PIC X(16) VALUE "0123456789ABCDEF". 
    77 hex-string       PIC X(12) VALUE ZEROS. 
    77 hex-output       PIC X(12) VALUE ZEROS. 

PROCEDURE DIVISION.

    PERFORM GENERATE-RANDOM-BYTES.

    PERFORM FORMAT-FIRST-GROUP.
    PERFORM FORMAT-SECOND-GROUP.
    PERFORM FORMAT-THIRD-GROUP.
    PERFORM FORMAT-FOURTH-GROUP.
    PERFORM FORMAT-FIFTH-GROUP.

    DISPLAY uuid.
    STOP RUN.

    FORMAT-FIRST-GROUP.
        MOVE bytes-group-1 TO DECIMAL-NUMBER .
        PERFORM CONVERT-TO-HEX 1 TIMES.
        MOVE HEX-STRING to uuid-group-1.

    FORMAT-SECOND-GROUP.
        MOVE bytes-group-2 TO DECIMAL-NUMBER .
        PERFORM CONVERT-TO-HEX 1 TIMES.
        MOVE HEX-STRING to uuid-group-2.

    FORMAT-THIRD-GROUP.
        MOVE bytes-group-3 TO DECIMAL-NUMBER .
        PERFORM CONVERT-TO-HEX 1 TIMES.
        MOVE HEX-STRING to uuid-group-3.

    FORMAT-FOURTH-GROUP.
        MOVE bytes-group-4 TO DECIMAL-NUMBER .
        PERFORM CONVERT-TO-HEX 1 TIMES.
        MOVE HEX-STRING to uuid-group-4.

    FORMAT-FIFTH-GROUP.
        MOVE bytes-group-5 TO DECIMAL-NUMBER .
        PERFORM CONVERT-TO-HEX 1 TIMES.
        MOVE HEX-STRING to uuid-group-5.

    GENERATE-RANDOM-BYTES.
        MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
        COMPUTE bytes-group-1 = FUNCTION RANDOM (WS-CURRENT-MILLISECONDS) * 10000 * 10000 * 10000 .
        COMPUTE bytes-group-2 = FUNCTION RANDOM (bytes-group-1) * 10000 * 10000 * 10000 .
        COMPUTE bytes-group-3 = FUNCTION RANDOM (bytes-group-2) * 10000 * 10000 * 10000 .
        COMPUTE bytes-group-4 = FUNCTION RANDOM (bytes-group-3) * 10000 * 10000 * 10000 .
        COMPUTE bytes-group-5 = FUNCTION RANDOM (bytes-group-4) * 10000 * 10000 * 10000 .

    CONCAT-GROUPS-TO-UUID-STRING.
        STRING uuid-group-1 DELIMITED BY SIZE
               '-'   DELIMITED BY SIZE
               uuid-group-2 DELIMITED BY SIZE
               '-4'   DELIMITED BY SIZE
               uuid-group-3 DELIMITED BY SIZE
               '-'   DELIMITED BY SIZE
               uuid-group-4 DELIMITED BY SIZE
               '-'   DELIMITED BY SIZE
               bytes-group-5 DELIMITED BY SIZE
          INTO uuid
        END-STRING.



    CONVERT-TO-HEX.
        PERFORM WITH TEST AFTER UNTIL DEC-QUOTIENT = ZERO 
            DIVIDE DECIMAL-NUMBER BY 16 
                GIVING DEC-QUOTIENT 
                REMAINDER DEC-REMAINDER 
            END-DIVIDE 
            STRING 
                HEX-DIGITS(DEC-REMAINDER + 1:1) DELIMITED 
                                                BY SIZE 
                HEX-OUTPUT DELIMITED BY SPACES 
                INTO HEX-STRING 
            END-STRING 
            MOVE HEX-STRING TO HEX-OUTPUT 
            MOVE DEC-QUOTIENT TO DECIMAL-NUMBER 
        END-PERFORM .


