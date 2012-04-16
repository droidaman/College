% Directed acyclic graph example.
% Braden Licastro.

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
  arrow(P,X),
  ispath(X,Q).
