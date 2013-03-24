#! /usr/local/bin/io

// 二次元リスト

TwoDimList := List clone

// 領域割り当て

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

// 値設定

TwoDimList set := method(x, y, value,
  line := call target at(x);
  line append(value);
  line swapIndices(y, line size - 1);
  line pop;
  call target
)

// 値取得

TwoDimList get := method(x, y,
  call target at(x) at(y)
)

// 転置

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

// ファイルへの書き出し
// ToDo 例外処理

TwoDimList writeToFile := method( aPath,
  file := File with( aPath )
  if ( file exists, file remove )
  file openForUpdating
  call target foreach( x,
    x foreach( y,
      file write(y asString, " ")
    )
    file setPosition( (file position) -1 )
    file write("\n")
  )
  file close
)

// ファイルからの読み込み
// ToDo 例外処理・フォーマット不正の検出

TwoDimList readFromFile := method( aPath,
  readList := TwoDimList clone
  file := File with( aPath ) openForReading
  while( (line := file readLine) != nil,
    readList append( line split map(value, value asNumber) )
  )
  file close
  readList
)

// サンプル

x := 3
y := 2

twoDimList := TwoDimList clone
twoDimList dim(x, y)
for( i, 0, x -1, 
  for( j, 0, y -1,
    twoDimList set( i, j, i *10 + j )
  )
)

