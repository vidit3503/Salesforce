global class batchWorkbench implements Database.Batchable<sObject> {
global Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator('SELECT Id, Name FROM Account');
}
global void execute(Database.BatchableContext bc , List<Account> scope ){
    try {
        for (Integer i = 0 ; i < 2000 ; i++){
            Account a = new Account();
            a.Name = 'Test'+i;
            scope.add(a);
        }        
        upsert scope;
    } catch (Exception e ) {
        // pass the exception to HandleCustomException class
        HandleCustomException.LogException(e);
        system.debug('Exception: ' + e);
    }
}
global void finish(Database.BatchableContext bc){
}
}

// Execution Snippet
// batchWorkbench b = new batchWorkbench(); 
// Database.executeBatch(b);