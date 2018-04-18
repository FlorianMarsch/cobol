IDENTIFICATION DIVISION.
PROGRAM-ID.  fish-bottle-test.
DATA DIVISION.

WORKING-STORAGE SECTION.
    01 num pic 99 value 3.
    01 actual pic A(15) VALUE ' '.
   
PROCEDURE DIVISION.
    CALL 'fish-bottle' USING num, actual
    Display actual
    STOP RUN.
