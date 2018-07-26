defmodule Outline do
  def types do
    [
      number: 1,
      atom: :hello,
      string: "world",
      string: "🚀👨‍🚀⭐",
      list: [:one, :two, 3],
      tuple: {:ok, "go"},
      function: fn x -> "Hi, " <> x end,
      keyword: [a: 1, b: 2, b: "two"],
      map: %{a: 1, b: 2, c: 3}
    ]
  end

  def operators do
    [
      :+,
      :++,
      :<>,
      :and,
      :or,
      :not,
      :&&,
      :||,
      :!
    ]
  end

  def pattern_matching do
    [
      :match_operator,
      :destructuring,
      :head_and_tail
    ]
  end

  def control do
    [
      :case,
      :cond,
      :if,
      :values
    ]
  end

  def keywords_and_maps do
    [:keywords, :maps]
  end

  def modules do
    [:modules, :pattern_matching]
  end

  def recursion do
    [:recursion]
  end

  def enum do
    [:each, :map, :reduce, :pipes]
  end

  def processes do
    [:spawn, :spawn_link]
  end

  def tooling do
    [:iex, :mix, :exunit, :doctest]
  end

  def otp do
    [:supervisors]
  end
end
