trigger AccountTrigger on Account (before insert,before update,before delete ,after insert,after update ) {

    if((Trigger.isAfter == true)  && (Trigger.isUpdate == true) ) {
        AccountTriggerHandler.Task6_Handler(Trigger.new , Trigger.old);
    }

    if (Trigger.isAfter && Trigger.isInsert && Trigger.isUpdate == false) {
        // AccountTriggerHandler.sendforapproval(Trigger.isInsert,Trigger.New );
        //  AccountTriggerHandler.createContactSameNameAsAccount(Trigger.isInsert , Trigger.New);
    }
    
    // if(Trigger.isBefore && Trigger.isInsert ){
    //     AccountTriggerHandler.DeleteOldAccountWithSameName(Trigger.isInsert , Trigger.new);
    // }

    // if(Trigger.isUpdate && Trigger.isAfter){
    //     AccountTriggerHandler.Task14(Trigger.isUpdate,Trigger.old); 
    // }
}