Retang={}
Retang.__index = Retang
--"classe" Retangulo
-- construtor da classe
function Retang:novo(tipo,identificador,dono,solo,precoPorMetro,lado1,lado2)
   local Ret = {}
   setmetatable(Ret,Retang)
   Ret.tipo=tipo
   Ret.identificador = identificador
   Ret.dono=dono
   Ret.solo=solo
   Ret.precoPorMetro=precoPorMetro
   Ret.lado1=lado1
   Ret.lado2=lado2
   return Ret
end
--função que calcula area do retangulo
function Retang:area()
    return (self.lado1*self.lado2)
end
--função que calcula o preço do retangulo
function Retang:preco()
    aux = self.precoPorMetro*self:area()
    if self.solo=="A" then
        return aux*0.9
    end
    if self.solo=="G" then
        return aux*1.3
    end
    return aux*1.1
end
return Retang
