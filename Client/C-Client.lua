local CurrentTutorial = 1
local initialCoords = nil

RegisterCommand('showT', function()
    StartTutorial()
end)

RegisterCommand('hideT', function()
    ToggleTutorial(false)
    SetNuiFocus(false, false)
end)

function StartTutorial()
    initialCoords = GetEntityCoords(PlayerPedId())
    print(initialCoords.x, initialCoords.y, initialCoords.z)
    ToggleTutorial(true)
end
exports('StartTutorial', StartTutorial)
-- exports['L-Tutorial']:StartTutorial()

function ToggleTutorial(visible)
    SetNuiFocus(true, true)
    
    local tutorialData = nil
    for _, tutorial in ipairs(Config.Tutorials) do
        if tutorial.id == CurrentTutorial then
            tutorialData = tutorial
            break
        end
    end
    
    local tutorialName = tutorialData and tutorialData.name or ""
    local tutorialDesc = tutorialData and tutorialData.desc or ""
    
    if tutorialData and visible then
        DoScreenFadeOut(1000)
        
        Citizen.Wait(1000)
        
        local coords = tutorialData.coords
        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

        SetCamCoord(cam, coords.camX, coords.camY, coords.camZ)
        SetCamRot(cam, coords.camRotX or 0.0, coords.camRotY or 0.0, coords.camRotZ or 0.0, 2)
        
        if coords.pointAt then
            PointCamAtCoord(cam, coords.pointAt.x, coords.pointAt.y, coords.pointAt.z)
        end
        
        if coords.camFov then
            SetCamFov(cam, coords.camFov)
        end
        
        SetCamActive(cam, true)
        RenderScriptCams(true, true, coords.transitionTime or 500, true, true)
        
        DoScreenFadeIn(1000)
    else
        -- DestroyAllCams()
    end
    
    SetEntityInvincible(PlayerPedId(), true)
    FreezeEntityPosition(PlayerPedId(), true)

    -- TOGGLE UI
    SendNUIMessage({
        action = 'toggle',
        visible = visible,
        name = tutorialName,
        desc = tutorialDesc
    })

    CurrentTutorial = visible and CurrentTutorial or 0
end

RegisterNUICallback('NextTutorial', function(data, cb)
    -- Check if there's a next tutorial
    local hasNextTutorial = false
    for _, tutorial in ipairs(Config.Tutorials) do
        if tutorial.id == CurrentTutorial + 1 then
            hasNextTutorial = true
            break
        end
    end
    
    if not hasNextTutorial then
        -- NO MORE TUTORIALS
        ExecuteCommand('hideT')
        CurrentTutorial = 1
        SetEntityCoords(PlayerPedId(), initialCoords.x, initialCoords.y, initialCoords.z)
        Wait(1000)
        RenderScriptCams(false, true, 1000, true, true)
        SetEntityInvincible(PlayerPedId(), false)
        FreezeEntityPosition(PlayerPedId(), false)
        DestroyAllCams(true)
        cb('ok')
        return
    end
    
    CurrentTutorial = CurrentTutorial + 1
    
    local tutorialData = nil
    for _, tutorial in ipairs(Config.Tutorials) do
        if tutorial.id == CurrentTutorial then
            tutorialData = tutorial
            break
        end
    end
    
    if tutorialData then
        DoScreenFadeOut(1000)
        
        Citizen.Wait(1000) 
        
        local coords = tutorialData.coords
        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        
        SetCamCoord(cam, coords.camX, coords.camY, coords.camZ)
        SetCamRot(cam, coords.camRotX or 0.0, coords.camRotY or 0.0, coords.camRotZ or 0.0, 2)
        
        if coords.pointAt then
            SetEntityCoords(PlayerPedId(), coords.camX, coords.camY, coords.camZ-5.0)
            PointCamAtCoord(cam, coords.pointAt.x, coords.pointAt.y, coords.pointAt.z)
        end
        
        if coords.camFov then
            SetCamFov(cam, coords.camFov)
        end
        
        SetCamActive(cam, true)
        RenderScriptCams(true, true, coords.transitionTime or 500, true, true)

        SendNUIMessage({
            action = 'updateTutorial',
            name = tutorialData.name,
            desc = tutorialData.desc
        })
        
        DoScreenFadeIn(1000)
    end
    
    cb('ok')
end)