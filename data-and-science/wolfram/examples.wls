(* Run: wolframscript -file examples.wls
   No additional packages or input files are required. *)

(* 1. Comments use these delimiters and may span multiple lines. *)

(* 2. Values: expressions have heads describing their structure/type.
   Built-in names are capitalized; user-defined names here are lowercase. *)
count = 3;                       (* Integer *)
temperature = 21.5;              (* Real: approximate number *)
ready = True;                    (* Boolean value *)
language = "Wolfram Language";   (* String *)
exactFraction = 1/3;             (* Exact Rational; not a decimal approximation *)
unavailable = Missing["NotAvailable"];
Print[Head[count], ", ", Head[temperature], ", ", Head[language]];
Print[exactFraction, " as a decimal: ", N[exactFraction]];

(* Semicolons suppress automatic output; Print explicitly displays values. *)

(* 3. Lists use braces; [[...]] extracts parts using one-based indices. *)
scores = {72, 85, 91};
Print[scores[[1]]];
Print[Select[scores, # >= 80 &]];  (* # is a pure-function argument; & ends it *)
person = <|"name" -> "Ada", "active" -> True|>;  (* Association *)
Print[person["name"]];

(* 4. Functions use square brackets, not parentheses.
   name_ is a pattern argument; := evaluates the right side on each call. *)
greet[name_] := "Hello, " <> name <> "!";
Print[greet["Ada"]];

(* Module gives intermediate names local scope. *)
labelReading[value_] := Module[{rounded},
    rounded = Round[value, 0.1];
    "Reading: " <> ToString[rounded]
];
Print[labelReading[21.47]];

(* 5. Branching, iteration, and mapping over a list. *)
If[ready, Print["Ready to analyze measurements"]];
Do[Print["Visit: ", label], {label, {"baseline", "follow-up"}}];
Print[Map[greet, {"Ada", "Grace"}]];
Print[Table[labelReading[value], {value, {21.47, 22.18}}]];

(* 6. Symbolic expressions and replacement rules are first-class features.
   Module keeps x symbolic even if the caller already assigned x a value. *)
Module[{x, expression},
    expression = (x + 1)^2;
    Print[Expand[expression]];
    Print[expression /. x -> 3]
];
Print[DeleteMissing[{21.5, unavailable, 22.0}]];
