# The function `abs_eq` should return 1 if its inputs
# are equal or differ only in sign and 0 otherwise.

# Use the output builtin.
%builtins output

# Import the serialize_word() function.
from starkware.cairo.common.serialize import serialize_word

# Returns 1 if |x| = |y| (that is, x = y or x = -y),
# 0 otherwise.
func abs_eq(x : felt, y : felt) -> (bit : felt):
    if (x * x) == (y * y):
        return (bit=1)
    else:
        return (bit=0)
    end
end

func main{output_ptr : felt*}():
    let (bit) = abs_eq(2, -2)
    assert bit = 1

    serialize_word(bit)

    let (bit) = abs_eq(2, 3)
    assert bit = 0

    serialize_word(bit)

    let (bit) = abs_eq(41, 41)
    assert bit = 1

    serialize_word(bit)

    return ()
end
