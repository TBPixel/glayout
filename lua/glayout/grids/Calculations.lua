----------------------------
-- CALCULATIONS FOR GRIDS --
----------------------------
GridMath = {}


-- Calculates the margins of a Row or Column
function GridMath.CalcMargin( node )

    local m = node.margin

    -- Re-Calculate Size
    node.width  = node.start.w - ( m.right  + m.left )
    node.height = node.start.h - ( m.top    + m.bottom )

    -- Re-Calculate Position
    node.x = node.start.x + ( m.left )
    node.y = node.start.y + ( m.top )

    -- Calculate Column size if relevant
    if node.CalcWidthOfColumns then node:CalcWidthOfColumns() end    
end


-- Calculates the padding of a Row or Column
function GridMath.CalcPadding( node )


end