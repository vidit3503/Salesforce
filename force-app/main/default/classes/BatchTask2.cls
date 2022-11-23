global class BatchTask2 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator([SELECT ID , NAME FROM ACCOUNT]) ;
    }
    global void execute(Database.BatchableContext bc, List<Account> acclist){

        List<Opportunity> OOppsList = new List<Opportunity>();
        for (Account acc : acclist) {
            Opportunity Oops = new Opportunity();
            Oops.Name = 'Opp'+ acc.Name; 
            Oops.StageName = 'Processing';
            Oops.CloseDate = date.today().addDays(15);
            Oops.AccountId = acc.Id ;
            System.debug(Oops);
            OOppsList.add(Oops);
        }
        if(OOppsList.size()>0) {
            insert OOppsList;
        }
    }    
    global void finish(Database.BatchableContext bc){
    }    
}