---------------
-- GRID MATH --
---------------

-- Store Local Reference of GridMath
GridMath = {}



-------------------------
-- Calculate Box Model --
-------------------------

function GridMath:CalcBoxModel( node, parent )

    -- Calculate Position of Node
    self:CalcPos( node )

    -- Calculate Size of Node
    self:CalcSize( node, parent )
end



-------------------------
-- CALCULATION METHODS --
-------------------------

-- Adjusts position based on margin's
function GridMath:CalcPos( node )

    -- Calculates Position X
    self:CalcPosX( node )

    -- Calculates Position Y
    self:CalcPosY( node )
end

    -- Calculates and updates X Position based on Margin & Padding
    function GridMath:CalcPosX( node )

        -- Store local reference to x
        local x = node:GetX()

        -- Account for margin
        x = x + node:GetMarginLeft()

        -- Set calculated X
        node:SetContainerX( math.Round( x, 1 ) )


        -- Account for padding
        x = x + node:GetPaddingLeft()

        -- Set calculated Container X
        node:SetX( math.Round( x, 1 ) )
    end

    -- Calculates and updates Y Position based on Margin & Padding
    function GridMath:CalcPosY( node )

        -- Store local reference to y
        local y = node:GetY()

        -- Account for margin
        y = y + node:GetMarginTop()

        -- Set calculated Y
        node:SetContainerY( math.ceil( y ) )


        -- Account for padding
        y = y + node:GetPaddingTop()

        -- Set Calculated Y Container
        node:SetY( math.ceil( y ) )
    end


-- Adjusts size based on Margin's & Padding
function GridMath:CalcSize( node, parent )

    -- Calculates Width
    self:CalcWidth( node, parent )

    -- Calculates Height
    self:CalcHeight( node, parent )
end

    -- Calculates & Updates Width based on Margin & Padding
    function GridMath:CalcWidth( node, parent )

        -- Set default for argument
        parent = parent or false

        -- Fallback values for parent
        local parentMargin  = 0
        local parentPadding = 0

        -- Get Parent values
        if parent then

            -- Get number of rows in column
            local row       = true and node:GetRow() or false
            local count     = 1

            if row then count = parent:GetRowColumnCount( row ) end

            -- Get margin & padding / number of rows
            parentMargin    = math.Round( ( parent:GetMarginLeft()   + parent:GetMarginRight() ) / count, 1 )
            parentPadding   = math.Round( ( parent:GetPaddingLeft()  + parent:GetPaddingRight() ) / count, 1 )
        end


        -- Store local reference to width
        local width = node:GetWidth()

        -- Account for margins
        width = width - ( node:GetMarginLeft() + node:GetMarginRight() )

        -- Account for parent margin & padding
        width = width - parentMargin - parentPadding

        -- Set calculated Width
        node:SetContainerWidth( math.Round( width, 1 ) )


        -- Account for padding
        width = width - ( node:GetPaddingLeft() + node:GetPaddingRight() )

        -- Set calculated Width
        node:SetWidth( math.Round( width, 1 ) )
    end

    function GridMath:CalcHeight( node, parent )

        -- Set default for argument
        parent = parent or false

        -- Fallback values for parent
        local parentMargin  = 0
        local parentPadding = 0

        -- Get Parent values
        if parent then

            local rowCount  = parent:GetRowCount()

            parentMargin    = math.Round( ( parent:GetMarginTop()   + parent:GetMarginBottom() ) / rowCount, 1 )
            parentPadding   = math.Round( ( parent:GetPaddingTop()  + parent:GetPaddingBottom() ) / rowCount, 1 )
        end


        -- Store local reference to height
        local height = node:GetHeight()

        -- Account for margin
        height = height - ( node:GetMarginTop() + node:GetMarginBottom() )

        -- Account for parent Margin & Padding
        height = height - parentMargin - parentPadding

        -- Set calculated Container Height
        node:SetContainerHeight( math.ceil( height ) )


        -- Account for paddin
        height = height - ( node:GetPaddingTop() + node:GetPaddingBottom() )

        -- Set calculated Height
        node:SetHeight( math.ceil( height ) )
    end
