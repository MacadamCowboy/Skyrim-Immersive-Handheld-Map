Scriptname IHM_PlayerTracker extends Quest

; Skyrim Immersive Handheld Map - prototype 0.1
; Attach to a Start Game Enabled quest in Creation Kit.
; This script does NOT yet render a marker on a handheld map.

Float Property UpdateInterval = 2.0 Auto
Bool Property ShowDebugNotifications = False Auto

Float Property PlayerX Auto Hidden
Float Property PlayerY Auto Hidden
Float Property PlayerHeading Auto Hidden
Bool Property PlayerIsIndoors Auto Hidden

Event OnInit()
    Debug.Trace("[IHM] Player tracker initialized")
    RegisterForSingleUpdate(UpdateInterval)
EndEvent

Event OnUpdate()
    Actor playerRef = Game.GetPlayer()

    If playerRef != None
        PlayerX = playerRef.GetPositionX()
        PlayerY = playerRef.GetPositionY()
        PlayerHeading = playerRef.GetAngleZ()
        PlayerIsIndoors = playerRef.IsInInterior()

        Debug.Trace("[IHM] X=" + PlayerX + " Y=" + PlayerY + " Heading=" + PlayerHeading + " Indoors=" + PlayerIsIndoors)

        If ShowDebugNotifications
            Debug.Notification("IHM: X=" + (PlayerX as Int) + " Y=" + (PlayerY as Int))
        EndIf
    EndIf

    RegisterForSingleUpdate(UpdateInterval)
EndEvent
