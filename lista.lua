Lista = {}
Lista.__index = Lista
function Lista:novo()
    local list = {}
    setmetatable(list,Lista)
    return list
end

function Lista:add(item)
    local aux = {}
    setmetatable(aux,Lista)
    aux.item = item
    aux.prox = self
    return aux
end

function Lista:imprime()
    local aux=self
    while not (aux == {}) do
        print (aux)
        print ("\n")
        aux.item:imprime()        
        aux = aux.prox
    end 
end

return Lista    