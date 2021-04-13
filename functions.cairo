# The following code is missing the function `add1`.
# 1. Click on "Run" to see the error.
# 2. Write the function `add1`, based on `add1_square`, so
#    that the program terminates successfully.

# Use the output builtin.
%builtins output

# Import the serialize_word() function.
from starkware.cairo.common.serialize import serialize_word

func add1(y : felt) -> (z : felt):
    return (z=y + 1)
end

func add1_square(x : felt) -> (x : felt):
    # Call `add1` and unpack the result into `z`.
    let (z) = add1(y=x)
    return (x=z * z)
end

func main{output_ptr : felt*}():
    # Call `add1_square` and save the result into `res`.
    let (res) = add1_square(x=12)

    # Verify the computation.
    assert res = (12 + 1) * (12 + 1)
    
    serialize_word(res)
    
    return ()
end
