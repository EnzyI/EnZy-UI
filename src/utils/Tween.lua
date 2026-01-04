local TweenService = game:GetService("TweenService")

return function(obj, info, props)
    local tween = TweenService:Create(obj, info, props)
    tween:Play()
    return tween
end
