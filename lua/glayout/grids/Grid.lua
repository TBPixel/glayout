------------------------------------------
-- Grid Manager for structuring layouts --
------------------------------------------
Grid = Base:Create()

---------------------
-- GRID PROPERTIES --
---------------------

-- Grid Containers for remembering data
Grid.rows       = {}


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


-------------
-- GETTERS --
-------------

function Grid:GetColumnCount()

    return self.columns.count
end


------------------
-- NODE METHODS --
------------------

-- Create new rows in the Grid using the Row:Create constructor
function Grid:CreateRow()

    local id = #Grid.rows + 1

    -- Creates a new row instance for use
    local new = Row:Create()

    -- Sets a unique id for the row
    new.id = id

    -- Sets sizing and positioning based on parent grid
    new:SetSize( self.width, self.height )
    new:SetPos( self.x, self.y )

    -- Pass width of columns to new Row
    new.columns.count = self.columns.count
    new:CalcWidthOfColumns()

    -- Ensures new instance is valid
    if IsValid( new ) then

        -- Stores Row in current grid
        self.rows[ id ] = new

        -- Returns new Row Instance
        return new
    else

        -- Returns false ( something went wrong! )
        return false
    end
end



function Grid:Draw()

    for _, row in ipairs( self.rows ) do

        if row.Draw then row:Draw() end
    end
end