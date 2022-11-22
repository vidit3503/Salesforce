Trigger Task1 on Contact (before insert ,before update , after delete ,after insert , after update ,  before delete ) {
    
    
    if(Trigger.isBefore){ 
        system.debug('Before Trigger');
        if(Trigger.isUpdate){
            System.debug('Size' + Trigger.new.size() );
            system.debug('Trigger isUpdate Completed');   
        }
        else if(Trigger.isInsert){
            system.debug('Trigger isInsert');
        }
        else if(Trigger.isDelete){
            system.debug('Trigger isDelete');
        }

        system.debug('Trigger New ' + Trigger.new);
        system.debug('Trigger Old ' + Trigger.old);
        system.debug('Trigger NewMap ' + Trigger.newMap);
        system.debug('Trigger OldMap ' + Trigger.oldMap);
    }  

    if(Trigger.isAfter){
        system.debug('After Trigger');
            if(Trigger.isUpdate){
                system.debug('Trigger isUpdate Completed After ');   
            }
            else if(Trigger.isInsert){
                system.debug('Trigger isInsert After ');
            }
            else if(Trigger.isDelete){
                system.debug('Trigger isDelete After ');
            }
            else if (Trigger.isUndelete){
                system.debug('Trigger isUndelete After ');
            }
                
            system.debug('Trigger New ' + Trigger.new);
            system.debug('Trigger Old ' + Trigger.old);
            system.debug('Trigger NewMap ' + Trigger.newMap);
            system.debug('Trigger OldMap ' + Trigger.oldMap);
    }  
}
