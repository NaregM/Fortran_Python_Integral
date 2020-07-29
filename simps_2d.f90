!simps_2d.f90
module simps_2d
    implicit none
contains

subroutine simps2d(results, fxy, S, x, y)


! IN-/OUTPUT
real(8), dimension(:, :), intent(in) :: fxy
real(8), dimension(:, :), intent(in) :: S
real(8), dimension(:), intent(in) :: x
real(8), dimension(:), intent(in) :: y

real(8), intent(out) :: results

! OTHER VARS
integer :: i, j
integer :: nx, ny
real :: max_x, min_x, max_y, min_y
real :: h1, h2

nx = size(x)
ny = size(y)

max_x = maxval(x)
min_x = minval(x)

max_y = maxval(y)
min_y = minval(y)

h1 = (max_x - min_x)/(real(nx) - 1)
h2 = (max_y - min_y)/(real(ny) - 1)

results = 0.0

do i = 1, nx

    do j = 1, ny

        results = results + 1.0/9 * h1 * h2 * S(i, j) * fxy(i, j)

    end do

end do

return 
end subroutine simps2d
end module simps_2d



























