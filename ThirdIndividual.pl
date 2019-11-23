% Даны две строки, состоящие из слов, разделенных пробелами.
% Сформировать строку, состоящую из слов, которые встречаются только в одной из строк.

% FirstString is "ooo xxx".

%containedInBothLists(El, L1, L2) :- member(El, L1), member(El, L2). 
%
%solve(F, S, Res) :- split_string(F, ' ', '', FList), split_string(S, ' ', '', SList), deleteDublicates(L1, L2).

%//////////
containedInOnly1of2Lists(El, L1, L2) :- member(El, L1), not(member(El, L2)).
containedInOnly1of2Lists(El, L1, L2) :- member(El, L2), not(member(El, L1)).

notEqualTo(A, B) :- A\=B.

%solve(F,S, Res) :- split_string(F, ' ', '', [FH|FR]), split_string(S, ' ', '', [SH|SR]), include(not(member(FH, [SH|SR])), FR, Res).%, include(not(member(SH, [FH|FR])), SR, Res). 		
%solve(F,S, Res) :- split_string(F, ' ', '', [FH|FR]), split_string(S, ' ', '', [SH|SR]), include(notEqualTo(FH), [SH|SR], Res).

%solve(F,S, NewRes) :- split_string(F, ' ', '', [FH|FR]), split_string(S, ' ', '', [SH|SR]), not(member(FH, [SH|SR])), !, append(FH, Res, NewRes).

%1
solve(F,S, StringRes) :- split_string(F, ' ', '', FL), split_string(S, ' ', '', SL), workWithLists(FL, SL, Res), atomics_to_string(Res, " ", StringRes).

workWithLists([], _, []) :- !.
workWithLists([FH|FR], S, [FH|Res]):- not(member(FH, S)), ! , workWithLists(FR, S, Res).
workWithLists([FH|FR], S, Res):- workWithLists(FR, S, Res).



%1. разделить оба на списки
%2. сделать include в рущльтирующий список по условию containedInOnly1of2Lists()
%3. convert from list to String

%//////////Dan's///////////// 
%Перечислить все слова заданного предлождения, которые состоят из тех же букв, что и первое слово
%solve_str(Inp,Out):-split_string(Inp," ","",[H|T]),include(same_character(H),T,Out).
%
%same_character(A,B):-string_codes(A,Alist),string_codes(B,Blist),sort(Alist,As),sort(Blist,Bs),list_to_set(As,Ar),list_to_set(Bs,Br),Ar = Br.
%//////// Test ///////////////////////
cond(X, Y) :- Y>X.

test([H|T], Res) :- include(cond(H), T, Res).
