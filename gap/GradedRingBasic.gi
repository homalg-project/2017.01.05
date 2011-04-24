#############################################################################
##
##  GradedRingBasic.gi      GradedRingForHomalg package      Mohamed Barakat
##                                                    Markus Lange-Hegermann
##
##  Copyright 2010, Mohamed Barakat, University of Kaiserslautern
##           Markus Lange-Hegermann, RWTH-Aachen University
##
##  Implementations for graded rings.
##
#############################################################################

####################################
#
# global variables:
#
####################################

InstallValue( CommonHomalgTableForGradedRingsBasic,
        
        rec(
            ##  <#GAPDoc Label="BasisOfRowModule">
            ##  <ManSection>
            ##    <Func Arg="M" Name="BasisOfRowModule" Label="for graded rings"/>
            ##    <Returns>a distinguished basis (i.e. a distinguished generating set) of the module generated by M</Returns>
            ##    <Description>
            ##      <Listing Type="Code"><![CDATA[
            BasisOfRowModule :=
              function( M )
                 return MatrixOverGradedRing(
                                BasisOfRowModule( UnderlyingMatrixOverNonGradedRing( M ) ),
                                HomalgRing( M ) );
              end,
            ##  ]]></Listing>
            ##    </Description>
            ##  </ManSection>
            ##  <#/GAPDoc>
            
            BasisOfColumnModule :=
              function( M )
                return MatrixOverGradedRing( BasisOfColumnModule( UnderlyingMatrixOverNonGradedRing( M ) ), HomalgRing( M ) );
              end,
            
            BasisOfRowsCoeff :=
              function( M, T )
                local S, TT, result;
                
                S := HomalgRing( M );
                
                TT := HomalgVoidMatrix( UnderlyingNonGradedRing( S ) );
                
                result := BasisOfRowsCoeff( UnderlyingMatrixOverNonGradedRing( M ), TT );
                
                SetEval( T, TT );
                
                return MatrixOverGradedRing( result, S );
                
              end,
            
            BasisOfColumnsCoeff :=
              function( M, T )
                local S, TT, result;
                
                S := HomalgRing( M );
                
                TT := HomalgVoidMatrix( UnderlyingNonGradedRing( S ) );
                
                result := BasisOfColumnsCoeff( UnderlyingMatrixOverNonGradedRing( M ), TT );
                
                SetEval( T, TT );
                
                return MatrixOverGradedRing( result, S );
                
              end,
              
            ##  <#GAPDoc Label="DecideZeroRows">
            ##  <ManSection>
            ##    <Func Arg="A, B" Name="DecideZeroRows" Label="for graded rings"/>
            ##    <Returns>a reduced form of <A>A</A> with respect to <A>B</A></Returns>
            ##    <Description>
            ##      <Listing Type="Code"><![CDATA[
            DecideZeroRows :=
              function( A, B )
                return MatrixOverGradedRing(
                               DecideZeroRows( UnderlyingMatrixOverNonGradedRing( A ),
                                       UnderlyingMatrixOverNonGradedRing( B ) ),
                               HomalgRing( A ) );
              end,
            ##  ]]></Listing>
            ##    </Description>
            ##  </ManSection>
            ##  <#/GAPDoc>
            
            DecideZeroColumns :=
              function( A, B )
                return MatrixOverGradedRing( DecideZeroColumns( UnderlyingMatrixOverNonGradedRing( A ), UnderlyingMatrixOverNonGradedRing( B ) ), HomalgRing( A ) );
              end,
                              
            DecideZeroRowsEffectively :=
              function( A, B, T )
                local S, TT, result;
                
                S := HomalgRing( A );
                
                TT := HomalgVoidMatrix( UnderlyingNonGradedRing( S ) );
                
                result := DecideZeroRowsEffectively( UnderlyingMatrixOverNonGradedRing( A ), UnderlyingMatrixOverNonGradedRing( B ), TT );
                
                SetEval( T, TT );
                
                return MatrixOverGradedRing( result, S );
                
              end,
    
            DecideZeroColumnsEffectively :=
              function( A, B, T )
                local S, TT, result;
                
                S := HomalgRing( A );
                
                TT := HomalgVoidMatrix( UnderlyingNonGradedRing( S ) );
                
                result := DecideZeroColumnsEffectively( UnderlyingMatrixOverNonGradedRing( A ), UnderlyingMatrixOverNonGradedRing( B ), TT );
                
                SetEval( T, TT );
                
                return MatrixOverGradedRing( result, S );
                
              end,
            
            ##  <#GAPDoc Label="SyzygiesGeneratorsOfRows">
            ##  <ManSection>
            ##    <Func Arg="M" Name="SyzygiesGeneratorsOfRows" Label="for graded rings"/>
            ##    <Returns>a distinguished basis of the syzygies of the argument</Returns>
            ##    <Description>
            ##      <Listing Type="Code"><![CDATA[
            SyzygiesGeneratorsOfRows :=
              function( M )
                return MatrixOverGradedRing(
                               SyzygiesGeneratorsOfRows( UnderlyingMatrixOverNonGradedRing( M ) ),
                               HomalgRing( M ) );
              end,
            ##  ]]></Listing>
            ##    </Description>
            ##  </ManSection>
            ##  <#/GAPDoc>
            
            RelativeSyzygiesGeneratorsOfRows :=
              function( M, N )
                return MatrixOverGradedRing( SyzygiesGeneratorsOfRows( UnderlyingMatrixOverNonGradedRing( M ), UnderlyingMatrixOverNonGradedRing( N ) ), HomalgRing( M ) );
              end,
    
            SyzygiesGeneratorsOfColumns :=
              function( M )
                return MatrixOverGradedRing( SyzygiesGeneratorsOfColumns( UnderlyingMatrixOverNonGradedRing( M ) ), HomalgRing( M ) );
              end,
    
            RelativeSyzygiesGeneratorsOfColumns :=
              function( M, N )
                return MatrixOverGradedRing( SyzygiesGeneratorsOfColumns( UnderlyingMatrixOverNonGradedRing( M ), UnderlyingMatrixOverNonGradedRing( N ) ), HomalgRing( M ) );
              end,
    
     )
  );
