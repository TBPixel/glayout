---------------
-- Grid Base --
---------------
Base = {}


------------------------
-- Default Properties --
------------------------

-- Columns Properties
Base.columns = {}
    Base.columns.count  = 12
    Base.columns.width = 0


-- Margins between items
Base.margin = {}
    Base.margin.top     = 0
    Base.margin.right   = 0
    Base.margin.bottom  = 0
    Base.margin.left    = 0

-- Padding within item
Base.padding = {}
    Base.padding.top    = 0
    Base.padding.right  = 0
    Base.padding.bottom = 0
    Base.padding.left   = 0

-- Remember Initial Settings
Base.start = {}
    Base.start.w = 0
    Base.start.h = 0
    Base.start.x = 0
    Base.start.y = 0

-- Actual Sizing
Base.width  = 0
Base.height = 0

-- Actual Positioning
Base.x      = 0
Base.y      = 0



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

-- Re-Calculates Width & Position based on Margin & Padding
function Base:ReCalculate()

    -- Re-Calculate Margins
    GridMath.CalcMargin ( self )
    -- Re-Calculates Padding
    GridMath.CalcPadding( self )
end


    -----------------
    -- SET MARGINS --
    -----------------
    -- Sets the margin of the instance
    function Base:SetMargin( args )

        assert( #args <= 4, 'There cannot be more than 4 arguments supplied to SetMargin!' )

        -- An empty table is supplied, reset margins
        if #args <= 0 then

            self:SetMarginTop   ( 0 )
            self:SetMarginRight ( 0 )
            self:SetMarginBottom( 0 )
            self:SetMarginLeft  ( 0 )

        -- 1 argument is supplied, set all margins to that value
        elseif #args == 1 then
            
            self:SetMarginTop   ( args[1] )
            self:SetMarginRight ( args[1] )
            self:SetMarginBottom( args[1] )
            self:SetMarginLeft  ( args[1] )

        -- 2 Arguments were supplied, set vertical and horizontal respectively
        elseif #args == 2 then

            self:SetMarginTop   ( args[ 1 ] )
            self:SetMarginRight ( args[ 2 ] )
            self:SetMarginBottom( args[ 1 ] )
            self:SetMarginLeft  ( args[ 2 ] )

        -- 3 Arguments were supplied, set top and bottom, then both left and right
        elseif #args == 3 then

            self:SetMarginTop   ( args[1] )
            self:SetMarginRight ( args[2] )
            self:SetMarginBottom( args[3] )
            self:SetMarginLeft  ( args[2] )

        -- 4 Arguments were supplied, set each individually
        elseif #args == 4 then

            self:SetMarginTop   ( args[1] )
            self:SetMarginRight ( args[2] )
            self:SetMarginBottom( args[3] )
            self:SetMarginLeft  ( args[4] )
        end
    end


    -- Sets the margin top
    function Base:SetMarginTop( value )

        assert( isnumber( value ), 'Argument 1 must be a number!' )

        self.margin.top = value

        -- Re-Calculate Size with new margins
        GridMath.CalcMargin ( self )
    end


    -- Sets the margin right
    function Base:SetMarginRight( value )

        assert( isnumber( value ), 'Argument 1 must be a number!' )

        self.margin.right = value

        -- Re-Calculate Size with new margins
        GridMath.CalcMargin ( self )
    end


    -- Sets the margin bottom
    function Base:SetMarginBottom( value )

        assert( isnumber( value ), 'Argument 1 must be a number!' )

        self.margin.bottom = value

        -- Re-Calculate Size with new margins
        GridMath.CalcMargin ( self )
    end


    -- Sets the margin left
    function Base:SetMarginLeft( value )

        assert( isnumber( value ), 'Argument 1 must be a number!' )

        self.margin.left = value

        -- Re-Calculate Size with new margins
        GridMath.CalcMargin ( self )
    end


    -----------------
    -- SET PADDING --
    -----------------
    -- Sets the margin of the instance
    function Base:SetPadding( args )

        assert( #args <= 4, 'There cannot be more than 4 arguments supplied to SetPadding!' )

        -- An empty table is supplied, reset margins
        if #args <= 0 then

            self:SetPaddingTop      ( 0 )
            self:SetPaddingRight    ( 0 )
            self:SetPaddingBottom   ( 0 )
            self:SetPaddingLeft     ( 0 )

        -- 1 argument is supplied, set all margins to that value
        elseif #args == 1 then
            
            self:SetPaddingTop      ( args[1] )
            self:SetPaddingRight    ( args[1] )
            self:SetPaddingBottom   ( args[1] )
            self:SetPaddingLeft     ( args[1] )

        -- 2 Arguments were supplied, set vertical and horizontal respectively
        elseif #args == 2 then

            self:SetPaddingTop      ( args[ 1 ] )
            self:SetPaddingRight    ( args[ 2 ] )
            self:SetPaddingBottom   ( args[ 1 ] )
            self:SetPaddingLeft     ( args[ 2 ] )

        -- 3 Arguments were supplied, set top and bottom, then both left and right
        elseif #args == 3 then

            self:SetPaddingTop      ( args[1] )
            self:SetPaddingRight    ( args[2] )
            self:SetPaddingBottom   ( args[3] )
            self:SetPaddingLeft     ( args[2] )

        -- 4 Arguments were supplied, set each individually
        elseif #args == 4 then

            self:SetPaddingTop      ( args[1] )
            self:SetPaddingRight    ( args[2] )
            self:SetPaddingBottom   ( args[3] )
            self:SetPaddingLeft     ( args[4] )
        end
    end


    -- Sets the padding top
    function Base:SetPaddingTop( value )

        assert( isnumber( value ), 'Argument 1 must be a number!' )

        self.padding.top = value

        -- Re-Calculates Padding
        GridMath.CalcPadding( self )
    end


    -- Sets the padding right
    function Base:SetPaddingRight( value )

        assert( isnumber( value ), 'Argument 1 must be a number!' )

        self.padding.right = value

        -- Re-Calculates Padding
        GridMath.CalcPadding( self )
    end


    -- Sets the padding bottom
    function Base:SetPaddingBottom( value )

        assert( isnumber( value ), 'Argument 1 must be a number!' )

        self.padding.bottom = value

        -- Re-Calculates Padding
        GridMath.CalcPadding( self )
    end


    -- Sets the padding left
    function Base:SetPaddingLeft( value )

        assert( isnumber( value ), 'Argument 1 must be a number!' )

        self.padding.left = value

        -- Re-Calculates Padding
        GridMath.CalcPadding( self )
    end


    --------------
    -- SET SIZE --
    --------------
    -- Sets the full width of the Base explicitly
    function Base:SetWidth( width )

        assert( width >= 0, 'Width must be 0 or greater!' )
        self.start.w = width

        self:ReCalculate()
    end


    -- Sets the full height of the Base explicilty
    function Base:SetHeight( height )

        assert( height >= 0, 'Height must be 0 or greater!' )
        self.start.h = height

        self:ReCalculate()
    end


    -- Runs methods for setting both the width & height of the Base
    function Base:SetSize( width, height )

        self:SetWidth( width )
        self:SetHeight( height )
    end


    ------------------
    -- SET POSITION --
    ------------------
    -- Sets the X Co-ordinate of the Base
    function Base:SetX( x )

        assert( isnumber( x ), '\'X\' must be a number!' )
        self.start.x = x

        self:ReCalculate()
    end


    -- Sets the Y Co-ordinate of the Base
    function Base:SetY( y )

        assert( isnumber( y ), '\'Y\' must be a number!' )
        self.start.y = y

        self:ReCalculate()
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