defmodule Outline do
  def intro(13) do
    [
      elixir: [
        created: "???",
        bdfl: "José Valim",
        characteristics: [
          :dynamic,
          :compiled,
          :targets_beam,
          :functional,
          :immutable,
          :actor_model,
          :otp
        ],
        influences: [
          :erlang,
          :ruby,
          :clojure,
          :lisp
        ]
      ],
      erlang: [
        created: 1986,
        characteristics: [
          :dynamic,
          :compiled,
          :targets_beam,
          :functional,
          :immutable,
          :actor_model,
          :otp
        ],
        influences: [
          :prolog
        ]
      ]
    ]
  end

  def types(10) do
    [
      number: 1,
      atom: :hello,
      string: "world",
      string: "🚀👨‍🚀⭐",
      list: [:one, :two, 3],
      tuple: {:ok, "go"},
      function: fn x -> 2 * x end,
      keyword: [a: 1, b: 2, b: "two"],
      map: %{a: 1, b: 2, c: 3}
    ]
  end

  def operators(5) do
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

  def pattern_matching(10) do
    [
      :match_operator,
      :destructuring,
      :head_and_tail
    ]
  end

  def control(5) do
    [
      :case,
      :cond,
      :if,
      :everything_returns_a_value
    ]
  end

  def keywords_and_maps do
    [:keywords, :maps]
  end

  def modules(10) do
    [:modules, :pattern_matching]
  end

  def recursion(:too_much) do
    [:recursion]
  end

  def enum(:skip) do
    [:each, :map, :reduce, :pipes]
  end

  def processes(30) do
    [:spawn, :spawn_link, :spawn_monitor]
  end

  def tooling do
    [:iex, :mix, :exunit, :doctest]
  end

  def otp do
    [:supervisors]
  end
end
