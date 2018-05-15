IDENTIFICATION DIVISION.
PROGRAM-ID.  uuid.

DATA DIVISION.
      
WORKING-STORAGE SECTION.

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

    77 decimal-number   PIC 9(3) VALUE 0. 
    77 dec-remainder    PIC 99 COMP. 
    77 dec-quotient     PIC 9(9) COMP. 
    77 hex-digits       PIC X(16) VALUE "0123456789ABCDEF". 
    77 hex-string       PIC X(2) VALUE ZEROS. 
    77 hex-output       PIC X(2) VALUE ZEROS. 

    77 random-temp     PIC 9(9) COMP. 

PROCEDURE DIVISION.

    PERFORM GENERATE-1-of-18-UUID 18 TIMES.

    MOVE '-' TO first-delimiter.
    MOVE '-4' TO second-delimiter.
    MOVE '-' TO third-delimiter.
    MOVE '-' TO fourth-delimiter.

    DISPLAY uuid.
    STOP RUN.

   GENERATE-1-of-18-UUID.
        PERFORM GENERATE-RANDOM-BYTES.
        PERFORM CONVERT-TO-HEX.
        PERFORM CONCAT-GROUPS-TO-UUID-STRING.

    GENERATE-RANDOM-BYTES.
        ADD 1 TO random-temp GIVING random-temp;
        MULTIPLY FUNCTION NUMVAL(FUNCTION CURRENT-DATE(13:4)) BY random-temp GIVING random-temp;
        MULTIPLY 31 BY random-temp GIVING random-temp;
        COMPUTE decimal-number = FUNCTION RANDOM (random-temp) * 100000000000000000000000000000000000000000 .

    CONCAT-GROUPS-TO-UUID-STRING.
        STRING hex-string DELIMITED BY SIZE
               uuid DELIMITED BY SIZE
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


