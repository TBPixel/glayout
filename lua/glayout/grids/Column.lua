------------------
-- Grid Columns --
------------------
Col	= Base:Create()


------------------------
-- Columns Properties --
------------------------


-----------------
-- CONSTRUCTOR --
-----------------
function Col:Create( id, row )

	-- Prepares a copy of the original table for instantiation
	local new = table.Copy( Col )

	-- Declares an id for the column instance
	new.id 		= id
	-- Declares an id for the parent row
	new.row 	= row

	-- Returns new instance
	if IsValid( new ) then

		return new
	else
		return false
	end
end



------------------
-- NODE METHODS --
------------------

-- Sets the number of columns to span in a row
function Col:SetSpan( span )

	-- Assert for potential errors
	assert( span >= 0, '\'span\' cannot be less than 0!' )

	self.span = span
end


-- Draw loop for the Column
function Col:Draw() end