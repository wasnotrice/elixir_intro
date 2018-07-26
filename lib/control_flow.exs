# CASE
fn name ->
  case name do
    "Gary" -> "Hi, Gary"
    "José" -> "Olá, #{name}"
    _ -> "Oh, it's you"
  end
end

# COND
fn name ->
  cond do
    name == "Gary" -> "Howdy, Gary"
    name == "José" -> "Oi, #{name}"
    _ -> "You again?"
  end
end

# IF
fn name ->
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
