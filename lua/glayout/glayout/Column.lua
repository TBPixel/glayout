------------------
-- Grid Columns --
------------------
Column = Base:Create()


-----------------------
-- Column Properties --
-----------------------
Column.shift = 0



-----------------
-- CONSTRUCTOR --
-----------------

function Column:Create()

    -- Prepare a new instance of Grid
    local new = table.Copy( self )


    -- Ensure new instance is valid
    if not IsValid( new ) then return false end


    -- Return new instance
    return new
end



-----------------
-- GET METHODS --
-----------------

-- Gets Column Shift Amount
function Column:GetShift() return self.shift end


-----------------
-- SET METHODS --
-----------------

-- Column Additional PassProps Option
function Column:PassProps( props )

    -- Parent Method
    Base.PassProps( self, props )

    -- Set Column Shift Amount
    if props.shift then

        self:SetShift( props.shift )
    end
end


-- Set Column Shift Amount
function Column:SetShift( number )

    -- Assert Argument
    assert( isnumber( number ), 'Argumnet 1 in Column:SetShift must be a Number!' )


    -- Set new value
    self.shift = number


    -- Return new value
    return self.shift
end
