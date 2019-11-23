%write(X).
%writeln(X).

%tab(N).

%display(2+3).



%% run :- see('numbers.txt'), readln(X), seen, write(X).

%% %to run
%% fileToList(F, L) :- seen, see(F), readfile([],[],L), seen.

%% readfile(T,R,L) :- get0(X), (X<0, (T=[], L=R;
%% 	name(T1, T), append(R, [T1], L)), ! ;

%% (X=32, X=10, X=13),
%% (T=[], readfile(T, R, L); name(T1, T),
%% 	append(R, [T1], R1), readfile([], R1, L )), !;
%% 	X>0, append(T, [X], T1), readfile(T1, R, L), !).

% ///////////////////////////////////////////////////////////////////////////
% В файле слова, разделенная точками, вывести список слов без повторений

run:-see('/Users/bodah/dev/Prolog/numbers.txt'), readln(X), seen, write(X).

fileToList(F, L):-seen, see(F), readFile([], [], L), seen.

readFile(T, R, L):-get0(X), (X<0, (T=[], L=R; name(T1, T), append(R, [T1], L)), !;
	(X=32; X=10; X=13), (T=[], readFile(T, R, L); 
		name(T1, T), 

		append(R, [T1], R1), readFile([], R1, L)), !; 
	X>0, append(T, [X], T1), readFile(T1, R, L), !).
