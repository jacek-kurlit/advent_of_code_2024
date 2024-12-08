export def part1 [fileName: string] {
  open $fileName 
  | lines 
  | split words 
  | each {|e| into int | window 2 | each {|it| $it.1 - $it.0 } | number-of-violations } 
  | where $it == 0
  | length
}

def number-of-violations []: list<int> -> int {
  let row = $in
  print $row
  let sign_check = {|e| $row.0 < 0 and $e > 0 or $row.0 > 0 and $e < 0}
  mut count = 0
  for $e in $row {
    if $e == 0 { 
      #print $"row ($row) contains 0" 
      $count += 1
    } else if $e < -3 or $e > 3 {
      #print $"row ($row) has elem in range ($e)" 
      $count += 1
    } else if (do $sign_check $e) {
      #print $"checking ($e) (do $sign_check $e)" 
      $count += 1
    }
  }
  return $count
}

export def part2 [fileName: string] {
  let count = open $fileName 
  | lines 
  | split words 
  | each {|e| into int | window 2 | each {|it| $it.1 - $it.0 } | number-of-violations } 
  #| where $it <= 1
  #| length

  print $count
  0
}

