# -*- coding: utf-8 -*-
def make1d(n) #授業で扱ったmake1d
  a = Array.new(n)
  for i in 0..(n-1)
    a[i] = 0
  end
  a
end
def make2d(height,width)  #授業で扱ったmake2d
  a = Array.new(height)
  for i in 0..(height-1)
    a[i] = make1d(width)
  end
  a
end
def vicsek(n)
      image = make2d(n,n)
      vicsek_main(image,0,0,n) #初期座標0,0を代入してvicsek_mainに投げる
      show(image)
end
def vicsek_main(image,x,y,n)#座標x,yを基準としてそこから大きさnのVicsekフラクタルを描画
  if n == 1#nが1のときはそこの部分を黒で塗りつぶす
    image[x][y]=1
  else#そうでなければ全体を9分割して右上、右下、真ん中、左上、左下の部分をn/3の大きさのvicsekで描画させる
    vicsek_main(image,x,y,n/3)#右上
    vicsek_main(image,x+n/3,y+n/3,n/3)#右下
    vicsek_main(image,x,y+n/3*2,n/3)#真ん中
    vicsek_main(image,x+n/3*2,y,n/3)#左上
    vicsek_main(image,x+n/3*2,y+n/3*2,n/3)#左下
  end
end