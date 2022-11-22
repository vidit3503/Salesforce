trigger Task7_1 on Account (before update) {

    List<Account> Opp = new List<Account>();
    Opp = [SELECT Id, Name, OwnerId FROM Account];

    List<task> AdTask =New List<task>();
        for (Account o : Opp) {
            String oldAccountName = Trigger.oldMap.get(Trigger.newMap.keyset().iterator().next()).Name;
            String newAccountName = Trigger.newMap.get(Trigger.newMap.keyset().iterator().next()).Name;
            if (oldAccountName != newAccountName ) {
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
