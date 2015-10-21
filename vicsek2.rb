load("./make2d.rb")
def vicsek(n)
    image=make2d(3**n,3**n)
    vicsek_sub(image,0,0,n)
    image
end
def vicsek_sub(image,h,w,n)
    #n==0の時のvicsekが黒一色と考えればfor文が不要になる以下のコード書き換えて
#    for h in 0..2
#        for w in 0..2

            #if n==1
                #if (h+w)%2==0
                #    image[h][w]=0
                #else
                #    image[h][w]=1
                #end
            if n==0
                image[h][w]=1
            else
                #ここでの問題は指数nが引数なのでn*3ではなく3**(n-1)を使うべき
                #例えば2行目でn=3の時を考えるとほしい座標は(18,18)なのに返る値は(9,9)となってしまう
#                vicsek_sub(image,h,w,n-1)
#                vicsek_sub(image,h+n*3,w+n*3,n-1)
#                vicsek_sub(image,h,w+n*3,n-1)
#                vicsek_sub(image,h+n*3,w,n-1)
#                vicsek_sub(image,h+(n*3)/2,w+(n*3)/2,n-1)
                #正しいコード
                vicsek_sub(image,h,w,n-1)
                vicsek_sub(image,h+2*(3**(n-1)),w+2*(3**(n-1)),n-1)
                vicsek_sub(image,h,w+2*(3**(n-1)),n-1)
                vicsek_sub(image,h+2*(3**(n-1)),w,n-1)
                vicsek_sub(image,h+3**(n-1),w+3**(n-1),n-1)
            end
#       end
#    end
end
