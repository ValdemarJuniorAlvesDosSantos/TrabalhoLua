x=require ("triang")
imoveis={}
i=0
y=x:novo("triang",120,"joao","G",10,10,2)
z=x:novo("triang",120,"joao","G",10,15,2)
w=x:novo("triang",120,"joao","G",10,5,2)
imoveis[1]=y
imoveis[2]=z
imoveis[3]=w
for j,v in ipairs(imoveis) do v:imprime() end

for line in io.lines("catalogo.txt") do 
    print (line)
end