---------------
-- Grid Rows --
---------------
Row = Base:Create()


--------------------
-- Row Properties --
--------------------
Row.columns.nodes = {}



------------------
-- NODE METHODS --
------------------

-- Creates a column to be used in the instanced row
function Row:CreateCol( span )

    -- Ensure span is set
    assert( span > 0, '\'Span\' must be set to greater than 0!' )

    local id = #self.columns.nodes + 1

    -- Creates a new row instance for use
    local new = Col:Create( id, self.id )

    -- Set starting column count
    new.span = span
    new.columnsStart = self:CalcColumnStartingColumn()

    -- Setup new column
    new:SetSize( self.columns.width * span, self.height )

    -- Adjust for multi-column margins
    local x = self.x

    for _, col in ipairs( self.columns.nodes ) do

        x = x + col.width + ( col.margin.left + col.margin.right )
    end

    -- Set Initial Position
    new:SetPos( x, self.y )

    -- Send column width to new child
    new.columns.width = self.columns.width

    -- Ensures new instance is valid
    if IsValid( new ) then

        -- Stores column node in Row for reference later
        self.columns.nodes[ id ] = new

        -- Returns new Row Instance
        return new
    else

        -- Returns false ( something went wrong! )
        return false
    end
end


-- Calculates the width of each column
function Row:CalcWidthOfColumns()

    -- Ensures width of Grid & the number of columns is greater than 0
    if ( self.width <= 0 ) or ( self.columns.count <= 0 ) then return false end

    -- The width of each column, rounded down the third decimal place
    self.columns.width = math.Round( self.width / self.columns.count, 3 )

    -- Return new width
    return self.columns.width
end


-- Calculates the starting column for a newly added column
function Row:CalcColumnStartingColumn()

    local start = 0

    for _, column in pairs( self.columns.nodes ) do
        
        start = start + column.span
    end

    return start
end


-- Draw loop for the Column
function Row:Draw()

    for _, column in ipairs( self.columns.nodes ) do

        if column.Draw then column:Draw() end
    end
end