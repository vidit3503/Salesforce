trigger Task3 on Opportunity (before insert , before update){
    if (Trigger.isUpdate) {
        for(Opportunity obj : Trigger.new){
             obj.StageName = 'Prospecting';
             obj.CloseDate = Date.Today().addDays(15);
        }
    }
}