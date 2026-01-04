return function(class, props)
    local inst = Instance.new(class)
    for k,v in pairs(props) do
        inst[k] = v
    end
    return inst
end
