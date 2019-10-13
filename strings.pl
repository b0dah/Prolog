
use_module(library(dcg/basics)).

myWrite(X) :- write(X).

%string_concat(S1,S2,S3).
%split_string(S, Sep, Pad, Subs).
%sub_string(S, Before, Length, After, Sub). % extra params replace with _
%atomics_to_string(L, Separator, S).

%string_chars(S, L).
%string_length(S, Length).

%string_code().

% дана строка, вывести три раза через запятую

printThreeTimes(S) :- string_concat(S, " , ", Res), write(Res), write(Res), write(Res), string_length(S, L), write(L).

% дана строка, вывести первый, последний и средний
printFirst(S):- sub_string(S, 0, 1, _, Sub), write(Sub).

%firstMiddleLast(S) :- string_length(S, L), Y is L mod 2, Y = 1, ! ,
%		 Half is L div 2, sub_string(S, Half, 1, Z1).
%firstMiddleLast(S) :- string_length(X, L), .

% дана строка, показать номера символов, совпадающих с последним символом строки
numberOfContains(S) :- Length is string_length(S), sub_string(S, _, 1, Length, Last), sub_string(S, I, 1, _, Last ), write(I), write(" ").

%удалить в строке все вхождения "abc"
split_string.
atomics_to_string.

% replace multiple spaces with a single one and cut out ones on the beginning and end of the line 
