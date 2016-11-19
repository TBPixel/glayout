# GLayout

Garry's Mod Library for building HUD's using grids

## API Example


### Creating a simple grid

```lua
-- First we create our main Grid
local grid = Grid:Create()

    -- Declare the width of our grid
    grid:SetWidth( ScrW() )
    -- Declare the starting position of our grid
    grid:SetPos( 0, ScrH() - ( ScrH() / 10 ) )

-- Then Initialize your grid
grid:Init() -- A lot of math is done only once in :Init() to improve performance


-- Finally, we'll create our columns
local col = {} -- Table to store columns


-- We create a new column that spans 3 ( out of a default 12 ) columns in our grid
col[1] = grid:CreateCol( 3 )

    -- We tell our column how tall it should be
    col[1]:SetHeight( ScrH() / 10 )

    -- Let's just draw a simple box for now
    col[1].Draw = function( self ) -- Don't forget to pass the column with the 'self' value
    
        -- We're passing our positioning and sizing properties to our box
        draw.RoundedBox( 0, self.x, self.y, self.width, self.height, Color( 0, 0, 0, 200 ) )
    end

-- Finally, we initialize our column
col[1]:Init()


-- And now we just tell GMod to draw our grid!
function HUDPaint_custom() grid:DrawGrid() end

hook.Add( 'HUDPaint', 'HUDPaint_custom', HUDPaint_custom )
```


### Creating a grid with Property Passing

GLayout allows you to pass properties as a table of key->value pairs instead of running functions yourself. Let's create the same grid using property passing

```lua
-- Create main grid
local grid  = Grid:Create(
{
    -- Size is a property that contains the width & height properties
    size    =
    {
        width   = ScrW(),
    },
    -- Pos is a property that contains the x & y properties
    pos     =
    {
        x       = 0,
        y       = ScrH() - ( ScrH() / 10 )
    }
})

-- Initialize Grid
grid:Init()


-- Table of columns
local col = {}


-- Create a column
col[1] = grid:CreateCol(
{
    -- Columns to span
    span = 3,
    -- Set Column Height
    size =
    {
        height = ScrH() / 10,
    },
})
    
    -- Set our draw loop
    col[1].Draw = function( self ) -- Pass self to be referenced inside of annonymous function
    
        draw.RoundedBox( 0, self.x, self.y, self.width, self.height, Color( 0, 0, 0, 200 ) )
    end

-- Initialize Column
col[1]:Init()


-- And now we just tell GMod to draw our grid!
function HUDPaint_custom() grid:DrawGrid() end

hook.Add( 'HUDPaint', 'HUDPaint_custom', HUDPaint_custom )
```

While technically being more lines of code, it's clearer, and more importantly the data is being passed as a table.
This means you can create a table of default properties to pass to multiple columns ( or grids ) and just pass the variable repeatedly.
You can even change a single value in the table by simply referencing it directly. So if you wanna change column span, you could write:

```lua
-- Properties Table as Variable
local props =
{
    -- Set Span
    span    = 6,
    -- Set some margins
    margin  =
    {
        right:  20,
        bottom: 20,
        left:   20
    }
}

-- Change span to 12!
props.span  = 12
```

Going forward now, every new column would get the same margins, but their span would be 12 instead of 6!


## Roadmap

* ~~0.1.1 - Box Model's~~

    * ~~Re-Write the Box Model System to be more functional~~

* ~~0.1.2 - Row Removal~~
    
    * ~~Row's have been removed as the stacking update will simplify what problems rows were intended to solve~~


* ~~0.1.3 - Property Passing~~

    * ~~Properties can be passed to grid instances as a table of property->value pairs~~


* ~~0.2.0 - Columns Stacking~~
    
    * ~~Columns whose width, when added onto the rest of the current row, exceed the maximum width of the grid should stack~~