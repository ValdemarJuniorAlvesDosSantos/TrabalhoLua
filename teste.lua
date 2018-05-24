Triang=require ("triang")
Trapez=require ("trapez")
Retang=require ("retang")
imoveis={}
linhas={}
for line in io.lines("catalogo.txt") do 
    -- table.insert(linhas, line)
    linhas[#linhas +1] =line
end
i=0
while (i<#linhas) do
    i=i+1
    if (linhas[i]=="triang") then
        imoveis[#imoveis+1]=Triang:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]))
    end
    if (linhas[i]=="retang") then
        imoveis[#imoveis+1]=Retang:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]))
    end
    if (linhas[i]=="trapez") then
        imoveis[#imoveis+1]=Trapez:novo(linhas[i],tonumber(linhas[i+1]), linhas[i+2],linhas[i+3], tonumber(linhas[i+4]),tonumber(linhas[i+5]),tonumber(linhas[i+6]),tonumber(linhas[i+7]))
    end
end    
for v,k in pairs(imoveis) do
     print (k:imprime())
end
