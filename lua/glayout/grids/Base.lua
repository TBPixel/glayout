---------------
-- Grid Base --
---------------
Base = {}


------------------------
-- Default Properties --
------------------------

-- Margins between items
Base.margin = {}
	Base.margin.top 	= 0
	Base.margin.right 	= 0
	Base.margin.bottom	= 0
	Base.margin.left 	= 0

-- Padding within item
Base.padding = {}
	Base.padding.top 	= 0
	Base.padding.right 	= 0
	Base.padding.bottom	= 0
	Base.padding.left 	= 0

-- Child Sizing
Base.width 	= 0
Base.height = 0

-- Child Positioning
Base.x 		= 0
Base.y 		= 0



-----------------
-- Constructor --
-----------------
function Base:Create( id )

	if not id then id = nil end

	-- Prepares a copy of the original table for instantiation
	local new = table.Copy( self )

	new.id = id

	-- Returns new instance
	if IsValid( new ) then

		return new
	else
		return false
	end
end



-------------
-- SETTERS --
-------------

-- Sets the full width of the Base explicitly
function Base:SetWidth( width )

	assert( width >= 0, 'Width must be 0 or greater!' )
	self.width = width
end


-- Sets the full height of the Base explicilty
function Base:SetHeight( height )

	assert( height >= 0, 'Height must be 0 or greater!' )
	self.height = height
end


-- Runs methods for setting both the width & height of the Base
function Base:SetSize( width, height )

	self:SetWidth( width )
	self:SetHeight( height )
end


-- Sets the X Co-ordinate of the Base
function Base:SetX( x )

	assert( isnumber( x ), '\'X\' must be a number!' )
	self.x = x
end


-- Sets the Y Co-ordinate of the Base
function Base:SetY( y )

	assert( isnumber( y ), '\'Y\' must be a number!' )
	self.y = y
end


-- Sets the X & Y Co-ordinates of the Base
function Base:SetPos( x, y )

	self:SetX( x )
	self:SetY( y )
end



-------------
-- GETTERS --
-------------

-- Returns Base Width
function Base:GetWidth()

	return self.width
end


-- Returns Base Height
function Base:GetHeight()

	return self.height
end


-- Returns Base Width & Height
function Base:GetSize()

	return self.width, self.height
end


-- Returns Base X Position
function Base:GetX()

	return self.x
end


-- Returns Base Y Position
function Base:GetY()

	return self.y
end


-- Returns Base X & Y Positions
function Base:GetPos()

	return self.x, self.y
end



----------
-- GMOD --
----------

-- For GMod's IsValid method integration
function Base:IsValid()

	return true
end