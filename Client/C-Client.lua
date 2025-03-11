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
    
    -- Get tutorial data based on current ID
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
        
        Citizen.Wait(1000) -- Wait for fade out to complete
        
        -- Move camera to the tutorial location
        local coords = tutorialData.coords
        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        
        -- Set camera position and rotation using the enhanced config parameters
        SetCamCoord(cam, coords.camX, coords.camY, coords.camZ)
        SetCamRot(cam, coords.camRotX or 0.0, coords.camRotY or 0.0, coords.camRotZ or 0.0, 2)
        
        if coords.pointAt then
            -- If pointAt coordinates are specified, point the camera at them
            PointCamAtCoord(cam, coords.pointAt.x, coords.pointAt.y, coords.pointAt.z)
        end
        
        -- Set camera FOV if specified
        if coords.camFov then
            SetCamFov(cam, coords.camFov)
        end
        
        SetCamActive(cam, true)
        RenderScriptCams(true, true, coords.transitionTime or 500, true, true)
        
        -- Fade back in after camera is set
        DoScreenFadeIn(1000)
    else
        -- Destroy camera when hiding tutorial
        -- DestroyAllCams()
    end
    
    SetEntityInvincible(PlayerPedId(), true)
    FreezeEntityPosition(PlayerPedId(), true)

    -- Send NUI message to toggle visibility
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
        -- If no more tutorials, execute hide command
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
    
    -- Get next tutorial data
    local tutorialData = nil
    for _, tutorial in ipairs(Config.Tutorials) do
        if tutorial.id == CurrentTutorial then
            tutorialData = tutorial
            break
        end
    end
    
    if tutorialData then
        -- Start fade out before camera transition
        DoScreenFadeOut(1000)
        
        Citizen.Wait(1000) -- Wait for fade out to complete
        
        -- Move camera to the tutorial location
        local coords = tutorialData.coords
        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        
        -- Set camera position and rotation using the enhanced config parameters
        SetCamCoord(cam, coords.camX, coords.camY, coords.camZ)
        SetCamRot(cam, coords.camRotX or 0.0, coords.camRotY or 0.0, coords.camRotZ or 0.0, 2)
        
        if coords.pointAt then
            -- If pointAt coordinates are specified, point the camera at them
            SetEntityCoords(PlayerPedId(), coords.camX, coords.camY, coords.camZ-5.0)
            PointCamAtCoord(cam, coords.pointAt.x, coords.pointAt.y, coords.pointAt.z)
        end
        
        -- Set camera FOV if specified
        if coords.camFov then
            SetCamFov(cam, coords.camFov)
        end
        
        SetCamActive(cam, true)
        RenderScriptCams(true, true, coords.transitionTime or 500, true, true)
        
        -- Update UI with tutorial info
        SendNUIMessage({
            action = 'updateTutorial',
            name = tutorialData.name,
            desc = tutorialData.desc
        })
        
        -- Fade back in after camera is set
        DoScreenFadeIn(1000)
    end
    
    cb('ok')
end)