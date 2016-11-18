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
        parent.margin = {}
            parent.margin.top       = 0
            parent.margin.right     = 0
            parent.margin.bottom    = 0
            parent.margin.left      = 0

    if ( node.parent ) then

        parent.margin.top       = node.parent.box.margin.top
        parent.margin.right     = node.parent.box.margin.right
        parent.margin.bottom    = node.parent.box.margin.bottom
        parent.margin.left      = node.parent.box.margin.left
    end


    -- Caclulate Content Positioning
    c.x             = p.left    + p.right
    c.y             = p.top     + p.bottom


    local x         = s.x + m.left
    local y         = s.y + m.top
    

    -- Calculate Box Model Size
    local width     = c.width   - ( m.left + m.right )
    local height    = 0
    if ( c.height > 0 ) then
        height    = c.height  - ( m.top  + m.bottom ) - ( parent.margin.top    + parent.margin.bottom )
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