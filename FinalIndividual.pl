#!/usr/bin/perl

:- dynamic child/2.


%child_s(1,[2,3]).
%child_s(2,[1,3]).
%child_s(3,[1,2,4]).
%child_s(4,[3]).
%
%child_s(1,[2]).
%child_s(2,[1,3]).
%child_s(3,[2]).

%child_s(1,[2,3]).
%child_s(2,[1,3]).
%child_s(3,[1,2]).

child_s(1,[2]).
child_s(2,[1,3,4]).
child_s(3,[2]).
child_s(4,[2]).



% VERTEX MUST BE NATURAL AND SEQUENTAL
% NOT 1 3 4, BUT 1 2 3
% CHILDS MUST BE SORTED

% all left list combination creator
comb( [], []).
comb(Pred,Res):-member(X,Pred),delete(Pred,X,PredWithoutX),comb(PredWithoutX,Comb),Res = [X|Comb].

%collecting of all the coloring and listing them into result file
run:- Filename = '/Users/bodah/dev/Prolog/Colorings.pl', findall(X,allColoring(X),Res), tell(Filename), maplist(writeln,Res),told.

allColoring(Res):-
	% Delete all childs
	retractall(child(_,_)),
	% upload all child
	assertSourceChild,
	% Set graph vertex to v, egdes to U
	setof(X-Y,child(X,Y),R),pairs_keys_values(R,V,U),
	% Delete all childs again (if we want to list original graph)
	retractall(child(_,_)),
	% all the combinations(transpositions) of list V elements
	comb(V,CombV),
	
	
	% translate U (get transformed child list - all the i-th elements in the CombV )
	maplist(translate(CombV),U,TranslatedU),
	%get some elem from new graph list
	nth1(Index,CombV,ElemCV),nth1(Index,TranslatedU,ElemU),
	% aprove that new color is different
	sort(ElemU,ElemSU),not(child(ElemCV,ElemSU)),
	
	% write result
	pairs_keys_values(Res,CombV,TranslatedU),
	%add this list to programm
	maplist(assertChild,Res).


translate(Dict,List,Res):-maplist(translate_(Dict),List,Res).
% get (Index)th elem from the Dict
translate_(Dict,Index,Res):-nth1(Index,Dict,Res).

% writing facts to temp DB.
assertChild(V-C):-assertz(child(V,C)).
assertSourceChild:-setof(X-Y,child_s(X,Y),R),maplist(assertChild,R).