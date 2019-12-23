:-dynamic g/3.
:-dynamic gr/3.
readgr(F):-see(F),readall,seen.
readall:- read(X), assert(X), X=end_of_file.
readall:- readall.
% предикат для добавления вешины в граф. Первый аргумент - номер
% вершины, второй - список вершин в которые она ведет, третий - список
% длин соответствующих дорог.
add_point(_,[],[]).
add_point(Number,[L1|ListOfNear],[LN1|ListOfLength]):-assert(g(Number,L1,LN1)),
    add_point(Number,ListOfNear,ListOfLength).
%добавляет ребро, ведущее из Point1 в Point2 длины Length
add_edge(Point1,Point2,Length):-assert(g(Point1,Point2,Length)).
% разбивает ребро на два других, Old1,Old2 - старые концы ребра, New -
% номер вршины, разбивающей ребро, NewLen1,NewLen2 - длины ребер,
% образовавшихся в результате разбиения.
make_two_edge(Old1,Old2,New,NewLen1,NewLen2):-retract(g(Old1,Old2,_)),
    assert(g(Old1,New,NewLen1)),assert(g(Old2,New,NewLen2)).
% транзитивное замыкание графа (ребра, добавленные при построении
% транзитивного замыкания сохраняем в виде отдельного предиката.
tranz_zam:-((g(X,Y,_),g(Y,Z,_));(g(X,Y,_),g(Z,Y,_));(g(Y,X,_),g(Z,Y,_));
           (g(Y,X,_),g(Y,Z,_))),X\=Z,
           not(g(X,Z,_)), not(g(Z,X,_)),
           assert(g(X,Z,10)),fail.
retractall:-retract(g(_,_,_)),fail.
