/* Run: sas examples.sas
   Uses temporary WORK data sets; no external files are required.
   PROC FCMP requires a SAS installation that supports this procedure. */

/* 1. Comments: block comments use slash-star delimiters. */
* A statement comment ends with a semicolon;

/* 2. Functions: compile a small numeric function for DATA step use. */
proc fcmp outlib=work.intro_functions.helpers;
    function is_passing(score);
        /* Numeric missing values sort below ordinary numbers in SAS. */
        if missing(score) then return (.);
        return (score >= 80);
    endsub;
run;
options cmplib=(work.intro_functions);

/* 3. Core types: SAS variables are numeric or character.
   Dates are numeric values with date formats; logical results are 1 or 0.
   A DATA step builds observations (rows) from variables (columns). */
data work.intro_types;
    length language $ 12;        /* Declare character length before assignment */
    language = 'SAS';
    count = 3;
    temperature = 21.5;
    ready = 1;
    visit_date = '05NOV2026'd;    /* Date literal; days since 01JAN1960 */
    format visit_date date9.;    /* Formatting changes display, not storage */
    unavailable = .;            /* Numeric missing value */
    put language= count= temperature= ready= visit_date=;
run;

/* 4. Read a tiny table: $ marks a character field; . is numeric missing.
   The DATA step implicitly repeats for each input row. */
data work.intro_scores;
    length name $ 12 status $ 10;
    input name $ score;
    passing = is_passing(score);

    /* 5. Branching: check missingness explicitly before comparison. */
    if missing(score) then status = 'unknown';
    else if passing then status = 'pass';
    else status = 'practice';
    datalines;
Ada 85
Grace .
Linus 72
;
run;

/* 6. Arrays group variables within a row, not rows within a data set.
   Temporary arrays do not add stored columns; indexing starts at one here. */
data _null_;
    array visits[2] $ 12 _temporary_ ('baseline' 'follow-up');
    do index = 1 to dim(visits);
        put visits[index]=;
    end;
run;

/* Procedures analyze or display the data created by DATA steps. */
proc print data=work.intro_scores noobs;
run;

proc means data=work.intro_scores n nmiss mean;
    var score;
run;
