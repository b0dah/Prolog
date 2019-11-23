% Как то раз случай свёл в купе астронома, поэта , прозаика и драматурга. 
% Это были Алексеев, Борисов, Константинов и Дмитриев. *
% Оказалось, что каждый из них взял с собой книгу написанную одним из пассажиров этого купе. *
% Алексеев и Борисов углубились в чтение предварительно обменявшись книгами. -> - >  У алексеева книга Дмитриева -> -> У Борисова не книга Алексеева
% Поэт читал пьесу, прозаик — очень молодой человек, выпустивший свою книгу, *
%	говорил что он никогда и ничего не читал по астрономии. *
% Борисов купил одно из произведений Дмитриева. -> Дмитриев не прозаик *
% Никто из пассажиров не читал свои книги. *

% Что читал каждый из них, кто кем был?

isMember(First, [First|_]).
isMember(First, [_|R]):- isMember(First, R).

isNotMember(First, L) :- not(isMember(First, L)).


unique([]):-!.
unique([Head|Tail]):-
   isMember(Head, Tail), !, fail.
unique([Head|Tail]) :- unique(Tail).


% не читает и покупал своб книгу
 	check([]):-!.
	check([passenger(_, XReads, XBought, XWrote)|T]):-
  !, not(XReads = XWrote), not(XBought = XWrote), check(T).

% %%%%%%%%%%%%%%%%%%%%%%
/*task :-

Wroters = [_,_,_,_],

isMember( [[_, astronomer], F], Wroters), isMember([F, _], Wroters), 
isMember( [[_, poet], S], Wroters), isMember([S, _], Wroters), 
isMember( [[_, prosaist], T], Wroters), isMember([T, _], Wroters), 
isMember( [[_, playwriter], Fo], Wroters), isMember([Fo, _], Wroters), 

isMember([[alekseev, _], First], Wroters), isMember([First, _], Wroters), 
isMember([[borisov, _], Second], Wroters), isMember([Second, _], Wroters), 
isMember([[konstantinov, _], Third], Wroters), isMember([Third, _], Wroters), 
isMember([[dmitirev, _], Fourth], Wroters), isMember([Fourth, _], Wroters), 

% Поэт читал пьесу
isMember( [[_, poet], [_, playwriter]], Wroters),

%прозаик  никогда и ничего не читал по астрономии.
isNotMember( [[_, prosaist], [_, astronomer]], Wroters),

% Дмитриев не прозаик
isNotMember( [[dmitriev, prosaist], _], Wroters),

% -- > -> -> -> У алексеева книга Дмитриева
isMember([[alekseev, _], [dmitriev, _]], Wroters),

%-> -> У Борисова не книга Алексеева
isMember([[borisov, _], [alekseev, _]], Wroters),

% Никто из пассажиров не читал свои книги.
isNotMember([[_, playwriter], [_, playwriter]], Wroters),
isNotMember([[_, poet], [_, poet]], Wroters),
isNotMember([[_, prosaist], [_, prosaist]], Wroters),
isNotMember([[_, astronomer], [_, astronomer]], Wroters),

isNotMember([[alekseev, _], [alekseev, _]], Wroters),
isNotMember([[dmitriev, _], [dmitriev, _]], Wroters),
isNotMember([[konstantinov, _], [konstantinov, _]], Wroters),
isNotMember([[borisov, _], [borisov, _]], Wroters),

print(Wroters), nl.

me() :-
*/


%///////////////////////////// SEC TRY /////////////////////////////////////

% Как то раз случай свёл в купе астронома, поэта , прозаика и драматурга. 
% Это были Алексеев, Борисов, Константинов и Дмитриев. *
% Оказалось, что каждый из них взял с собой книгу написанную одним из пассажиров
 этого купе. *
% Алексеев и Борисов углубились в чтение предварительно обменявшись книгами.
 -> - >  У алексеева книга Дмитриева -> -> У Борисова не книга Алексеева
% Поэт читал пьесу, прозаик — очень молодой человек, выпустивший свою книгу, *
%	говорил что он никогда и ничего не читал по астрономии. *
% Борисов купил одно из произведений Дмитриева. -> Дмитриев не прозаик *
% Никто из пассажиров не читал свои книги. *

% Что читал каждый из них, кто кем был?

man(alekseev).
man(borisov).
man(konstantinov).
man(dmitriev).

kindOfBook(astronomy).
kindOfBook(poetry).
kindOfBook(prose).
kindOfBook(play).


passenger(Name, Reads, Bought, Wrote).


solve(Passengers):-
  Passengers = [passenger(First, FirstReads, FirstBought, FirstWrote), 
  				passenger(Second, SecondReads, SecondBought, SecondWrote),
          		passenger(Third, ThirdReads, ThirdBought, ThirdWrote), 	
          		passenger(Fourth, FourthReads, FourthBought, FourthWrote)],

  % 4 разных пасажира
  man(First), man(Second), man(Third), man(Fourth), 
  		unique([First, Second, Third, Fourth]),

  % каждый написал книгу
  kindOfBook(FirstWrote), kindOfBook(SecondWrote),
  kindOfBook(ThirdWrote), kindOfBook(FourthWrote),
  unique([FirstWrote, SecondWrote, ThirdWrote, FourthWrote]),

  % каждый купил книгу
  kindOfBook(FirstBought), kindOfBook(SecondBought),
  kindOfBook(ThirdBought), kindOfBook(FourthBought),
  unique([FirstBought, SecondBought, ThirdBought, FourthBought]),

  % каждый читает книгу
  kindOfBook(FirstReads), kindOfBook(SecondReads),
  kindOfBook(ThirdReads), kindOfBook(FourthReads),
  unique([FirstReads, SecondReads, ThirdReads, FourthReads]),

 %------ CONSTRAINTS --------------------------
	% поэт читает пьесу
  isMember(passenger(_, play, _, poetry), Passengers),

  % прозаик читает не астрономию
  not(isMember(passenger(_, astronomy, _, prose), Passengers)),
  % прозаик не покупал астрономию
  not(isMember(passenger(_, _, astronomy, prose), Passengers)),
  % никто не читает и не покупал свою книгу
  check(Passengers),
  % алексеев и борисов обменялись книгами
  isMember(passenger(alekseev, AlekseevReads, AlekseevBought, _), Passengers),
  isMember(passenger(borisov, AlekseevBought, AlekseevReads, _), Passengers),
  % Борисов купил произведение Дмитриева
  isMember(passenger(dmitriev, _, _, DmitrievWrote), Passengers),
  isMember(passenger(borisov, DmitrievWrote, _, _), Passengers).






