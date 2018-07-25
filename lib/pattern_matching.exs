# Simple values
x = 1
1 = x

x = 2
2 = x
3 = x

# Tuples
{a, b, c} = {1, 2, 3}
{a, b, c} = {1, 2}
{a, b, c} = {1, 2, 3, 4}
{a, b, c} = [a, b, c]
{a, b, c, _} = {1, 2, 3, 4}
{:ok, message} = {:ok, "go"}
{:ok, message} = {:error, "no go"}

# Lists
[a, b, c] = [1, 2, 3]
[a, b] = [1, 2]
[a, b, c] = [1, 2, 3, 4]
[a, b, c] = {a, b, c}
[a, b, c, _] = [1, 2, 3, 4]

[a | tail] = [1, 2, 3, 4]
[a, b | tail] = [1, 2, 3, 4]
[a, 2, c, 4 | tail] = [1, 2, 3, 4]
[a, {:ok, b}, c, d] = [1, {:ok, "b"}, {:ok, "c"}, ["d", "dee"]]
[a, b, c, d] = [a, b, {:ok, c}, [d, d]]
[_, b | _] = [a, b, c, d]

# Pinning
[a, b, c] = [1, 2, 3]
[a, b, c] = [1, 2, 4]
[a, b, ^c] = [1, 2, 3]
