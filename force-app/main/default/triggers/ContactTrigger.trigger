trigger ContactTrigger on Contact (after insert,before insert,before update , before delete , after update , after delete , after undelete) {

    
    if(Trigger.isBefore && Trigger.isInsert) {
        ContactTriggerHandler.addPass(Trigger.new);
        
    }
        // if(Trigger.isAfter){
    // ContactTriggerHandler.createEventTrigger( Trigger.isInsert , Trigger.new);
    // }  

    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) ) {
        ContactTriggerHandler.RollUpSummary(Trigger.new);
    }

    if(Trigger.isAfter && Trigger.isDelete) {
        ContactTriggerHandler.onAfterDelete(Trigger.old);
    }

    // if(Trigger.isUpdate && Trigger.isAfter) {
    //     ContactTriggerHandler.TheSheepPeoblem(Trigger.new , Trigger.old );
    // }

    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)) {
        ContactTriggerHandler.TheGreatProblem(Trigger.new);
    }
}   