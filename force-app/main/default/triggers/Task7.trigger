trigger Task7 on Opportunity (before update) {

    List<Opportunity> Opp = new List<Opportunity>();
    Opp = [SELECT Id, CloseDate, StageName, Name, Amount, OwnerId FROM Opportunity];

    List<task> AdTask =New List<task>();
        for (Opportunity o : Opp) {
            String oldOpportunityName = Trigger.oldMap.get(Trigger.newMap.keyset().iterator().next()).Name;
            String newOpportunityName = Trigger.newMap.get(Trigger.newMap.keyset().iterator().next()).Name;
            if (oldOpportunityName != newOpportunityName ) {
                task t=new task();
                t.Subject='Call';
                t.Priority = 'Normal';
                t.Status = 'Not Started';
                t.OwnerId=o.OwnerId;
                AdTask.add(t);              
            }
        }
        insert AdTask;
    }
