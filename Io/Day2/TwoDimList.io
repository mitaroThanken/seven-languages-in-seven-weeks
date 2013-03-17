#! /usr/local/bin/io

TwoDimList := List clone

TwoDimList dim := method(x, y, 
  i := 0;
  while(i < x,
    line := List clone;
    j := 0;
    while(j < y,
      line append(0);
      j = j + 1
    );
    call target append(line);
    i = i + 1
  );
  call target
)

TwoDimList set := method(x, y, value,
  line := call target at(x);
  line append(value);
  line swapIndices(y, line size - 1);
  line pop;
  call target
)

TwoDimList get := method(x, y,
  call target at(x) at(y)
)

TwoDimList transpose := method(
  newYsize := call target size;
  newXsize := call target at(0) size;
  transposedMatrix := TwoDimList clone;
  transposedMatrix dim(newXsize, newYsize);
  for(i, 0, newXsize - 1,
    for(j, 0, newYsize - 1,
      transposedMatrix set(i, j, call target get(j, i))
    )
  )
  transposedMatrix
)

