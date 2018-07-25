defmodule Control do
  def hi(name) do
    case name do
      "Gary" -> "Hi, Gary"
      "José" -> "Olá, #{name}"
      _ -> "Oh, it's you"
    end
  end

  def howdy(name) do
    cond do
      name == "Gary" -> "Howdy, Gary"
      name == "José" -> "Oi, #{name}"
      true -> "You again?"
    end
  end

  def goodbye(name) do
    if name == "Gary" do
      "Goodbye, Gary"
    else
      if name == "José" do
        "Tchau, #{name}"
      else
        "Good riddance"
      end
    end
  end
end

defmodule Clauses do
  def hi("Gary") do
    "Hi, Gary"
  end

  def hi(name) when name == "José" do
    "Olá, #{name}"
  end

  def hi(names) when is_list(names) do
    Enum.map(names, &hi/1)
  end

  def hi(_) do
    "Oh, it's you"
  end
end
