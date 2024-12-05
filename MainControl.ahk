#Persistent
#NoEnv
#SingleInstance, Force

#Include, MemoryController.ahk  ; Includes the memory handling logic
#Include, PlayerCharacter.ahk   ; Includes character and spell handling logic

SetTimer, UpdateGameState, 1000  ; Main timer to refresh every second
Return

; Main function to update the game state periodically
UpdateGameState:
    Try {
        GetPlayerData()           ; Fetch updated player data each cycle
        UpdatePlayerActions()     ; Call logic to process player actions
        Log("Game state updated successfully.")  ; Log success message
    } Catch e {
        Log("Error in UpdateGameState: " e.Message)  ; Log any errors encountered
    }
Return

; Handle script cleanup on exit
OnExit("CleanUp")

CleanUp(ExitReason, ExitCode) {
    Log("MainControl script exiting: " ExitReason)  ; Log exit reason
    ExitApp
}

; Simple logging function to track events and errors
Log(message) {
    FileAppend, % "[" A_Now "] " message "`n", *maincontrol_log.txt  ; Append message to a log file
}
