[a: "a", b: "b", c: "c", a: "A"]
[{:a, "a"}, {:b, "b"}, {:c, "c"}, {:a, "A"}]

%{a: "a", b: "b", c: "c", a: "A"}
%{"a" => "a", "b" => "b", "c" => "c", "a" => "A"}
%{1 => "a", [] => "b", :three => "c", "four" => "A"}

# Reading values
map.a
map[:a]
Map.get(map, :a)
Map.fetch(map, :a)
Map.fetch!(map, :a)

# "Modifying" a map. Only through functions
Map.put(map, :a, "aaa")
Map.put_new(map, :a, "AAA")
Map.put_new(map, :i, "iii")
Map.update(map, :j, "jjj", fn old -> old <> "JJJ" end)
Map.delete(map, :j)
