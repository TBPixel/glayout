---------------
-- Grid Rows --
---------------
Row = Base:Create()


--------------------
-- Row Properties --
--------------------
Row.columns	= {}
	Row.columns.nodes = {}
	Row.columns.width = 0



------------------
-- NODE METHODS --
------------------

-- Creates a column to be used in the instanced row
function Row:CreateCol( span )

	-- Ensure span is set
	assert( span > 0, '\'Span\' must be set to greater than 0!' )

	local id = #self.columns.nodes + 1

    -- Creates a new row instance for use
    local new = Col:Create( id, self.id )

    -- Setup new column
    new:SetWidth( self.columns.width * span )

    -- Adjust for margins
    local pos = {}
        pos.x = self.x
        pos.y = self.y

    for _, col in ipairs( self.columns.nodes ) do

        local m = col.margin.left + col.margin.right
        pos.x = pos.x + col.width + m
    end

    new:SetPos( pos.x, pos.y )

    -- Send column width to new child
    new.columns.width = self.columns.width

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


-- Draw loop for the Column
function Row:Draw()

	for _, column in ipairs( self.columns.nodes ) do

		if column.Draw then column:Draw() end
	end
end