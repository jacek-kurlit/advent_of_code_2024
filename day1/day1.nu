export def part1 [fileName: string] {
  let left = open $fileName | lines | split column "   " left right | get left | into int | sort
  let right = open $fileName | lines | split column "   " left right | get right | into int | sort
  $left | enumerate | each {|elm| $elm.item - ($right | get $elm.index) } | math abs | math sum
}

export def part2 [fileName: string] {
  let left = open $fileName | lines | split column "   " left right | get left | into int
  let right = open $fileName | lines | split column "   " left right | get right | into int
  $left | enumerate | each {|elm| $elm.item * ($right | where $it == $elm.item | length) } | math sum
}

