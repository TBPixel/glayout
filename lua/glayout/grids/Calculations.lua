----------------------------
-- CALCULATIONS FOR GRIDS --
----------------------------
GridMath = {}


-- Calculates Box Model --
function GridMath.CalcBoxModel( node )

    -- Get Box Model Properties
    local BoxModel  = node.box
        local m     = BoxModel.margin
        local p     = BoxModel.padding
        local c     = BoxModel.content

    local s = node.start


    -- Caclulate Content Positioning
    c.x             = p.left    + p.right
    c.y             = p.top     + p.bottom


    local x         = s.x + m.left
    local y         = s.y + m.top
    

    -- Calculate Box Model Size
    local width     = c.width   - ( m.left + m.right )
    local height    = c.height  - ( m.top  + m.bottom )


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