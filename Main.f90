program F90_Quicksort
    implicit none

    ! The array to sort.
    integer :: to_sort(11)
    ! An index variable for the display loop.
    integer :: doVar 

    ! Initialise the array.
    data to_sort /21, 31, 11, 2, 456, 78, 43, 133, 121, 34, 564/

    ! Sort the array.
    call quick_sort(to_sort, 1, size(to_sort))

    ! Print the now-sorted array.
    printArr: do doVar = 1, size(to_sort)
        print *, to_sort(doVar) 
    end do printArr
contains
    ! A subroutine that swaps the values of variables.
    subroutine swap(x, y)
        ! The integer variables to swap
        integer, intent(inout) :: x, y
        ! A temporary swapper variable.
        integer :: temp

        ! Swap the values of x and y.
        temp = x
        x = y
        y = temp
    end subroutine swap

    ! A function that returns the index of the array to partition.
    function partition(arr, low, high) result (index)
        ! Parameters
        ! The array to return.
        integer, dimension(:), intent(inout) :: arr
        ! The min and max indexes to use when partitioning.
        integer, intent(in) :: low, high
        ! The result to return.
        integer :: index

        ! Local variables
        ! The pivot value, the index to return, and a loop variable.
        integer :: pivot, in, j

        ! Function logic
        ! Store the pivot value as the array's max index.
        pivot = arr(high)
        ! Store the index of "low - 1".
        in = low - 1

        ! Loop from the min index to the max index - 1
        do j = low, high - 1
            ! If the value at array index j is less than or equal to the pivot
            ! value:
            if (arr(j) <= pivot) then
                ! Increment the index.
                in = in + 1
                ! Swap the array values at indexes "in" and "j"
                call swap(arr(in), arr(j))
            end if 
        end do 

        ! Swap the array values at "in + 1" and the max index.
        call swap(arr(in + 1), arr(high))

        ! Return "in + 1"
        index = in + 1
    end function partition

    ! The quicksort implementation.
    recursive subroutine quick_sort(arr, low, high)
        ! Parameters
        ! The array to sort.
        integer, dimension(:), intent(inout) :: arr
        ! The array's max and min bounds.
        integer, intent(in) :: low, high
        ! Local Variables
        ! The pivot index.
        integer :: pivot_index

        ! If the min index is less than the max index (recursion base case):
        if (low < high) then
            ! Store the pivot index.
            pivot_index = partition(arr, low, high)
            
            ! Recursively call this subroutine to sort the array.
            call quick_sort(arr, low, pivot_index - 1)
            call quick_sort(arr, pivot_index + 1, high)
        end if
    end subroutine quick_sort
end program F90_Quicksort
