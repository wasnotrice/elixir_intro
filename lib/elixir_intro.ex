defmodule ElixirIntro do
  @moduledoc """
  Documentation for ElixirIntro.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirIntro.hello
      :world

  """
  def hello do
    :world
  end

  @doc """
      iex> ElixirIntro.hello("sunshine")
      "sunshine"
  """
  def hello(name) do
    name
  end

  @doc """
      iex> ElixirIntro.banana("Karl", "F")
      \"""
      Karl, Karl fo-farl
      Bo-nanna fanna fo-farl
      Fe fi mo-marl
      Karl
      \"""
  """
  def banana(name, letter) do
    [first | rest] = String.graphemes(name)

    first = String.capitalize(first)
    rest = Enum.join(rest)
    letter = letter |> String.downcase() |> String.slice(0, 1)

    [
      intro(rest, first, letter),
      b(rest, first, letter),
      f(rest, first, letter),
      first <> rest,
      ""
    ]
    |> Enum.reverse()
    |> Enum.join("\n")
  end

  def intro(rest, first, letter) do
    name = first <> rest

    ["#{name}, #{name}", bo(rest, first, letter)]
    |> Enum.join(" ")
  end

  def b(rest, _first, _letter) do
    "Bo-nanna fanna fo-f" <> rest
  end

  def f(rest, first, letter) do
    ["Fe, fie", m(rest, first, letter)]
    |> Enum.join(" ")
  end

  def add(verse, line), do: [line | verse]

  def bo(rest, _first, _letter) do
    "bo-b" <> rest
  end

  def m(rest, first, _letter) do
    "mo-" <> name(rest, first, "m")
  end

  def name(rest, first, letter) when first in ["A", "E", "I", "O", "U", "Y"] do
    name(String.downcase(first) <> rest, nil, letter)
  end

  def name(rest, _first, letter) do
    letter <> rest
  end
end
