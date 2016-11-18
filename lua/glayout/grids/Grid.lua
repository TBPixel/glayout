------------------------------------------
-- Grid Manager for structuring layouts --
------------------------------------------
Grid = Base:Create()

---------------------
-- GRID PROPERTIES --
---------------------

-- Grid Containers for remembering data
Grid.columns.nodes = {}


-----------------
-- CONSTRUCTOR --
-----------------
function Grid:Create( id )

    if not id then id = nil end

    -- Prepares a copy of the original table for instantiation
    local new = table.Copy( self )

    new.id = id

    -- Returns new instance
    if IsValid( new ) then

        return new
    else
        return false
    end
end


-------------
-- SETTERS --
-------------

-- Sets the number of columns explicitly
function Grid:SetColumnCount( columns )

    assert( columns > 0, 'Grid Columns must be greater than 0!' )
    self.columns.count = columns

    self:CalcWidthOfColumns()
end

-- Calculates the width of each column
function Grid:CalcWidthOfColumns()

    -- Ensures width of Grid & the number of columns is greater than 0
    if ( self.width <= 0 ) or ( self.columns.count <= 0 ) then return false end

    -- The width of each column, rounded down the third decimal place
    self.columns.width = math.Round( self.width / self.columns.count, 3 )

    -- Return new width
    return self.columns.width
end

-- Calculates the starting column for a newly added column
function Grid:CalcColumnStartingColumn()

    local start = 0

    for _, column in pairs( self.columns.nodes ) do
        
        start = start + column.span
    end

    return start
end


-- Calculates the new height based on child columns
function Grid:CalcNewHeight()

    -- Calculate tallest column in grid
    local h = 0

    for _, col in pairs( self.columns.nodes ) do
        
        if ( col.box.content.height > h ) then h = col.box.content.height end
    end

    -- Set New Height
    self:SetHeight( h )
end


-------------
-- GETTERS --
-------------

function Grid:GetColumnCount()

    return self.columns.count
end


------------------
-- NODE METHODS --
------------------

-- Creates a column to be used in the instanced row
function Grid:CreateCol( span )

    -- Ensure span is set
    assert( span > 0, '\'Span\' must be set to greater than 0!' )

    local id = #self.columns.nodes + 1

    -- Creates a new row instance for use
    local new = Col:Create( id, self )

    
    -- Send column width to new child
    new.columns.width = self.columns.width

    -- Set starting column count
    new:SetSpan( span )


    -- Sets Starting Column
    new.columnsStart = self:CalcColumnStartingColumn()

    -- Setup new column
    new:SetSize( self.columns.width * span, 0 )

    local x = self.x

    -- Adjust for multi-column margins
    for _, col in ipairs( self.columns.nodes ) do

        x = x + col:GetWidth() + ( col.box.margin.left + col.box.margin.right )
    end

    -- Set Initial Position
    new:SetPos( x, self.y )


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

function Grid:Draw()

    for _, column in ipairs( self.columns.nodes ) do

        if column.Draw then column:Draw() end
    end
end