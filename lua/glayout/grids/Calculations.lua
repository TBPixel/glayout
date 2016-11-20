----------------------------
-- CALCULATIONS FOR GRIDS --
----------------------------
GridMath = {}


-- Calculates Box Model --
function GridMath.CalcBoxModel( node )

    -- Get Box Model Properties
    local box  = node.box
        local m     = box.margin
        local p     = box.padding
        local c     = box.content

    local s = node.start

    -- Parent Grid
    local parent = {}
        -- Parent Margins
        parent.margin = {}
            parent.margin.top       = 0
            parent.margin.right     = 0
            parent.margin.bottom    = 0
            parent.margin.left      = 0
        -- Parent Padding
        parent.padding = {}
            parent.padding.top      = 0
            parent.padding.right    = 0
            parent.padding.bottom   = 0
            parent.padding.left     = 0


    -- Update values only if node has a parent ( aka columns )
    if ( node.parent ) then

        -- Gets Margins to update individual columns with
        local parentMargin = node.parent.box.margin

        parent.margin.top       = parentMargin.top
        parent.margin.right     = parentMargin.right
        parent.margin.bottom    = parentMargin.bottom
        parent.margin.left      = parentMargin.left

        -- Gets Padding to update individual columns with
        local parentPadding = node.parent.box.padding

        parent.padding.top      = parentPadding.top
        parent.padding.right    = parentPadding.right
        parent.padding.bottom   = parentPadding.bottom
        parent.padding.left     = parentPadding.left
    end


    -- Caclulate Content Positioning
    c.x             = p.left    + p.right
    c.y             = p.top     + p.bottom


    local x         = s.x + m.left  + parent.padding.left
    local y         = s.y + m.top   + parent.padding.top
    

    -- Calculate Box Model Size
    local width     = c.width   - ( m.left + m.right ) - parent.padding.left
    local height    = 0
    if ( c.height > 0 ) then
        height    = c.height  - ( m.top  + m.bottom ) - ( parent.margin.top    + parent.margin.bottom ) - ( parent.padding.top + parent.padding.bottom )
    end


    -- Set Positioning
    node.x          = x
    node.y          = y
    
    -- Set Sizing
    node.width      = width
    node.height     = height

    -- Set Content Positioning
    node.content.x  = c.x + x
    node.content.y  = c.y + y

    -- Re Caculate Columns if relevant
    if node.CalcWidthOfColumns then node:CalcWidthOfColumns() end    
end