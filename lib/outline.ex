defmodule Outline do
  def sections do
    [:types, :operators, :control, :pattern_matching, :modules]
  end

  def types do
    [
      number: 1,
      atom: :hello,
      string: "world",
      list: [:one, :two, 3],
      tuple: {:ok, "go"},
      function: fn x -> "Hi, " <> x end,
      keyword: [one: 1, two: 2, two: "two"],
      map: %{one: 1, two: 2, three: 3}
    ]
  end

  def control do
    [
      :if,
      :case,
      :cond
    ]
  end
end
