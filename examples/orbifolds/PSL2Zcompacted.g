#The PSL2Z Orbifold, \infinity is one vertex with \Z-Isotropy, therefore a S^1 on 1

M := [ [1,8], [1,9], [8,9], [1,2,3], [1,2,4], [1,3,4], [2,3,5], [2,4,5], [3,4,7], [3,5,6], [3,6,7], [4,5,6], [4,6,7] ];

J := Group( (1,2) ); #at i
U := Group( (1,2,3) ); #at \rho

Isotropy := rec( 5 := U, 7 := J );

mult := [
[ [6], [6,7], [3,6,7], [4,6,7], x -> (1,2) ],
[ [6], [6,7], [4,6,7], [3,6,7], x -> (1,2) ]
];

dim := 2;
