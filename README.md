# GLayout

Garry's Mod Library for building HUD's using Grids & Columns


## Legend

* [GLayout](#glayout)
* [API](#api)
* [Documentation](#documentation)
    * [Grids & Columns](#grids-and-columns--aka-base-)
    * [Grids](#grids)
    * [Columns](#columns)
* [Roadmap](#roadmap)
* [Changelog](https://github.com/TBPixel/glayout/blob/master/CHANGELOG.md)
* [License](https://github.com/TBPixel/glayout/blob/master/LICENSE)


## API

### Examples

#### Creating a simple grid

```lua
-- First, we declare our grid instance
local grid = Grid:Create()

    -- Next, we tell our grid how big it will be
    -- This also sets our breakpoint for when new rows will be created
    grid:SetWidth( ScrW() )
    -- Set Position of Grid
    grid:SetPos( 0, ScrH() - ( ScrH() / 8 ) )
    -- Set Margin of grid ( spacing from it's starting position and ending size )
    -- Margin's set in order of Top -> Right -> Bottom -> Left
    grid:SetMargin( 0, 20, 20, 20 )


-- Now we'll create a column in our grid
-- Grids, by default, have 12 columns. 6 would be half, meaning half of our grids width
local col = grid:CreateColumn( 6 )

    -- We tell our column to be 1/8th of the screen's height. This means it'll be 20px from the bottom of the screen, thanks to grid margin's
    col:SetHeight( ScrH() / 8 )
    -- We set some padding on our column to space it's content a bit away from it's container
    col:SetPadding( 20, 20, 20, 20 )

    -- Next, we tell our column what to draw
    col.Draw = function( self )

        -- Let's draw our column container first

        -- Container's are stored in their own dictionary, but contain the same properties as a grid or column's box does ( x, y, width & height )
        local container = self.container

        -- Pass the container properties to the draw. We'll give it a slightly transparent black color
        draw.RoundedBox( 0, container.x, container.y, container.width, container.height, Color( 0, 0, 0, 200 ) )


        -- Now let's draw our column's content
        draw.RoundedBox( 0, self.x, self.y, self.width, self.height, Color( 255, 255, 255, 200 ) )
    end

-- Finally, we must initialize our grid
grid:Init()


-- And now, simply run the Grid:DrawGrid() method in HUDPaint
function HUDPaint_custom()

    -- Draw Grid & Columns
    grid:DrawGrid()
end

-- Hook custom function into HUDPaint
hook.Add( 'HUDPaint', 'HUDPaint_custom', HUDPaint_custom )
```

Of course, even with the math done for you, that's a lot of work for a box-inside-a-box at the bottom of the screen. Grid's are powerful because of their structure and flow. Try creating a grid with more columns, experiment with spacing, or even draw to the Grid itself ( *Hint*: you can just set Grid.Draw to a function, just like the column )


<br />

### Documentation


#### Grids and Columns ( aka: Base )

---

##### Base:Create()

Creates & returns a new valid instance of Base. Used internally on both Grid's & Columns.

---

##### Base:Draw()

While empty be default, everything in GLayout does have a Draw Method

---

##### Base:DrawDebug()

Used inside of Base:Draw() method. Provides useful insight into complex box model. Mostly used for development. Text can overlap.

---

##### Base:GetMargin()

Returns the all 4 sides of margin on an instance

Returns in the order of

* top
* right
* bottom
* left

or clockwise from top-to-left

---

##### Base:GetMarginTop()

Returns margin top of instance

---

##### Base:GetMarginRight()

Returns margin right of instance

---

##### Base:GetMarginBottom()

Returns margin bottom of instance

---

##### Base:GetMarginLeft()

Returns margin left of instance

---

##### Base:GetPadding()

Returns the all 4 sides of padding on an instance

Returns in the order of

* top
* right
* bottom
* left

or clockwise from top-to-left

---

##### Base:GetPaddingTop()

Returns padding top of instance

---

##### Base:GetPaddingRight()

Returns padding right of instance

---

##### Base:GetPaddingBottom()

Returns padding bottom of instance

---

##### Base:GetPaddingLeft()

Returns padding left of instance

---

##### Base:GetContainerPos()

Returns both the X & Y positions of the instance container

---

##### Base:GetContainerX()

Returns the X position of the instance container

---

##### Base:GetContainerY()

Returns the Y position of the instance container

---

##### Base:GetContainerSize()

Returns both the Width & Height of the instance container

---

##### Base:GetContainerWidth()

Returns the Width position of the instance container

---

##### Base:GetContainerHeight()

Returns the Height position of the instance container

---

##### Base:GetPos()

Returns both the X & Y positions of the instance

---

##### Base:GetX()

Returns the X position of the instance

---

##### Base:GetY()

Returns the Y position of the instance

---

##### Base:GetSize()

Returns both the Width & Height of the instance

---

##### Base:GetWidth()

Returns the Width position of the instance

---

##### Base:GetHeight()

Returns the Height position of the instance

---

##### Base:IsValid()

Returns true, and ensures GMod's IsValid() global method will return true for grid instances, should the need arise

---

##### Base:PassProps( *Table* Properties )

**Arguments**

* Properties
    
    * Used in the constructor for both grids & columns, PassProps accepts properties as a table of key->value pairs, and runs methods based on passed data.

---

##### Base:SetMargin( *Number* top, *Number* right, *Number* bottom, *Number* left )

**Arguments**

* Top
    
    * Sets the margin top of the instance

* Right
    
    * Sets the margin right of the instance

* Bottom
    
    * Sets the margin bottom of the instance

* Left
    
    * Sets the margin left of the instance

---

##### Base:SetMarginTop( *Number* top )

**Arguments**

* Top
    
    *Sets the margin top of the instance

---

##### Base:SetMarginRight( *Number* right )

**Arguments**

* Right
    
    *Sets the margin right of the instance

---

##### Base:SetMarginBottom( *Number* bottom )

**Arguments**

* Bottom
    
    *Sets the margin bottom of the instance

---

##### Base:SetMarginLeft( *Number* left )

**Arguments**

* Left
    
    *Sets the margin left of the instance

---


##### Base:SetPadding( *Number* top, *Number* right, *Number* bottom, *Number* left )

**Arguments**

* Top
    
    * Sets the padding top of the instance

* Right
    
    * Sets the padding right of the instance

* Bottom
    
    * Sets the padding bottom of the instance

* Left
    
    * Sets the padding left of the instance

---

##### Base:SetPaddingTop( *Number* top )

**Arguments**

* Top
    
    *Sets the padding top of the instance

---

##### Base:SetPaddingRight( *Number* right )

**Arguments**

* Right
    
    *Sets the padding right of the instance

---

##### Base:SetPaddingBottom( *Number* bottom )

**Arguments**

* Bottom
    
    *Sets the padding bottom of the instance

---

##### Base:SetPaddingLeft( *Number* left )

**Arguments**

* Left
    
    *Sets the padding left of the instance

---

##### Base:SetContainerPos( *Number* x, *Number* y )

Mostly used internally. Shouldn't have to touch.

**Arguments**

* X
    
    * Sets X position of instance container

* Y
    * Sets Y position of instance container

---

##### Base:SetContainerX( *Number* x )

Mostly used internally. Shouldn't have to touch.

**Arguments**

* X
    
    * Sets X position of instance container

---

##### Base:SetContainerY( *Number* y )

Mostly used internally. Shouldn't have to touch.

**Arguments**

* Y
    
    * Sets Y position of instance container

---

##### Base:SetContainerSize( *Number* width, *Number* height )

Mostly used internally. Shouldn't have to touch.

**Arguments**

* Width

    * Sets Width of instance container

* Height

    * Sets Height of instance container

---

##### Base:SetContainerWidth( *Number* width )

Mostly used internally. Shouldn't have to touch.

**Arguments**

* Width

    * Sets Width of instance container

---


##### Base:SetContainerHeight( *Number* height )

Mostly used internally. Shouldn't have to touch.

**Arguments**

* Height

    * Sets Height of instance container

---

##### Base:SetPos( *Number* x, *Number* y )

**Arguments**

* X

    * Sets the X position of the instance

* Y
    
    * Sets the Y position of the instance

---

##### Base:SetX( *Number* x )

**Arguments**

* X
    
    * Sets the X position of the instance

---

##### Base:SetY( *Number* y )

**Arguments**

* Y
    
    * Sets the Y position of the instance

---

##### Base:SetSize( *Number* width, *Number* height )

**Arguments**

* Width

    * Sets the Width of the instance

* Height

    * Sets the Height of the instance

---

##### Base:SetWidth( *Number* width )

**Arguments**

* Width

    * Sets the Width of the instance

---

##### Base:SetHeight( *Number* height )

**Arguments**

* Height

    * Sets the Height of the instance



<br />

#### Grids

---

##### Grid:Create( *Table* properties )

**Arguments**

* *Optional* Properties
    
    * If set, allows grid properties to be passed through a table of key->value pairs

---

##### Grid:AddRow()

Creates a new row and returns it's id. Used internally.

---

##### Grid:CreateColumn( *Number or Table* properties )

**Arguments**

* *Number* Span
    
    * If argument is a number, tells the new column how many grid columns to span

* *Table* Properties
    
    * If argument is a table, properties will be passed to column as key->value pairs

    * *NOTE*: the 'span' property is **required** when passing a table

---

##### Grid:DrawGrid()

Calls *Draw* method on self & all columns within grid

---

##### Grid:GetColumnCount()

Returns the number columns the grid can span

---

##### Grid:GetColumn( *Number or Table* row, *Number* id )

Returns the column found within a row, or false if not found

**Arguments**

* Row

    * The Row id or Row Table to search

* id
    
    * The column id to find

---

##### Grid:GetRowColumnCount( *Number or Table* row )

Returns the number of columns within a row

**Arguments**

* Row

    * The Row id or Row Table to search

---

##### Grid:GetRow( *Number* id )

Returns the table row if found, or false

**Arguments**

* id

    ** The Row id to search

---

##### Grid:GetRows()

Returns table of all rows in Grid

---

##### Grid:GetRowCount()

Returns number of rows in Grid

---

##### Grid:GetRowWidth( *Number or Table* row )

Returns the total width of a row, composed of it's columns

**Arguments**

* Row

    * The Row id or Table to run on

---

##### Grid:GetRowHeight( *Number or Table* row )

Returns the tallest column's height of a row

**Arguments**

* Row

    * The Row id or Table to run on

---

##### Grid:GetWidthOfColumns()

Returns the width of an individual column span ( eg. Grid Width / Grid Column Count )

---

##### Grid:Init()

Runs GridMath & internal methods to initialize grid.

Use this *only once* after you've created your grid and all it's columns.

---

##### Grid:LoopAllColumns( *Function* callback )

Runs the given callback on all columns within the grid.

**Method Arguments**

* Callback

    * A function to run


**Callback Arguments**

* i
    
    * The index of the column current in the loop

* Column

    * The column table current in the loop

---

##### Grid:LoopRowColumns( *Number or Table* row, *Function* callback )

Runs the given callback on all columns within the given row

**Method Arguments**

* Row

    * The Row id or Table to search

* Callback

    * A function to run


**Callback Arguments**

* i
    
    * The index of the column current in the loop

* Column

    * The column table current in the loop

---

##### Grid:LoopRows( *Function* callback )

Runs the given callback on all rows

**Method Arguments**

* Callback

    * A function to run


**Callback Arguments**

* i
    
    * The index of the row current in the loop

* Row

    * The row table current in the loop

---

##### Grid:UpdateColumnPositions()

Adjusts every columns X & Y positions for column stacking

*Needs Refactoring* - This method is a mess. Work must be done to clean it up. But it works 100% of the time.

---

##### Grid:UpdateColumnSizes()

Runs Grid Math on columns to adjust size. Used internally



<br />

#### Columns

---

##### Column:Create()

Returns a new column instance for creating. Used by Grid:CreateColumn.

*NOTE*: Grid:CreateColumn performs all of the work for sizing and positioning, and simply refers to this method for instantiation.



<br />

## Roadmap

* ~~0.1.1 - Box Model's~~

    * Re-Write the Box Model System to be more functional

* ~~0.1.2 - Row Removal~~
    
    * Row's have been removed as the stacking update will simplify what problems rows were intended to solve


* ~~0.1.3 - Property Passing~~

    * Properties can be passed to grid instances as a table of property->value pairs


* ~~0.2.0 - Columns Stacking~~
    
    * Columns whose width, when added onto the rest of the current row, exceed the maximum width of the grid should stack


* ~~0.2.3 - Grid Y Auto Updating~~

    * Grids Y position ( along with all columns ) can now be automatically updated

    * Simply use Grid:AutoUpdateY() method **AFTER** all your columns are created


* ~~0.3.0 - Refactoring~~

    * Refactor code to be more readable, organized and re-usable

    * Simplify Grid Math by re-thinking previous idea's for Grid Calculations


* Grid Auto Update Y
    
    * Re-Add Auto Update Y Feature


* Grid Direction
    
    * Grid Direction will allow grids to be created as row's ( default ) or columns

    * 'Column' direction will allow grids to be created *vertically*, rather than the standard horizontally. Grids will stack into new columns upon reaching the Grid's maximum height