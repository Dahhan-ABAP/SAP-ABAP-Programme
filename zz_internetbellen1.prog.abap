*&---------------------------------------------------------------------*
*& Report ZZ_INTERNETBELLEN1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZZ_INTERNETBELLEN1.

***wir definieren einen Type
* matriNR   vorname  nachname  modul note   anzahl_sem

TYPES : BEGIN OF ty_student ,
          matrikel    TYPE n LENGTH 10,
          vorname(30) TYPE c,
          nachname    TYPE c LENGTH 20,
          modul(25)   TYPE c,
          note        TYPE p DECIMALS 2,
          anzahl_sem  TYPE i,
        END OF ty_student.

*Definition von Student Struktur basierend auf unsere ty_student

DATA : ls_student  TYPE ty_student.

**Deklaration von Zwei arten von tabellen
*****01 Standard Table
DATA : lt_st_data   TYPE STANDARD TABLE OF ty_student.

****02  Sorted Tabele

DATA lt_sor_data  TYPE SORTED TABLE OF ty_student WITH UNIQUE KEY matrikel.
DATA lt_sor_data02 TYPE SORTED TABLE OF ty_student WITH NON-UNIQUE KEY  matrikel. ""  Doplekat

**Daten in der Tabelle einfügen ( INSERT)
****erste Student 01
ls_student-matrikel = '123'.
ls_student-vorname = 'ASSYA'.
ls_student-nachname = 'Dahhan'.
ls_student-modul    =  'SAP abap'.
ls_student-note     =  '1.7'.
ls_student-anzahl_sem = 2.
*
*INSERT ls_student INTO TABLE lt_st_data . " Standard Table
*INSERT ls_student INTO TABLE lt_sor_data.  " Sorted mit eindeutige Schlüssel
*INSERT ls_student INTO TABLE lt_sor_data02. " dplikat

APPEND ls_student TO lt_st_data . " hier ews geht um Standard Table
APPEND ls_student TO  lt_sor_data.  " Sorted mit eindeutige Schlüssel
APPEND  ls_student TO  lt_sor_data02. " dplikat


****erste Student 01
ls_student-matrikel = '124'.
ls_student-vorname = 'Fatima'.
ls_student-nachname = 'Courdi'.
ls_student-modul    =  'SAP abap'.
ls_student-note     =  '1.7'.
ls_student-anzahl_sem = 4.

APPEND ls_student TO lt_st_data . "  Standard Table
APPEND ls_student TO  lt_sor_data.  " Sorted mit eindeutige Schlüssel
APPEND  ls_student TO  lt_sor_data02. " dplikat Sorted table

****erste Student 01
ls_student-matrikel = '125'.
ls_student-vorname = 'Hajar'.
ls_student-nachname = 'Dahhan'.
ls_student-modul    =  'Statistik'.
ls_student-note     =  '2.0'.
ls_student-anzahl_sem = 3.

APPEND ls_student TO lt_st_data . " Standard Table
APPEND ls_student TO  lt_sor_data.  " Sorted mit eindeutige Schlüssel
APPEND  ls_student TO  lt_sor_data02. " dplikat Sorted Table



cl_demo_output=>display( lt_st_data ).
cl_demo_output=>display( lt_sor_data ).
cl_demo_output=>display( lt_sor_data02 ).
