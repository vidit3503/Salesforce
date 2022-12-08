global class BatchTask3 implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Account';        
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope) {
        //declare variable to store Id of the user
        // count variable to count total records are updated
        Integer count = 0;
        Id userId = [select id from user where Name='Wilson'].id;
        for(Account a : scope) {
            a.ownerId=userId;
            count++;
        }
        update scope;

        //send mail to the user
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // mail.setToAddresses(new String[] {a.Email_Address__c});
        mail.setTargetObjectId(userId);
        mail.setSenderDisplayName('Wilson');
        mail.setSubject('Account Owner Changed');
        mail.setPlainTextBody('Hi, Your account owner has been changed to Wilson  ' + count + '  accounts have been updated');
        mail.setSaveAsActivity(false);
        // mail.setSaveAsActivity('false');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }

    global void finish(Database.BatchableContext BC) {
        //Database.executeBatch(new batchDemoconCreate());
    }
}