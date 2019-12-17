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
	write(Out,'\n'),
	write(Out,'Age(Jupeter,30)'),
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
countOccurrences(_,[],0):- !.
countOccurrences(O,[O|T],Y):- countOccurrences(O,T,Z), Y is 1+Z.
countOccurrences(O,[X1|T],Z):- X1\=O, !, countOccurrences(O,T,Z).

% count of element occurences in the 2 dimensions list
countOccurrencesIn2Dims(Occ, L, Count) :- counter(Occ, L, 0, Count). % works
counter(_, [], Res, Res) :-!.
counter(Occ, [H|T], Count, Res) :- countOccurrences(Occ, H, HeadContains), NewCount is Count+HeadContains, counter(Occ, T, NewCount, Res).
	

% delete 4 times occurrences
filter4x(L,R):-delete4x(L, [], R).
delete4x([], Res, Res) :- !.
delete4x([H|T], Res, Ans) :- countOccurrences(H, T, C), C>2, delete([H|T], H, Res1), !, delete4x(Res1, Res, Ans).
delete4x([H|T], Res, Ans) :- append(Res,[H],Res1), delete4x(T, Res1, Ans). 

% удаляет заданный элемент в двумерном массиве | works!
deleteCertain(_, [], []) :- !.
deleteCertain(El, [H|Rest], [NewH|Res]) :- delete(H, El, NewH), deleteCertain(El, Rest, Res). 

% divide list of strings into 2 dims list
divideInto2DimsList([], []) :- !. 
divideInto2DimsList([H|R], [L|TwoDimList]) :- split_string(H, " ", "",L), divideInto2DimsList(R, TwoDimList). % works

% delete 4 times occurences in the 2 dim list <------------
deleteExtra(L, R) :-delete4xInThDimList(L, [], R).
delete4xInThDimList([], Res, Res) :- !.
delete4xInThDimList([[]|R], Res, Ans) :- delete4xInThDimList(R, Res, Ans).
delete4xInThDimList([[H|R]|Rest], Res, Ans) :- countOccurrencesIn2Dims(H, [R|Rest], Count), Count>2, deleteCertain(H, [R|Rest], Deleted), !, delete4xInThDimList(Deleted, Deleted, Ans).
delete4xInThDimList([[H|R]|Rest], Res, Ans) :- delete4xInThDimList([R|Rest], Res, Ans).

%test
rmv(L,R) :- remove2(L, [], R).
remove2([], R, R):- !.
remove2([H|Rest],Res,A):- filter4x(H,Filtered), append(Filtered, Res,NewRes), remove2(Rest, NewRes, A).

%/////// append 3x occ //////////////
%append3xOccurrences(L,R) :- app(L, )

%append 3x occ in q dims list 	WORKS!
oneDimAppend(L,A) :- app(L,L,[],A).
app([], Source, CollectedRest, Ans) :- append(Source, CollectedRest, Ans), !.
app([H|R], Source, CollectedRest, Ans) :- countOccurrences(H, Source,C), C=1, append(CollectedRest, [H], NewCollectedRest), !, app(R, Source, NewCollectedRest, Ans).
app([H|R],Source,CollectedRest,Ans):- app(R,Source,CollectedRest,Ans).

%appen in each line of 2 dims list 	| WORKS!
twoDimsAppend(L, R) :- app2(L,[],R).
app2([],R,R):- !.
app2([H|R], Collected, Ans) :- oneDimAppend(H,NewH), append(Collected, [NewH] ,NewCollected), app2(R,NewCollected, Ans).

%////////// write to file /////////

%two dims list to Strings
twoDimListToString(L,Text) :- toString(L,"", Text). 
toString([],Text,Text) :- !.
toString([H|R],Text, Ans) :- atomics_to_string(H, " ", String), string_concat(Text,String,Concated), string_concat(Concated, "\n", NewText), toString(R, NewText, Ans).

%write stringed list to file
writeTextToFile(Text):- open('/Users/bodah/dev/prolog/TextFiles/output.txt',write,Out),
	write(Out,Text),
	close(Out). 

% /////////// MAIN //////////////
%solve(Res) :- fileToListOfStrings(L), divideInto2DimsList(L, TwoDimL), deleteExtra(TwoDimL, Res).%countOccurrencesIn2Dims("Line", TwoDimL, Res), .%delete4x(L, [], Res).

show(Res) :- fileToListOfStrings(L), divideInto2DimsList(L, Res). 

solve(Text) :- fileToListOfStrings(L), divideInto2DimsList(L, TwoDimL), 
	twoDimsAppend(TwoDimL, AppendedList), twoDimListToString(AppendedList, Text), writeTextToFile(Text).







%/////////////// SUPERPOS ////////////////


%/////////////////// LEGACY ////////////////////////
%
%count_occurrences(Occ, List, Res):- co(Occ, List, [], Res).
%co(Occ, List, Xs, Res) :-	bagof(true,member(Occ,List),Xs), !, Res is 0, length(Xs,L), Res is L.

%ind4([],R,R):-!.	 % WORKS WITH THE SOURCE LIST IN TWO LAST PARAMETERS
%ind4([H|T],Res,Ans):-count_occurrences(H,T,Count),Count > 2,!,include(is_not(H),Res, IntermRes),ind4(T,IntermRes,Ans).	
%ind4([H|T],Res,Ans):-ind4(T,Res,Ans).
%
%is_not(X, Y) :- X \= Y.

%
%deleteQuadruples([], []) :- !.
%deleteQuadruples([H|R], ResList) :- count_occurrences(H, [H|R], C), C > 3, !, deleteQuadruples(R, ResList).
%deleteQuadruples([H|R], [H|ResList]) :- deleteQuadruples(R, ResList).


ocurrenceof([] , _,0). %empty list, count of anything is 0. Base case.

% The first item in the list is the same as what you want to count so
% add 1 to the recursive count.
ocurrenceof([H|T] , H,NewCount):-
 ocurrenceof(T,H,OldCount),
 NewCount is OldCount +1.
%The first item in the list is different so keep old count
ocurrenceof([H|T] , H2,Count):-
 dif(H,H2),
 ocurrenceof(T,H2,Count).
 

count_occurrences(List, Occ, Count):-
bagof(true,member(Occ,List),Xs), length(Xs,L), !, Count is L.

equals(X) :- X = "L".
