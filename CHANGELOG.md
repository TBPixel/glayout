## 0.2.1

### BUGFIX: Creating Columns Sequentially

Creating columns using a for loop would cause columns to stack on top of each other, this issue should be fixed.

Creating columns manually are unaffected and stack in the same way.


## 0.2.0

### The Column Stacking Update

Columns now stack into new rows upon exceeding the maximum width of the grid.

Columns will continue to stack indefinitely.

New rows will start their new Y position at the bottom of the tallest item from the previous row to prevent overlap and increase consistency


## 0.1.3

### The Property Passing Update

Properties of grids and columns may now be passed to the instance as a table of propery->value pairs.


## 0.1.2

### The Row Removal Update

Rows have been removed and the spacing system has been reworked to accomadate.
Rows were removed in preparation for The Stacking Columns Update™ to come.


## 0.1.1

### The Box Model Update

The box model and it's relevant calculations have been completely re-written.

* Margins now stack and work on all instances of Grids ( Grids, Rows & Columns )
* A new property has been added for content called **[INSTANCE].content.x** & **[INSTANCE].content.y**
* Padding can now be adjusted, and will modify the **content** properties of an instance
* Some sizing & positioning issues were addressed in the Box Model Update


## 0.1.0

Early commit of GLayout. Contains tools for building HUD's using a grid system.