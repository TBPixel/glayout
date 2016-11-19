------------------
-- Grid Columns --
------------------
Col = Base:Create()


-----------------
-- CONSTRUCTOR --
-----------------
function Col:Create( parent )

    -- Prepares a copy of the original table for instantiation
    local new = table.Copy( self )
    
    -- Declares an id for the parent row
    new.parent  = parent

    -- Returns new instance
    if IsValid( new ) then

        return new
    else
        return false
    end
end



------------------
-- NODE METHODS --
------------------

-- Sets the number of columns to span in a row
function Col:SetSpan( span )

    -- Assert for potential errors
    assert( span >= 0, '\'span\' cannot be less than 0!' )

    self.span = span
    self:SetWidth( self.columns.width * span )
end

function Col:Shift( span )

    -- Assert for potential errors
    assert( isnumber( span ), '\'span\' must be a whole number!' )

    local start = self.columnsStart     * self.columns.width
    local dist  = self.columns.width    * span

    dist = start + dist

    self:SetX( dist )
end


-- Draw loop for the Column
function Col:Draw() end


-------------
-- SETTERS --
-------------

-- Sets the full height of the Base explicilty
function Col:SetHeight( height )

    assert( height >= 0, 'Height must be 0 or greater!' )
    self.box.content.height = height
end