#[1] "rlist"     "gtools"    "seoR"      "devtools" 
#[5] "usethis"   "stats"     "graphics"  "grDevices"
#[9] "utils"     "datasets"  "methods"   "base" 

x = "zoho"
p=c()
m=c()

for (i in 1:26){
  y = paste(x,intToUtf8(96+i),sep = " ")
  p[i]=(googleSuggest(y))
}
p[[2]]
for(i in 1:26){
  print(p[[i]]) 
  write.table( data.frame(p[[i]]), 'test.csv'  , append= T, sep=',' )
}





