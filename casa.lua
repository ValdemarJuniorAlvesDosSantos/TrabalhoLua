Casa={}
Casa.__index = Casa

function Casa:novo(tipo,identificador,dono,nQuartos,nVagas,nPavi,areaPavi,precoMetro,areaLivre,areaLivrePreco)
   local casa = {}
   setmetatable(casa,Casa)
   casa.tipo=tipo
   casa.identificador = identificador
   casa.dono=dono
   casa.nQuartos=nQuartos
   casa.nVagas=nVagas
   casa.nPavi=nPavi
   casa.areaPavi=areaPavi
   casa.precoMetro=precoMetro
   casa.areaLivre=areaLivre
   casa.areaLivrePreco=areaLivrePreco
   return casa
end
function Casa:preco()
    return self.nPavi*self.areaPavi*self.precoMetro + self.areaLivre*self.areaLivrePreco
end
return Casa
