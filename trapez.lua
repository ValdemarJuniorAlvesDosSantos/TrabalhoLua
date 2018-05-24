Trapez={}
Trapez.__index = Trapez

function Trapez:novo(tipo,identificador,dono,solo,precoPorMetro,base1,base2,altura)
   local tra = {}             
   setmetatable(tra,Trapez)
   tra.tipo=tipo 
   tra.identificador = identificador
   tra.dono=dono
   tra.solo=solo
   tra.precoPorMetro=precoPorMetro
   tra.base1=base1
   tra.base2=base2
   tra.altura=altura
   return tra
end
function Trapez:imprime()
    print(self:preco())
end
function Trapez:area()
    return ((self.base1+self.base2)*self.altura/2)
end
function Trapez:preco()
    aux = self.precoPorMetro*self:area()
    if self.solo=="A" then 
        return aux*0.9
    end
    if self.solo=="G" then 
        return aux*1.3
    end
    return aux*1.1
end
return Trapez 
 
