trigger Task10 on Account (after insert) {
    AccountTriggerHandler.sendforapproval(Trigger.isAfter,Trigger.New );
}