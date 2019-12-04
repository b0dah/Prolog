
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

% count of element occurences in the list
count_occurrences(Occ, List, Count):-
bagof(true,member(Occ,List),Xs), length(Xs,L), Count is L.

% delete 4 times occurrences
delete4x([], Res, Res) :- !.
delete4x([H|T], Res, Ans) :- count_occurrences(H, T, C), C>2, delete([H|T], H, Res1), !, delete4x(Res1, Res, Ans).
delete4x([H|T], Res, Ans) :- append(Res,[H],Res1), delete4x(T, Res1, Ans). 

% /////////// MAIN //////////////
solve(Res) :- fileToListOfWords(L), delete4x(L, [], Res).



%/////////////////// LEGACY ////////////////////////
%
%ind4([],R,R):-!.	 % WORKS WITH THE SOURCE LIST IN TWO LAST PARAMETERS
%ind4([H|T],Res,Ans):-count_occurrences(H,T,Count),Count > 2,!,include(is_not(H),Res, IntermRes),ind4(T,IntermRes,Ans).	
%ind4([H|T],Res,Ans):-ind4(T,Res,Ans).
%
%is_not(X, Y) :- X \= Y.

%
%deleteQuadruples([], []) :- !.
%deleteQuadruples([H|R], ResList) :- count_occurrences(H, [H|R], C), C > 3, !, deleteQuadruples(R, ResList).
%deleteQuadruples([H|R], [H|ResList]) :- deleteQuadruples(R, ResList).
