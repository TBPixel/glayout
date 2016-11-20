------------------------------------------
-- Grid Manager for structuring layouts --
------------------------------------------
Grid = Base:Create()

---------------------
-- GRID PROPERTIES --
---------------------

-- Grid Containers for remembering data
Grid.rows = {}


-----------------
-- CONSTRUCTOR --
-----------------
function Grid:Create( props )

    -- Set local id
    local id = nil

    -- Set id for table of data
    if istable( props ) then

        -- Allow id to be optional property
        if props.id then id = props.id end

    -- Set id to props argument if number
    elseif isnumber ( props ) then id = props end

    -- Prepares a copy of the original table for instantiation
    local new = table.Copy( self )

    -- Set New Grid ID
    new.id = id

    -- Returns new instance
    if IsValid( new ) then

        -- Run Pass Properties Method
        if istable( props ) then new:PassProps( props ) end

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
function Grid:CalcColumnStartingColumn( row )

    local start = 0

    for _, col in ipairs( row.columns ) do
            
        start = start + col.span
    end

    return start
end


-- Calculates the new height based on child columns
function Grid:UpdateHeight()

    -- Updates row heights
    self:UpdateRowHeights()

    -- Calculate tallest column in grid
    local h = 0

    -- Loop over rows
    for _, row in ipairs( self.rows ) do

        -- Get New Height
        h = h + row.props.height
    end

    -- Set New Height
    self:SetHeight( h )

    -- Re-Initialize
    self:Init()
end


-------------
-- GETTERS --
-------------

function Grid:GetColumnCount()

    return self.columns.count
end


------------------
-- ROWS METHODS --
------------------


-- Adds a new row
function Grid:AddRow()

    local row = {}
        row.id      = -1
        row.props   = {}
            row.props.width     = 0
            row.props.height    = 0
        row.columns = {}

    row.id = table.insert( self.rows, row )

    return row.id
end


-- Gets a row by id
function Grid:GetRow( id )

    local row = self.rows[ id ]

    if istable( row ) then return row end

    return false
end


-- Checks to see if row has room for new column
function Grid:ColWillFit( row, width )

    assert( istable( row ), '\'row\' must be a table!' )
    assert( isnumber( width ), '\'width\' must be a number!' )

    local w = width

    -- Loop over given row
    for _, col in ipairs( row.columns ) do
        
        -- Get combined width of columns
        w = w + col.box.content.width
    end

    -- Column will not fit
    if w > self.box.content.width then return false end

    -- Column will fit
    return true
end


-- Updates the height of each row
function Grid:UpdateRowHeights()

    -- Loop over rows
    for _, row in ipairs( self.rows ) do
        
        -- Set a local row height
        local h = 0

        -- Loop over columns
        for k, col in ipairs( row.columns ) do

            local height = col.box.content.height
            
            if ( height > h ) then h = height end
        end

        -- Set new row height
        row.props.height = h
    end
end


-- 
function Grid:UpdateRowStartY( row )

    if not ( row.id > 1 ) then return end

    -- Get previous row height
    local y = self:GetRow( #self.rows - 1 )
    y = y.props.height

    -- Fixes column stacking when creating columns with a for loop
    y = y * ( row.id - 1 )

    for _, col in ipairs( row.columns ) do
        
        col:SetY( col.start.y + y )
    end
end


-- Sets up a new row for column creation
function Grid:SetupRow( colWidth )

    -- Sets -1 as recognizable default row id
    local row = -1

    -- No rows exist yet
    if ( #self.rows <= 0 ) then

        -- Create initial row
        row = self:AddRow()
    else

        -- Get newest row
        row = #self.rows

        -- There's no room in newest row
        if not self:ColWillFit( self:GetRow( #self.rows ), colWidth ) then

            -- Create new row
            row = self:AddRow()
        end
    end

    -- Returns new row id
    return row
end


------------------
-- NODE METHODS --
------------------

-- Creates a column to be used in the instanced row
function Grid:CreateCol( props )


    -- Set local span reference
    local span = 0

    -- Sets Span
    if istable( props ) and props.span then span = props.span
    elseif isnumber( props ) then span = props end


    -- Creates a new row instance for use
    local new = Col:Create( self )

    
    -- Send column width to new child
    new.columns.width = self.columns.width


    -- Sets Span & Width
    new:SetSpan( span )


    -- Setup new row
    local row   = self:SetupRow( new.box.content.width )


    -- Set Row id
    new.row = row


    -- Set row to actual row for use
    row     = self:GetRow( row )


    -- Sets Starting Column
    new.columnsStart = self:CalcColumnStartingColumn( row )

    local x = self.x

    -- Adjust for multi-column margins
    for _, col in ipairs( row.columns ) do

        -- Calculates the x starting position of the current row of columns
        x = x + col:GetWidth() + ( col.box.margin.left + col.box.margin.right )
    end

    -- Set Initial Position
    new:SetPos( x, self.y )


    -- Ensures new instance is valid
    if IsValid( new ) then

        -- Insert column into row
        table.insert( row.columns, new )

        -- Set properties on row
        if istable( props ) then new:PassProps( props ) end

        -- Updates height of grid and rows
        self:UpdateHeight()

        -- Updates start position for stacked columns
        self:UpdateRowStartY( row )

        -- Returns new Row Instance
        return new
    else

        -- Returns false ( something went wrong! )
        return false
    end
end


------------------
-- DRAW METHODS --
------------------

function Grid:DrawGrid()

    -- Allows drawing to Grid
    if self.Draw then self:Draw() end

    -- Loop over rows
    for _, row in ipairs( self.rows ) do

        -- Loop over columns
        for k, col in ipairs( row.columns ) do
            
            -- Run draw method if available
            if col.Draw then col:Draw() end
        end
    end
end


function Grid:Draw() end