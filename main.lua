Triang=require ("triang")
Trapez=require ("trapez")
Retang=require ("retang")
Casa=require("casa")
Apart=require("apart")
imoveis={}
linhas={}
function adiciona(linhas,i)
  if (linhas[i]=="triang") then
      imoveis[#imoveis+1]=Triang:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]))
  end
  if (linhas[i]=="retang") then
      imoveis[#imoveis+1]=Retang:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]))
  end
  if (linhas[i]=="trapez") then
      imoveis[#imoveis+1]=Trapez:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]),tonumber(linhas[i+7]))
  end
  if (linhas[i]=="casa") then
      imoveis[#imoveis+1]=Casa:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],tonumber(linhas[i+3]),tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]),tonumber(linhas[i+7]),tonumber(linhas[i+8]),tonumber(linhas[i+9]))
  end
  if (linhas[i]=="apto") then
      imoveis[#imoveis+1]=Apart:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],tonumber(linhas[i+3]),tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]),tonumber(linhas[i+7]),linhas[i+8],tonumber(linhas[i+9]))
  end
end

function retira(iden)
  for k,v in pairs(imoveis) do
      if v.identificador==iden then

        table.remove(imoveis,k)

      end
  end
end
espec={}
for line in io.lines("espec.txt") do
    -- table.insert(linhas, line)
    espec[#espec +1] =tonumber(line)
end

for line in io.lines("catalogo.txt") do
    -- table.insert(linhas, line)
    linhas[#linhas +1] =line
end
local i=0
while (i<#linhas) do
    i=i+1
    adiciona(linhas,i)
end
linhas={}

for line in io.lines("atual.txt") do
    -- table.insert(linhas, line)
    linhas[#linhas +1] =line
end
i=0
while (i<#linhas) do
    i=i+1
    if (linhas[i]=="i") then
      adiciona(linhas,i+1)
    end
    if (linhas[i]=="a") then
      retira(tonumber(linhas[i+2]))
      adiciona(linhas,i+1)
    end
    if (linhas[i]=="e") then
      retira(tonumber(linhas[i+1]))
    end
end
--retira(93391)
x=function(value1, value2) return value1:preco()<value2:preco() end
table.sort(imoveis,  x)
local listaA={}
local tamA= espec[1]*#imoveis/100
print(#imoveis)
print(tamA)
i=math.floor(tamA)
for j=1,i do
  listaA[j]=imoveis[j+#imoveis-i]
end


imprime= ""
 for v,k in pairs(listaA) do
   print (k.identificador)
     imprime = (imprime.." ,"..tostring(k.identificador))
 end
print (imprime)
