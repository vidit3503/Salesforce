global class batchWorkbench implements Database.Batchable<sObject> {
global Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator('SELECT Id, Name FROM Account');
}
global void execute(Database.BatchableContext bc , List<Account> scope){
    for (Integer i = 0; i < 200; i++) {
        Account a = new Account();
        a.Name = 'Test'+i;
        scope.add(a);
        i++;
    }
    upsert scope;
}
global void finish(Database.BatchableContext bc){
}
}