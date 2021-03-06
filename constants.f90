module CONSTANTS
! Description:
!    Contains physical constants used in the peogram and the SET_UNITS subroutine
!    to set the reference units for non-dimensionalization of the state vector.
!
! Author:
!    Davide Amato
!    Space Dynamics Group - Technical University of Madrid
!    d.amato@upm.es
! 
! ==============================================================================

use KINDS, only: dk,qk

! VARIABLES
implicit none

! Reference quantities for non-dimensionalization [km, 1/s].
real(qk)           ::  DU,TU

! Physical quantities.
! Earth.
real(qk),parameter     ::  REarth          = 6.37122E3_qk          ! [km]
real(qk),parameter     ::  smaEarth        = 1.49598023E8_qk       ! [km] = Astronomical unit
real(qk),parameter     ::  muEarth         = 3.98601E5_qk          ! [km^3/s^2]
real(qk),parameter     ::  J2Earth         = 1.08265E-3_qk         ! [-]
real(qk)               ::  wEarth                                  ! Earth angular velocity [rad/s]
real(qk)               ::  R_SoI                                   ! Earth sphere of influence radius [km]
! Sun.
real(qk),parameter     ::  muSun           = 1.32712428E11_qk      ! [km^3/s^2]
! Misc.
real(qk),parameter     ::  secsPerDay      = 86400._qk
real(qk),parameter     ::  pi    = 3.1415926535897932384626433832795027974814_qk
real(qk),parameter     ::  twopi = 6.2831853071795864769252867665590055949581_qk
real(qk)               ::  d2r

contains



subroutine SET_UNITS(r,mu)
! Description:
!    Computes reference quantities from a position vector and a gravitational
!    parameter.
! ==============================================================================

! VARIABLES
implicit none

! Arguments
real(qk),intent(IN)     ::  r(1:3)    ! Input Cartesian position [km, km/s].
real(qk),intent(IN)     ::  mu        ! Gravitational parameter  [km^3/s^2].

! ==============================================================================

DU = sqrt(dot_product(r,r))
TU = SQRT(mu/DU**3)

END SUBROUTINE SET_UNITS

end module CONSTANTS
