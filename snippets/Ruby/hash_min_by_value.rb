results = {
"a" => 10,
"b" => 10,
"c" => 10,
"d" => 10,
"e" => 10,
"f" => 10,
"g" => 10,
"h" => 0,
"i" => 10,
"j" => 10,
"k" => 10,
"l" => 10,
"m" => 10,
"n" => 10,
"o" => 10,
"p" => 10,
"q" => 1,
"r" => 11,
"s" => 22,
"t" => 33,
"u" => 44,
"v" => 55,
"w" => 66,
"x" => 77,
"y" => 88,
"z" => 99
}

puts results.min_by {|k, v| v}.inspect
