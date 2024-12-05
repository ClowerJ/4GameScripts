#Persistent
#NoEnv
#SingleInstance, Force

#Include, MemoryController.ahk
#Include, PlayerCharacter.ahk

SetTimer, UpdateGameState, 1000  ; Main timer
Return

; Main function to update game state
UpdateGameState:
    Try {
        GetPlayerData()  ; Fetch player data once per cycle
        UpdatePlayerActions()  ; Call PlayerCharacter logic
        Log("Game state updated successfully.")
    } Catch e {
        Log("Error in UpdateGameState: " e.Message)
    }
Return

OnExit("CleanUp")

CleanUp(ExitReason, ExitCode) {
    Log("MainControl script exiting: " ExitReason)
    ExitApp
}
