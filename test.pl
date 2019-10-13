:- use_module(library(dcg/basics)).
%string_concat(S1,S2,S3).
%split_string(S, Sep, Pad, Subs).
%sub_string(S, Before, Length, After, Sub). % extra params replace with _
%atomics_to_string(L, Separator, S).

%string_chars(S, L).

%string_code().

con(Res) :- string_concat('S1', 'S2', Res). % minus

%split(S, List) :- split_string(S, " ", _, List).
split(L) :- split_string("a b c d", " ", "", L). % plus

subStr(Sub) :- sub_string("abc", 1, 2, _, Sub). % (not only single quotes)

atomicsToString(S) :- atomics_to_string([1,2,3], S). % plus

toChars(L) :- string_chars("xxx", L). % plus

len(L) :- string_length("xox", L). % plus
