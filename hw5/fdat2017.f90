PROGRAM euler1D_SolveurExact
IMPLICIT NONE

INTEGER :: N, i
INTEGER, PARAMETER :: DP=kind(1.d0)
REAL (kind=DP), ALLOCATABLE:: F(:)
REAL (kind=DP):: t1_cpu, t2_cpu
CALL cpu_time(t1_cpu)

! ----------------------------------------------------------------------------------
! Lecture donnees
N = 4095
! Initialisation
ALLOCATE(F(0:N))
OPEN(unit=10,file='f.dat',status='old')

do i = 0, N-1
 READ(10,*) F(i) ! Nombre de mailles
enddo 
CLOSE(10)

! ----------------------------------------------------------------------------------



! Ecriture des donnees
OPEN(10,file='new_f.dat')
DO i=0,N-1

 WRITE(10,11) dfloat(i)/dfloat(N),  F(i)
END DO
CLOSE(10)
11 format(5(e11.4,1x))

DEALLOCATE(  F)

CALL cpu_time(t2_cpu)
PRINT*, 'L execution du programme a pris : ', t2_cpu-t1_cpu

END PROGRAM euler1D_SolveurExact

! ----------------------------------------------------------------------------------
! ----------------------------------------------------------------------------------

