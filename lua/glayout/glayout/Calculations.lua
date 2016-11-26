---------------
-- GRID MATH --
---------------

-- Store Local Reference of GridMath
GridMath = {}



-------------------------
-- Calculate Box Model --
-------------------------

function GridMath:CalcBoxModel( node, parent )

    -- Initialize GridMath for this instance
    self:Init( node )


    -- Calculate Position of Node
    self:CalcPos( parent )

    -- Calculate Size of Node
    self:CalcSize( parent )
end



-------------------------
-- CALCULATION METHODS --
-------------------------

-- Adjusts position based on margin's
function GridMath:CalcPos( parent )

    -- Calculates Position X
    self:CalcPosX( parent )

    -- Calculates Position Y
    self:CalcPosY( parent )
end

    -- Calculates and updates X Position based on Margin & Padding
    function GridMath:CalcPosX( parent )

        -- Set default for argument
        parent = parent or false


        -- Store local reference to x
        local x = self.x

        -- Account for margin
        x = x + self.margin.left

        -- Set calculated X
        self.node:SetContainerX( math.Round( x, 1 ) )


        -- Account for padding
        x = x + self.padding.left

        -- Set calculated Container X
        self.node:SetX( math.Round( x, 1 ) )
    end

    -- Calculates and updates Y Position based on Margin & Padding
    function GridMath:CalcPosY( parent )

        -- Set default for argument
        parent = parent or false


        -- Store local reference to y
        local y = self.y

        -- Account for margin
        y = y + self.margin.top

        -- Set calculated Y
        self.node:SetContainerY( math.Round( y, 1 ) )


        -- Account for padding
        y = y + self.padding.top

        -- Set Calculated Y Container
        self.node:SetY( math.Round( y, 1 ) )
    end


-- Adjusts size based on Margin's & Padding
function GridMath:CalcSize( parent )

    -- Calculates Width
    self:CalcWidth( parent )

    -- Calculates Height
    self:CalcHeight( parent )
end

    -- Calculates & Updates Width based on Margin & Padding
    function GridMath:CalcWidth( parent )

        -- Set default for argument
        parent = parent or false

        -- Fallback values for parent
        local parentMargin  = 0
        local parentPadding = 0

        -- Get Parent values
        if parent then

            -- Get number of rows in column
            local row       = true and self.node.row or false
            local count     = 1

            if row then count = parent:GetRowColumnCount( row ) end

            -- Get margin & padding / number of rows
            parentMargin    = math.Round( ( parent.margin.left   + parent.margin.right ) / count, 1 )
            parentPadding   = math.Round( ( parent.padding.left  + parent.padding.right ) / count, 1 )
        end


        -- Store local reference to width
        local width = self.width

        -- Account for margins
        width = width - ( self.margin.left + self.margin.right )

        -- Account for parent margin & padding
        width = width - parentMargin - parentPadding

        -- Set calculated Width
        self.node:SetContainerWidth( math.Round( width, 1 ) )


        -- Account for padding
        width = width - ( self.padding.left + self.padding.right )

        -- Set calculated Width
        self.node:SetWidth( math.Round( width, 1 ) )
    end

    function GridMath:CalcHeight( parent )

        -- Set default for argument
        parent = parent or false

        -- Fallback values for parent
        local parentMargin  = 0
        local parentPadding = 0

        -- Get Parent values
        if parent then

            local rowCount  = parent:GetRowCount()

            parentMargin    = math.Round( ( parent.margin.top   + parent.margin.bottom ) / rowCount, 1 )
            parentPadding   = math.Round( ( parent.padding.top  + parent.padding.bottom ) / rowCount, 1 )
        end


        -- Store local reference to height
        local height = self.height

        -- Account for margin
        height = height - ( self.margin.top + self.margin.bottom )

        -- Account for parent Margin & Padding
        height = height - parentMargin - parentPadding

        -- Set calculated Container Height
        self.node:SetContainerHeight( math.Round( height, 1 ) )


        -- Account for padding
        height = height - ( self.padding.top + self.padding.bottom )

        -- Set calculated Height
        self.node:SetHeight( math.Round( height, 1 ) )
    end



---------------------------
-- INITIALIZATION METHOD --
---------------------------

-- Initialize GridMath & pass node instance
function GridMath:Init( node )

    -- Store property reference to node
    self.node       = node

    -- Store Node Margin & Padding
    self.margin     = self.node.margin
    self.padding    = self.node.padding

    -- Store Container
    self.container  = self.node.container

    -- Store Node X & Y
    self.x          = self.node.x
    self.y          = self.node.y

    -- Store Node Width & Height
    self.width      = self.node.width
    self.height     = self.node.height
end
