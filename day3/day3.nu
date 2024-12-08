export def part1 [fileName: string] {
  open $fileName 
  | parse --regex 'mul\((\d+),(\d+)\)' 
  | each {|p| values | into int | math product} | math sum 
}

export def part2 [fileName: string] {
  let parsed = open $fileName 
  | parse --regex r#'(?<permission>don't|do)|mul\((?<a>\d+),(?<b>\d+)\)'#
  #| each {|p| values | into int | math product} | math sum 

  mut sum = 0
  mut do = true
  for p in $parsed {
    if $p.permission == "do" {
      $do = true
    } else if $p.permission == "don't" {
      $do = false
    }
    if $do and $p.a != "" and $p.b != "" {
      print $"($p.permission) ($p.a) ($p.b)"
      $sum += ($p.a | into int) * ($p.b | into int)
    }

  }
  $sum
}

