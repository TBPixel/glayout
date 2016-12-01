------------------
-- Grid Columns --
------------------
Column = {}


-----------------
-- CONSTRUCTOR --
-----------------

function Column:Create()

    -- Prepare a new instance
    local column = Base:Create()



    -----------------------
    -- Column Properties --
    -----------------------
    local shift     = 0
    local row       = 0
    local rowPos    = 0



    -----------------
    -- GET METHODS --
    -----------------

    -- Gets the columns row
    function column:GetRow() return row end


    -- Gets the position of the column within the row
    function column:GetRowPos() return rowPos end


    -- Gets Column Shift Amount
    function column:GetShift() return shift end



    -----------------
    -- SET METHODS --
    -----------------

    -- Sets the columns row
    function column:SetRow( number )

        -- Assert arguments
        assert( isnumber( number ), 'Argument 1 in Column:SetRow must be a number!' )
        assert( number > 0, 'Argument 1 in Column:SetRow must be greater than 0!' )

        -- Set new value
        row = number

        -- Return new value
        return row
    end


    -- Sets the columns row position
    function column:SetRowPos( number )

        -- Assert arguments
        assert( isnumber( number ), 'Argument 1 in Column:SetRowPos must be a number!' )
        assert( number >= 0, 'Argument 1 in Column:SetRowPos must be greater than or equal to 0!' )


        -- Set new value
        rowPos = number

        -- Return new value
        return rowPos
    end


    -- Set Column Shift Amount
    function column:SetShift( number )

        -- Assert Argument
        assert( isnumber( number ), 'Argumnet 1 in Column:SetShift must be a Number!' )


        -- Set new value
        shift = number


        -- Return new value
        return shift
    end



    --------------------------
    -- END INSTANCE METHODS --
    --------------------------

    -- Ensure new instance is valid
    if not IsValid( column ) then return false end


    -- Return new instance
    return column
end
