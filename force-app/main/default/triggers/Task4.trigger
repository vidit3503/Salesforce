trigger Task4 on Opportunity (before insert) {
    for (Opportunity opp : Trigger.New) {
        opp.Type = 'New Customer' ;
    }
}