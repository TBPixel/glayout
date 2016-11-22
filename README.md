# GLayout

Garry's Mod Library for building HUD's using Grids & Columns


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