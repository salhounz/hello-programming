% Run: matlab -batch "run('examples.m')"
% No toolboxes or input files are required. Uses script-local functions.

% 1. Comments: % starts a line comment.
%{
Block comments use delimiters on lines of their own.
%}

% 2. Values and types: numbers are double by default.
count = 3;                    % double, even without a decimal point
integerCount = int32(3);       % Explicit integer type
temperature = 21.5;
ready = true;                 % logical
language = "MATLAB";          % String scalar
letters = 'MATLAB';            % Character vector, not a string scalar
unavailable = NaN;             % Numeric missing/undefined value
disp(class(count));
disp(class(language));

% A semicolon suppresses automatic output; disp explicitly prints a value.
disp(letters);

% 3. Arrays: indexing starts at one; : selects ranges or entire dimensions.
scores = [72, 85, 91];         % Row vector
columnScores = scores.';       % Nonconjugating transpose
matrix = [1, 2; 3, 4];         % Semicolon separates matrix rows
firstScore = scores(1);
secondColumn = matrix(:, 2);
disp(secondColumn);

% Cells can hold different types; braces retrieve a cell's contents.
mixed = {"Ada", 36, true};
disp(mixed{1});
person = struct('name', "Ada", 'active', true);
disp(person.name);

% Tables keep named columns together for data analysis.
observations = table(["Ada"; "Grace"], [85; 91], ...
    'VariableNames', {'Name', 'Score'});
disp(observations(observations.Score >= 90, :));

% 4. Functions: anonymous functions are useful for small transformations.
toLabel = @(name) "Participant: " + name;
disp(toLabel("Ada"));
disp(greet("Grace"));

% 5. Control flow and logical indexing.
if ready
    disp("Ready to analyze measurements");
end
for score = scores
    disp(score);
end
disp(scores(scores >= 80));

% 6. Element-wise operators differ from matrix operators.
disp(matrix .^ 2);            % Square each element
disp(matrix ^ 2);             % Matrix multiplication: matrix * matrix
disp(isnan([21.5, NaN, 22]));  % Test NaN with isnan, not == NaN

% Place local functions at the end for compatibility with older releases.
function message = greet(name)
    message = "Hello, " + name + "!";
end
