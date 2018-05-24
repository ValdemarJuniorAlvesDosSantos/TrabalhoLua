Triang={}
Triang.__index = Triang

function Triang:novo(tipo,identificador,dono,solo,precoPorMetro,base,altura)
   local tri = {}             
   setmetatable(tri,Triang)
   tri.tipo=tipo 
   tri.identificador = identificador
   tri.dono=dono
   tri.solo=solo
   tri.precoPorMetro=precoPorMetro
   tri.base=base
   tri.altura=altura
   return tri
end
function Triang:imprime()
    print(self:preco())
end
function Triang:area()
    return (self.base*self.altura/2)
end
function Triang:preco()
    aux = self.precoPorMetro*self:area()
    if self.solo=="A" then 
        return aux*0.9
    end
    if self.solo=="G" then 
        return aux*1.3
    end
    return aux*1.1
end
return Triang 
