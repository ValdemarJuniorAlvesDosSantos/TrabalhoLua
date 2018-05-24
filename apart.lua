Apart={}
Apart.__index = Apart

function Apart:novo(tipo,identificador,dono,solo,precoPorMetro,lado1,lado2)
   local Ap = {}             
   setmetatable(Ap,Apart)
   Ap.tipo=tipo 
   Ap.identificador = identificador
   Ap.dono=dono
   return Ap
end

return Apart 
 
 
