
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

%file_to_list





run :- see('/Users/bodah/dev/prolog/TextFiles/input.txt'), readln(X), seen, write(X).

fileToList(L) :- seen, see('/Users/bodah/dev/prolog/TextFiles/input.txt'), readfile([],[],L), seen.
	
readfile(T,R,L) :- get0(X), 
(X<0, (T=[], L=R; name(T1, T), append(R, [T1], L)), ! ;

 (X=10; X=13),
 (T=[], readfile(T, R, L); name(T1, T),
 	append(R, [T1], R1), readfile([], R1, L )), !;
 	X>0, append(T, [X], T1), readfile(T1, R, L), !).
