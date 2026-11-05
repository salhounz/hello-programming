program examples
    implicit none

    ! Derived types combine statically typed fields.
    type :: book
        character(len=20) :: title
        logical :: available
    end type book

    type(book) :: books(3)
    type(book) :: borrowed
    logical :: available_mask(3)
    integer :: i

    ! Constructors create values; this is a rank-one array constructor.
    books = [book('Dune', .true.), &
             book('Emma', .false.), &
             book('Sapiens', .true.)]

    print '(a)', 'Neighborhood shelf'
    do i = 1, size(books)
        print '(a)', label(books(i))
    end do

    ! A component reference over an array yields an array of values.
    available_mask = books%available
    print '(a,i0)', 'Available count: ', count(available_mask)
    print '(a)', 'Available titles:'
    do i = 1, size(books)
        if (available_mask(i)) print '(a)', trim(books(i)%title)
    end do

    ! Assignment copies this record; the original remains unchanged.
    borrowed = books(1)
    borrowed%available = .false.
    print '(a)', 'Original: ' // label(books(1))
    print '(a)', 'Updated: ' // label(borrowed)

    ! ANY reduces a logical array to a scalar condition.
    if (any(books%title == 'Emma')) then
        print '(a)', 'Emma is in the catalog'
    else
        print '(a)', 'Missing title'
    end if

contains
    ! An internal function has access to the host's type declarations.
    function label(item) result(description)
        type(book), intent(in) :: item
        character(len=:), allocatable :: description
        if (item%available) then
            description = trim(item%title) // ' - on shelf'
        else
            description = trim(item%title) // ' - on loan'
        end if
    end function label
end program examples
