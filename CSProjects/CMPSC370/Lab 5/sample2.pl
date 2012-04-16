% Directed acyclic graph example.
% Braden Licastro

arrow(a,b).
arrow(a,c).
arrow(b,c).
arrow(b,e).
arrow(c,d).
arrow(d,e).
arrow(d,i).
arrow(e,f).
arrow(g,c).
arrow(h,d).

ispath(P,Q) :-
	arrow(P,Q).

ispath(P,Q) :-
	arrow(P,X).
	ispath(X,Q).


% Question Number 8
internal(X) :-
	arrow(P,X),
	arrow(X,Q).


% Question Number 9
triangle(P,Q,R) :-
	arrow(P,Q),
	arrow(P,R),
	arrow(R,Q).

triangle(P,Q,R) :-
	arrow(P,Q),
	arrow(P,R),
	arrow(Q,R).

triangle(P,Q,R) :-
	arrow(R,P),
	arrow(R,Q),
	arrow(P,Q).

triangle(P,Q,R) :-
	arrow(R,P),
	arrow(R,Q),
	arrow(Q,P).

triangle(P,Q,R) :-
	arrow(Q,R),
	arrow(Q,P),
	arrow(R,P).

triangle(P,Q,R) :-
	arrow(Q,R),
	arrow(Q,P),
	arrow(P,R).


% Question Number 12 - Illogical Street System
oneway(first,second).
oneway(first,fourth).
oneway(fourth,third).
oneway(second,fourth).
oneway(first,third).
oneway(second,third).

cantravel(RoadA,RoadB) :-
	oneway(RoadA,RoadB).

cantravel(RoadA,RoadB) :-
	arrow(RoadB,Intermediate).
	cantravel(Intermediate,RoadB).
