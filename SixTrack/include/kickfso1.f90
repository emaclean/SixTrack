!strack=zero
!strackx=ed(IX)
!strackz=ek(IX)

!Going to momenum and psigma

!FOX  YP(1)=Y(1)*(ONE+DPDA)/MTCDA ;
!FOX  YP(2)=Y(2)*(ONE+DPDA)/MTCDA ;
!FOX  PUSIG=((EJ1-E0)/(E0F*(E0F/E0)))*C1E3 ;

!FOX  TEMPI(1) = X(1) ;
!FOX  TEMPI(2) = YP(1) ;
!FOX  TEMPI(3) = X(2) ;
!FOX  TEMPI(4) = YP(2) ;
!FOX  TEMPI(5) = SIGMDA ;
!FOX  TEMPI(6) = PUSIG ;


!ONEDPDA,FPSIGDA,FPPSIGDA,COSTH_DA,SINTH_DA,Q_DA,R_DA,Z_DA,PXFDA,PYFDA,SIGFDA

!Full 6d-formula using 

!FOX  ONEDPDA   = SQRT(ONE + TWO*TEMPI(6)+((E0F/E0)*(E0F/E0))*(TEMPI(6)*TEMPI(6))) ;
!FOX  FPPSIGDA  = ( ONE + ((E0F/E0)*(E0F/E0))*TEMPI(6) ) / ONEDPDA ;

!     Set up C,S, Q_DA,R_DA,Z
!FOX  COSTH_DA = COS(EK(IX)/ONEDPDA) ;
!FOX  SINTH_DA = SIN(EK(IX)/ONEDPDA) ;

!FOX  Q_DA = -EK(IX) * ED(IX) / ONEDPDA ;
!FOX  R_DA = FPPSIGDA / (ONEDPDA*ONEDPDA) * EK(IX) * ED(IX) ;
!FOX  Z_DA = FPPSIGDA / (ONEDPDA*ONEDPDA) * EK(IX) ;

!FOX  PXFDA  = TEMPI(2) + TEMPI(1)*Q_DA ;
!FOX  PYFDA  = TEMPI(4) +  TEMPI(3) *Q_DA ;
!FOX  SIGFDA = TEMPI(5) - (ONE/TWO)*(TEMPI(1)*TEMPI(1) +  TEMPI(3) *TEMPI(3))*R_DA ;

!       R_DAipken formulae p.29 (3.37)
!FOX  X(1) =  (TEMPI(1)  * COSTH_DA  +  TEMPI(3)  * SINTH_DA) ;
!FOX  YP(1) =  (PXFDA * COSTH_DA  +  PYFDA * SINTH_DA) ;
!FOX  X(2) = (-TEMPI(1)  * SINTH_DA  +  TEMPI(3)  * COSTH_DA) ;
!FOX  YP(2) = (-PXFDA * SINTH_DA  +  PYFDA * COSTH_DA) ;
!FOX  SIGMDA =  SIGFDA + (TEMPI(1)*PYFDA - TEMPI(3)*PXFDA)*Z_DA ;

print *, "ek",  ek(ix)
print *, "ed",  ed(ix)
!Going back to angles
!FOX  Y(1)=YP(1)*MTCDA/(ONE+DPDA) ; 
!FOX  Y(2)=YP(2)*MTCDA/(ONE+DPDA) ;