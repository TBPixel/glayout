------------------
-- Grid Manager --
------------------
Grid = {}


-----------------
-- CONSTRUCTOR --
-----------------
function Grid:Create( gridProps )

    -- Prepare a new instance
    local grid = Base:Create()

    -- Set fallback for props
    gridProps = gridProps or false



    ---------------------
    -- Grid Properties --
    ---------------------

    local rows      = {}
    local columns   = 12



    --------------------
    -- CREATE METHODS --
    --------------------

    -- Creates a new row & returns it's id
    function grid:AddRow()

        -- New Row Template
        local row = {}
            row.columns = {}

        -- Return id of new row
        return table.insert( rows, row )
    end


    -- Creates a new column within the grid
    function grid:CreateColumn( props )

        -- Sets default argument value
        props = props or 0

        -- Store reference to span of column
        local span = 0


        -- Props is a number ( aka columns-to-span )
        if isnumber( props ) then span = props

        -- Props is a table ( aka Property Passing )
        elseif istable( props ) then span = props.span end


        -- Assert column span
        assert( ( span > 0 ) and ( span <= self:GetColumnCount() ), 'Column span must be a number between 1 & ' .. self:GetColumnCount() )


        -- Gets a copy of the column table
        local column    = Column:Create()

        column:SetWidth( span * self:GetWidthOfColumns() )


        -- Sets false as initial row id for easy identification
        local row       = false

        -- No rows exist
        if ( self:GetRowCount() == 0 ) then

            -- Adds first row
            row     = self:AddRow()

        -- Row exists
        else

            -- Set newest row to active row
            row = self:GetRowCount()

            -- Get row width + column width
            local totalWidth = column:GetWidth() + self:GetRowWidth( self:GetRow( row ) )

            -- If new column won't fit in current row
            if ( totalWidth > self:GetWidth() ) then row = self:AddRow() end
        end


        -- Ensure row is set
        if not row then return false end


        -- Pass row id to column
        column:SetRow( row )


        -- Column couldn't be validated, return false
        if not IsValid( column ) then return false end


        -- Pass properties to new instance
        if istable( props ) then column:PassProps( props ) end


        -- Get Row Table
        row = self:GetRow( row )


        -- Insert new column into row & pass position in row to column
        column:SetRowPos( table.insert( row.columns, column ) )


        -- Return new column
        return column
    end



    ----------
    -- DRAW --
    ----------

    -- Draws Grid
    -- Loops over columns and draws each
    function grid:DrawGrid()

        -- Runs draw method on self if available
        if self.Draw then self:Draw() end

        -- Loop over rows
        self:LoopAllColumns( function( i, column )

            -- Runs draw method on columns if available
            if column.Draw then column:Draw() end
        end)
    end



    -----------------
    -- GET METHODS --
    -----------------


    --                --
    -- COLUMN METHODS --
    --                --

    -- Returns a number containing the column count
    function grid:GetColumnCount() return columns end


    -- Returns either a table containing a column or false
    function grid:GetColumn( row, id )

        -- Allows either ID or row table to be passed
        if isnumber( row ) then

            row = self:GetRow( row )
        end

        -- Returns either found column as table or false
        return true and ( row.columns[ id ] ) or false
    end


    -- Returns the number of columns in a row
    function grid:GetRowColumnCount( row )

        -- Allows either ID or row table to be passed
        if isnumber( row ) then

            row = self:GetRow( row )
        end

        return true and #row.columns or false
    end


    --             --
    -- ROW METHODS --
    --             --

    -- Returns a table containing a single row's data
    function grid:GetRow( row )

        -- Returns either found row as table or false
        return true and ( rows[ row ] ) or false
    end


    -- Returns a table containing all current rows
    function grid:GetRows() return rows end


    -- Returns the number of rows
    function grid:GetRowCount()

        return #self:GetRows()
    end


    -- Returns the width of the row ( total width of all columns )
    function grid:GetRowWidth( row )


        -- Allows either ID or row table to be passed
        if isnumber( row ) then

            row = self:GetRow( row )
        end


        -- Set fallback width
        local width = 0


        -- Loop over columns
        self:LoopRowColumns( row, function( i, column )

            -- Add column width to width
            width = width + column:GetWidth() + ( column:GetShift() * self:GetWidthOfColumns() )
        end)


        -- Return resulting width
        return width
    end


    -- Returns height of a row ( tallest column in row )
    function grid:GetRowHeight( row )

        -- Set fallback height
        local height = 0


        -- Loop over columns
        self:LoopRowColumns( row, function( i, column )

            -- Set fallback column height
            local columnHeight = 0

            -- Add column columnHeight to columnHeight
            columnHeight = columnHeight + column:GetHeight()
            -- Add column padding to columnHeight
            columnHeight = columnHeight + column:GetPaddingTop() + column:GetPaddingBottom()
            -- Add Column Margin to columnHeight
            columnHeight = columnHeight + column:GetMarginTop() + column:GetMarginBottom()


            -- Ensure height is only set to largest in row
            if columnHeight > height then height = columnHeight end
        end)


        -- Return resulting height
        return height
    end


    --              --
    -- GRID METHODS --
    --              --

    -- Returns a number containing the width-per-span of the grid
    function grid:GetWidthOfColumns()

        local width = self:GetWidth()

        -- Ensures full width of grid container is always used
        if ( self:GetContainerWidth() >= width ) and ( self:GetMarginLeft() or self:GetMarginRight() ) then

            width = width + ( self:GetMarginLeft() + self:GetMarginRight() )
        end

        return ( width / self:GetColumnCount() )
    end



    -----------------
    -- SET METHODS --
    -----------------

    -- Apply's settings to grid & columns
    function grid:Init()

        -- Re-Calculate Grid Box Model
        GridMath:CalcBoxModel( self )


        -- Updates Column Sizes
        self:UpdateColumnSizes()


        -- Update Column Positions
        self:UpdateColumnPositions()
    end


    ---------------------
    -- UTILITY METHODS --
    ---------------------

    --       --
    -- LOOPS --
    --       --

    -- Loops over all columns and runs callback
    function grid:LoopAllColumns( callback )

        -- Loop over rows
        self:LoopRows( function( i, row )

            -- Loop over columns
            self:LoopRowColumns( row, callback )
        end)
    end


    -- Loops over a single rows columns and runs callback
    function grid:LoopRowColumns( row, callback )

        -- Loop over columns
        for i, column in ipairs( row.columns ) do

            -- Run callback and pass index & column
            callback( i, column )
        end
    end


    -- Loops over all rows and runs callback
    function grid:LoopRows( callback )

        -- Loop over rows
        for i, row in ipairs( rows ) do

            -- Run callback and pass index & value
            callback( i, row )
        end
    end



    --------------------
    -- UPDATE METHODS --
    --------------------

    -- Loop over all columns & set position
    function grid:UpdateColumnPositions()

        -- Set adjustable previous row height for stacking rows
        local prevHeight = 0


        -- Loop Over All Rows
        self:LoopRows( function( i, row )

            -- Set fallback row height
            local prevRow       = self:GetRow( i - 1 )

            -- Get row height if available
            if prevRow then prevHeight = prevHeight + self:GetRowHeight( prevRow ) end


            -- Loop Over All Columns
            self:LoopRowColumns( row, function( k, column )

                -- Local reference for x
                local x = self:GetX() + ( column:GetShift() * self:GetWidthOfColumns() )
                local y = self:GetY() + prevHeight


                -- Attempt to get previous column
                local previous = self:GetColumn( i, k - 1 )

                -- There is a previous column
                -- Update X Position based on Previous
                if IsValid( previous ) then

                    -- Add Width of previous column
                    x = x + previous:GetContainerWidth()

                    -- Add Margins of Previous Column
                    x = x + ( previous:GetMarginLeft() + previous:GetMarginRight() )
                end

                -- Set column position
                column:SetPos( x, y )


                -- Update Column Size Calculations
                GridMath:CalcPos( column, self )
            end)
        end)
    end


    -- Calculates column Sizes
    function grid:UpdateColumnSizes()

        self:LoopAllColumns( function( i, column )

            GridMath:CalcSize( column, self )
        end)
    end



    --------------------------
    -- END INSTANCE METHODS --
    --------------------------

    -- Ensure new instance is valid
    if not IsValid( grid ) then return false end


    -- Pass properties to new instance
    if istable( gridProps ) then grid:PassProps( gridProps ) end


    -- Return new instance
    return grid
end
