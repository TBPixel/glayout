----------------------
-- HELPER FUNCTIONS --
----------------------

-- Quickly asserts numerous arguments
function multi_assert( ... )

    -- Loop over arguments
    for _, arg in pairs{ ... } do
        
        -- Assert each argument
        assert( arg, 'Incorrect argument usage' )
    end
end