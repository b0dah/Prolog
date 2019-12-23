:-dynamic g/3.
:-dynamic gr/3.
readgr(F):-see(F),readall,seen.
readall:- read(X), assert(X), X=end_of_file.
readall:- readall.
% �������� ��� ���������� ������ � ����. ������ �������� - �����
% �������, ������ - ������ ������ � ������� ��� �����, ������ - ������
% ���� ��������������� �����.
add_point(_,[],[]).
add_point(Number,[L1|ListOfNear],[LN1|ListOfLength]):-assert(g(Number,L1,LN1)),
    add_point(Number,ListOfNear,ListOfLength).
%��������� �����, ������� �� Point1 � Point2 ����� Length
add_edge(Point1,Point2,Length):-assert(g(Point1,Point2,Length)).
% ��������� ����� �� ��� ������, Old1,Old2 - ������ ����� �����, New -
% ����� ������, ����������� �����, NewLen1,NewLen2 - ����� �����,
% �������������� � ���������� ���������.
make_two_edge(Old1,Old2,New,NewLen1,NewLen2):-retract(g(Old1,Old2,_)),
    assert(g(Old1,New,NewLen1)),assert(g(Old2,New,NewLen2)).
% ������������ ��������� ����� (�����, ����������� ��� ����������
% ������������� ��������� ��������� � ���� ���������� ���������.
tranz_zam:-((g(X,Y,_),g(Y,Z,_));(g(X,Y,_),g(Z,Y,_));(g(Y,X,_),g(Z,Y,_));
           (g(Y,X,_),g(Y,Z,_))),X\=Z,
           not(g(X,Z,_)), not(g(Z,X,_)),
           assert(g(X,Z,10)),fail.
retractall:-retract(g(_,_,_)),fail.
