trigger AccountTrigger on Account (before insert,after insert,before update,after update,before delete ) {

    if (Trigger.isAfter) {
        AccountTriggerHandler.createContactSameNameAsAccount(Trigger.isAfter , Trigger.New);
        AccountTriggerHandler.sendforapproval(Trigger.isAfter,Trigger.New );
    }

    if(Trigger.isBefore && Trigger.isInsert ){
        AccountTriggerHandler.DeleteOldAccountWithSameName(Trigger.isInsert , Trigger.new);
    }

    if(Trigger.isUpdate && Trigger.isAfter){
        AccountTriggerHandler.Task14(Trigger.isUpdate,Trigger.old);   
    }
}