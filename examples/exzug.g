S := HomalgFieldOfRationalsInSingular();
S := GradedRing( S );
S:=S*"x0..2"*"y0..2"*"z0..2";
indets := Indeterminates( S );
WeightsOfIndeterminates( S );
M:=HomalgMatrix(indets,Length(indets),1,S);
M:=GradedMap(M,"free",1*S);
Ix:=GradedLeftSubmodule("x0^3+x1^3+x2^3",S);
Iy:=GradedLeftSubmodule("y0^3+y1^3+y2^3",S);
Iz:=GradedLeftSubmodule("z0^3+z1^3+z2^3",S);
I := Ix*Iy*Iz;
OX := S/I;
F:=OX*MaximalIdealAsLeftMorphism(S);
OmegaP:=Kernel(F);
jac:=OX*Diff(HomalgMatrix(indets,1,Length(indets),S),MatrixOfGenerators(I));
der:=MatrixOfGenerators(OmegaP);
delta:=RightDivide(jac,der);
delta:=GradedMap(delta,OX*UnderlyingObject(I),OmegaP);
OmegaX:=Cokernel(delta);
