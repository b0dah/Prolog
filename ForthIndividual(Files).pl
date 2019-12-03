
readda :- 
	open('/Users/bodah/dev/prolog/TextFiles/input.txt',read,In),
	repeat,
	read_line_to_codes(In,X),writef(" "),
	writef(X),nl,
	X=end_of_file,!,
	nl,
	close(In).
	
writefacts:-
	open('/Users/bodah/dev/prolog/TextFiles/output.txt',write,Out),
	write(Out,'Age(Peter,30)'),
	write(Out,'Skin(Smith,Black).'),
	close(Out).  
	
%1. Из заданного файла прочитать приведенные строки, 
%	вывести в файл result.txt 
%	строки, образованные удалением слов, которые встречаются в файле более трех раз,
%	 и добавлением в конце каждой строки тех слов из этой строки, 
%	которые встречаются в файле ровно один раз в том порядке, в котором они встретились в строке.

%divide into a list of strings
fileToListOfStrings(L) :- seen, see('/Users/bodah/dev/prolog/TextFiles/input.txt'), readStringsFromFile([],[],L), seen.
	
readStringsFromFile(T,R,L) :- get0(X), 
(X<0, (T=[], L=R; name(T1, T), append(R, [T1], L)), ! ;

 (X=10; X=13),
 (T=[], readStringsFromFile(T, R, L); name(T1, T),
 	append(R, [T1], R1), readStringsFromFile([], R1, L )), !;
 	X>0, append(T, [X], T1), readStringsFromFile(T1, R, L), !).

%divide into a list of words
fileToListOfWords(L) :- seen, see('/Users/bodah/dev/prolog/TextFiles/input.txt'), readWords([],[],L), seen.
	
readWords(T,R,L) :- get0(X), 
(X<0, (T=[], L=R; name(T1, T), append(R, [T1], L)), ! ;

(X=32; X=10; X=13),
 (T=[], readWords(T, R, L); name(T1, T),
 	append(R, [T1], R1), readWords([], R1, L )), !;
 	X>0, append(T, [X], T1), readWords(T1, R, L), !).


%solve(Res) :- fileToListOfWords(L), deleteQuadruples(L, Res).
%
%deleteQuadruples([H|R], R) :- count_occurrences(L, ).

%count_occurrences(List, Occ):-
%	findall([X,L], (bagof(true,member(X,List),Xs), length(Xs,L)), Occ).
	
count_occurrences(List, Occ, Count):-
bagof(true,member(Occ,List),Xs), length(Xs,L), Count is L.
	
	