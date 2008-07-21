# pm (p1m1)

# http://en.wikipedia.org/wiki/Wallpaper_group#Group_pm

M := [ [1,2,4], [1,3,6], [1,4,6], [2,3,5], [2,4,5], [3,5,6], [4,5,7], [4,6,9], [4,7,9], [5,6,8], [5,7,8], [6,8,9] ];
G := Group( (1,2) );
Isotropy := rec( 1 := G, 2 := G, 3 := G, 7 := G, 8 := G , 9 := G );
mult := [];

dim := 3;

#matrix sizes:
# [ 12, 114, 504, 2289, 11262 ]
#factors:
# [ 9.5, 4.42105, 4.54167, 4.92005 ]

#cohomology over GF(2):
#---------------------------------------->>>>  GF(2)^(1 x 1)
#---------------------------------------->>>>  GF(2)^(1 x 3)
#---------------------------------------->>>>  GF(2)^(1 x 4)
#---------------------------------------->>>>  GF(2)^(1 x 4)

#cohomology over Z/4Z:
#---------------------------------------->>>>  Z/4Z^(1 x 1)
#---------------------------------------->>>>  Z/4Z/< ZmodnZObj(2,4) >^(1 x 2) + Z/4Z^(1 x 1)
#---------------------------------------->>>>  Z/4Z/< ZmodnZObj(2,4) >^(1 x 4)
#---------------------------------------->>>>  Z/4Z/< ZmodnZObj(2,4) >^(1 x 4)

# H_* ( D_infinity ) = Z, [ Z/2Z^(1 x 2), 0 ]
