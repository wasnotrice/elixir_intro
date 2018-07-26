defmodule Recursion do
  def sum(list) do
    sum(list, 0)
  end

  defp sum([], acc) do
    acc
  end

  defp sum([head | tail], acc) do
    acc + head + sum(tail)
  end

  def fib(1) do
    [1]
  end

  def fib(2) do
    [1, 1]
  end

  def fib(count) do
    fib([1, 1], count - 2)
  end

  defp fib(list, 0) do
    Enum.reverse(list)
  end

  defp fib([last, next | _] = list, count) do
    fib([last + next | list], count - 1)
  end
end
