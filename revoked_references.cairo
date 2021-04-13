# The scope of some types of references in Cairo (e.g., return values of
# functions and temporary variables) is somewhat restricted.
# For example, a call to another function may revoke those references.
#
# 1. Try to run the following code. You should get an error that x was revoked
#    (this is because of the second call to foo).
# 2. Solve it by copying the value of `x` to a local variable
#    (e.g., local x2 = x). Local variables are not revoked when functions
#    are called.
#    Note you will need to add the instruction 'alloc_locals' to allocate the
#    necessary memory cells for the local variables.
#    You can read more about local variables [here](https://www.cairo-lang.org/docs/how_cairo_works/consts.html#local-vars).
# 3. You can even use the same name: 'local x = x'.
#    This is called "reference rebinding", where the meaning of `x` changes:
#      Before this line, `x` refers to the return value.
#      After that, `x` refers to the local variable.
# 4. A shorter syntax is 'let (local x) = foo(10)' which achieves the same goal.
#    Try it!

%builtins output

from starkware.cairo.common.serialize import serialize_word

# Returns a^3 for a != 0 and 1 otherwise.
func foo(a) -> (res):
    if a == 0:
        return (res=1)
    else:
        return (res=a * a * a)
    end
end

# Outputs the value 10^3 + 5^3.
func main{output_ptr : felt*}():
    alloc_locals
    let (local x) = foo(10)
    let (y) = foo(5)
    serialize_word(x + y)
    return ()
end
