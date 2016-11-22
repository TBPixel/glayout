------------------
-- Grid Columns --
------------------
Column = Base:Create()


---------------------
-- Grid Properties --
---------------------


-----------------
-- CONSTRUCTOR --
-----------------

function Column:Create()

    -- Prepare a new instance of Grid
    local new = table.Copy( self )


    -- Ensure new instance is valid
    if not IsValid( new ) then return false end


    -- Return new instance
    return new
end



-----------------
-- GET METHODS --
-----------------

function Column:GetColumnWidth()

    return self.columnWidth
end


-----------------
-- SET METHODS --
-----------------