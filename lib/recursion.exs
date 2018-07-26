defmodule Recursion do
  def sum(list) do
    # IO.inspect([list: list], label: "sum/1")
    sum(list, 0)
  end

  defp sum([], total) do
    # IO.inspect([list: [], total: total], label: "sum/2a")
    total
  end

  defp sum([head | tail], total) do
    # IO.inspect([head: head, tail: tail, total: total], label: "sum/2b")
    sum(tail, total + head)
  end

  def fib(x) when x < 3 do
    case x do
      1 -> [1]
      2 -> [1, 1]
      _ -> raise "Can't fib #{x}"
    end
  end

  def fib(count) do
    # IO.inspect([list: [], count: count], label: "fib/1c")
    fib([1, 1], count - 2)
  end

  defp fib(list, 0) do
    # IO.inspect([list: list, count: 0], label: "fib/2b")
    Enum.reverse(list)
  end

  defp fib([last, next | _] = list, count) do
    # IO.inspect([list: list, last: last, next: next, count: count], label: "fib/2a")
    fib([last + next | list], count - 1)
  end
end
