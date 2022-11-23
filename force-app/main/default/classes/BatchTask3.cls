global class BatchTask3 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator([SELECT ID , NAME ,Email_Address__c FROM Account ]);
    }
    global void execute(Database.BatchableContext bc, List<Account> acclist){
        List<Account> accL = new List<Account>();
        EmailTemplate et = [SELECT id FROM EmailTemplate WHERE developername='Accountnamechange'];
        for(Account acc : acclist){
            acc.OwnerId = '0055g00000GF9Rl';
            accL.add(acc);
        }
        update accL;
        Account accountList = new Account();
        if (accountList.Owner.Email != null) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTargetObjectId(accountList.Id);
            mail.setTemplateId(et.Id);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
}