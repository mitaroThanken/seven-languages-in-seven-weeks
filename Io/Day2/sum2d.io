#! /usr/local/bin/io

List sum2d := method( call target map(x, x sum) sum )

# Example

sampleList := list(list(1, 2, 3), list(4))

sampleList sum2d

