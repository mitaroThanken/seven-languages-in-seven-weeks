#! /usr/local/bin/io

List myAverage := method(
  if( call target detect(v, v type != Number type) isNil,
    if( call target size > 0,
      (call target sum) / (call target size),
      Exception raise("no members are contained")),
    Exception raise("all members must be Number")
  )
)

