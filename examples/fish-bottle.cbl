IDENTIFICATION DIVISION.
PROGRAM-ID.  fish-bottle.
DATA DIVISION.

WORKING-STORAGE SECTION.
    01 argv pic 99.
    01 temp pic 99.
    01 fish pic 99.
        88 is-fish value 0.
    01 bottle pic 99.
        88 is-bottle value 0.
    01 fish-bottle pic 99.
        88 is-fish-bottle value 0.
PROCEDURE DIVISION.
    ACCEPT argv FROM argument-value
    DIVIDE argv BY 15 GIVING temp REMAINDER fish-bottle.
    DIVIDE argv BY 5 GIVING temp REMAINDER bottle.
    DIVIDE argv BY 3 GIVING temp REMAINDER fish.
    Evaluate True
        When  is-fish-bottle
              Display "fish-bottle"
        When  is-bottle
              Display "bottle"
        When  is-fish
              Display "fish"
        When Other
              Display argv
    End-Evaluate
    STOP RUN.
