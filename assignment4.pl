/* mother */
mother(X,Y) :-
female(X),
parent(X,Y).

/* father */
father(X,Y) :-
male(X),
parent(X,Y).

/* child */
child(X,Y) :- parent(Y,X).

/* full siblings */
sibling(X,Y) :- 
mother(Z,X), 
mother(Z,Y),
father(W,X),
father(W,Y),
X\=Y.

/* brother */
brother(X,Y) :-
male(X),
sibling(Y,X).

/* sister */
sister(X,Y) :-
female(X),
sibling(Y,X).

/* uncle */
uncle(X,Y) :-
male(X),
parent(Z,Y),
sibling(X,Z).

/* aunt */
aunt(X,Y) :-
female(X),
parent(Z,Y),
sibling(X,Z).

/* grandma */
grandma(X,Y) :-
female(X),
parent(Z,Y),
child(Z,X).

/* grandpa */
grandpa(X,Y) :-
male(X),
parent(Z,Y),
child(Z,X).

/* related */
related(X,Y) :-
sibling(X,Y);
uncle(X,Y);
aunt(X,Y);
descendent(X,Y);
ancestor(X,Y).

/* descendent */
descendent(X,Y) :-
child(X,Y).

descendent(X,Y) :-
child(X,Z),
descendent(Z,Y).


/* ancestor */
ancestor(X,Y) :-
parent(X,Y).

ancestor(X,Y) :-
parent(X,Z),
ancestor(Z,Y).

/* Basic Facts */

male(clancy).
male(fred).
male(conan).
male(homer).
male(bart).

female(jacqueline).
female(wilma).
female(marge).
female(lisa).
female(maggie).

parent(clancy, marge).
parent(jacqueline, marge).

parent(wilma, homer).
parent(wilma, conan).

parent(fred, homer).
parent(fred, conan).

parent(marge, lisa).
parent(marge, bart).
parent(marge, maggie).

parent(homer, lisa).
parent(homer, bart).
parent(homer, maggie).