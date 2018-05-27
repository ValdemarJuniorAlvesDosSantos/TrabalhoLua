Triang=require ("triang")
Trapez=require ("trapez")
Retang=require ("retang")
Casa=require("casa")
Apart=require("apart")
imoveis={}
imoveisCasa={}
imoveisArg={}

espec={}
--COMEÇO DAS FUNÇÔES
--  Função de comparar o preço (questão a)
function comp1(value1, value2)
  if (value1:preco()==value2:preco()) then
    return value1.identificador<value2.identificador
  end
  return value1:preco()<value2:preco()
end
--  Função de comparar a area de terrenos argilosos (questão b)
function comp2(value1, value2)
  if (value1:area()==value2:area()) then
    return value1.identificador>value2.identificador
  end
  return value1:area()>value2:area()
end
--  Função de comparar o numero de quartos das casas ( questão c)
function comp3(value1, value2)
  if (value1.nQuartos==value2.nQuartos) then
    return value1.identificador>value2.identificador
  end
  return value1.nQuartos>value2.nQuartos
end
-- função que inclui um item novo nas listas
function adiciona(linhas,i)
  --adiciona triangulo
  if (linhas[i]=="triang") then
      a=Triang:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]))
      imoveis[#imoveis+1]=a
      --caso seja argiloso adiciona na lista de argiloso
      if (linhas[i+3]=="G") then
        imoveisArg[#imoveisArg+1]=a
      end
  end
  --adiciona retangulo
  if (linhas[i]=="retang") then
      a=Retang:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]))
      imoveis[#imoveis+1]=a
      --caso seja argiloso adiciona na lista de argiloso
      if (linhas[i+3]=="G") then
        imoveisArg[#imoveisArg+1]=a
      end
  end
  --adiciona trapezio
  if (linhas[i]=="trapez") then
      a=Trapez:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]),tonumber(linhas[i+7]))
      imoveis[#imoveis+1]=a
      --caso seja argiloso adiciona na lista de argiloso
      if (linhas[i+3]=="G") then
        imoveisArg[#imoveisArg+1]=a
      end
  end
  --adiciona casa
  if (linhas[i]=="casa") then
      a=Casa:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],tonumber(linhas[i+3]),tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]),tonumber(linhas[i+7]),tonumber(linhas[i+8]),tonumber(linhas[i+9]))
      imoveis[#imoveis+1]=a
      --caso tenha as especificações de preco e area do espec ela é adicionada na lista de casas
      if (a:preco() < espec[4] and (a.nPavi*a.areaPavi) > espec[3]) then
        imoveisCasa[#imoveisCasa+1]=a
      end
  end
  -- adiciona apartamento
  if (linhas[i]=="apto") then
      imoveis[#imoveis+1]=Apart:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],tonumber(linhas[i+3]),tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]),tonumber(linhas[i+7]),linhas[i+8],tonumber(linhas[i+9]))
  end
end
--  Função que retira um item das listas
function retira(iden)
  --procura para retirar da lista de imoveis
  for k,v in pairs(imoveis) do
      if v.identificador==iden then
        table.remove(imoveis,k)
      end
  end
  --procura para retirar da lista de imoveis argilosos
  for k,v in pairs(imoveisArg) do
      if v.identificador==iden then
        table.remove(imoveisArg,k)
      end
  end
  --procura para retirar da lista
  for k,v in pairs(imoveisCasa) do
      if v.identificador==iden then
        table.remove(imoveisCasa,k)
      end
  end
end

--FIM DAS FUNÇÔES

-----------------------------------------
--  leitura do espec.txt
local linhas={}
for line in io.lines("espec.txt") do
    espec[#espec +1] =tonumber(line) -- cada linha do espec.txt é guardada como um numero
end
-- leitura do catalogo.txt
for line in io.lines("catalogo.txt") do
    linhas[#linhas +1] = line--guarda em um vetor das linhas
end

local i=0
-- para cada linha é chamada a função de adicionar (que verifica se a linha se trata de algo inserivél( por exemplo: triang,apto))
while (i<#linhas) do
    i=i+1
    adiciona(linhas,i)
end

linhas={} --zera o tabela de linhas para reutiliza-lo para ler atual.txt
--leitura do atual .txt
for line in io.lines("atual.txt") do
    linhas[#linhas +1] =line
end
i=0
--para cada linha ve se é possivel aplicar o tratamento das 3 operações (inclusao, alteração, exclusão)
while (i<#linhas) do
    i=i+1
    --trata o caso da inclusao
    if (linhas[i]=="i") then
      adiciona(linhas,i+1)--adiciona o novo item
    end
    --trata o caso da alteração
    if (linhas[i]=="a") then
      retira(tonumber(linhas[i+2]))--exclui o velho
      adiciona(linhas,i+1)--adiciona o novo imovel
    end
    --trata o caso da exclusão
    if (linhas[i]=="e") then
      retira(tonumber(linhas[i+1]))--exclui o item do identificador
    end
end

--- EU PAREI AQUI----
x=comp1
table.sort(imoveis,  comp1)
x=function(value1,value2) return value1:area()>value2:area() end
table.sort(imoveisArg,comp2)
local listaA={}
local listaB={}
local tamA= espec[1]*#imoveis/100
local tamB= espec[2]*#imoveisArg/100
i=math.floor(tamA)
for j=1,i do
  listaA[j]=imoveis[j+#imoveis-i]
end
i=math.floor(tamB)
for j=1,i do
  listaB[j]=imoveisArg[#imoveisArg-i+j]
end
imprime= ""
if (#listaA>0) then
   for v,k in pairs(listaA) do
     if (v~=#listaA) then
       imprime = (imprime..tostring(k.identificador)..", ")
     end
   end
  imprime=(imprime..tostring(listaA[#listaA].identificador))
end
saida=assert(io.open("saida.txt","w"),"nao pode criar o arquivo")
saida:write(imprime.."\n")

imprime= ""
if (#listaB>0) then
   for v,k in pairs(listaB) do
     if (v~=#listaB) then
       imprime = (imprime..tostring(k.identificador)..", ")
     end
   end
  imprime=(imprime..tostring(listaB[#listaB].identificador))
end
saida:write(imprime.."\n")


table.sort(imoveisCasa,comp3)
imprime= ""
if (#imoveisCasa>0) then
   for v,k in pairs(imoveisCasa) do
     if (v ~= #imoveisCasa) then
       imprime = (imprime..tostring(k.identificador)..", ")
     end
   end
  imprime=(imprime..tostring(imoveisCasa[#imoveisCasa].identificador))
end
saida:write(imprime.."\n")
io.close(saida)
result=0
if (#listaA >= espec[5]and espec[5] ~= 0)then
  result=result+listaA[espec[5]].identificador
end
if (#listaB >= espec[6]and espec[6] ~= 0)then
  result=result+listaB[espec[6]].identificador
end
if (#imoveisCasa >= espec[7] and espec[7] ~= 0)then
  result=result+imoveisCasa[espec[7]].identificador
end
resu=assert(io.open("result.txt","w"),"nao pode criar o arquivo")
  resu:write(tostring(result))
io.close(resu)
