program main
    implicit none

    integer :: doVar 
    integer, dimension(11) :: to_sort

    data to_sort(1:11) /21, 31, 11, 2, 456, 78, 43, 133, 121, 34, 564/

    call quick_sort(to_sort, 1, size(to_sort))

    do doVar = 1, size(to_sort)
        print *, to_sort(doVar) 
    end do

contains
    subroutine swap(x, y)
        integer, intent(inout) :: x, y
        integer :: temp

        temp = x
        x = y
        y = temp
    end subroutine swap

    function partition(arr, low, high) result (index)
        ! Dummy Variables
        integer, dimension(:), intent(inout) :: arr
        integer, intent(in) :: low, high
        integer :: index

        ! Local Variables
        integer :: pivot, i, j

        ! Function logic
        pivot = arr(high)
        i = low - 1

        do j = low, high - 1
            if (arr(j) <= pivot) then
                i = i + 1
                call swap(arr(i), arr(j))
            end if 
        end do 

        call swap(arr(i + 1), arr(high))

        index = i + 1
    end function partition

    recursive subroutine quick_sort(arr, low, high)
        ! Dummy Variables
        integer, dimension(:), intent(inout) :: arr
        integer, intent(in) :: low, high

        ! Local Variables
        integer :: pivot_index

        ! Subroutine Logic
        if (low < high) then
            pivot_index = partition(arr, low, high)
            call quick_sort(arr, low, pivot_index - 1)
            call quick_sort(arr, pivot_index + 1, high)
        end if
    end subroutine quick_sort
end program main
