Apart={}
Apart.__index = Apart

function Apart:novo(tipo,identificador,dono,nQuartos,nVagas,andar,area,precoPorMetro,lazer,nAndares)
   local Ap = {}
   setmetatable(Ap,Apart)
   Ap.tipo=tipo
   Ap.identificador = identificador
   Ap.dono=dono
   Ap.nQuarto=nQuartos
   Ap.nVagas=nVagas
   Ap.andar=andar
   Ap.area=area
   Ap.precoPorMetro=precoPorMetro
   Ap.lazer=lazer
   Ap.nAndares=nAndares
   return Ap
end
function Apart:preco()
  aux = self.area*self.precoPorMetro*(0.9+self.andar/self.nAndares)
      if (self.lazer=="S") then
        return aux*1.15
      end
      return aux
end
return Apart
