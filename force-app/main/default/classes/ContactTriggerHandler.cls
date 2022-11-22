public with sharing class ContactTriggerHandler {
    public static void createEventTrigger(Boolean isInsert, List<Contact> ConList) {
        for(Contact con : ConList) {
            Event event = new Event();
            event.WhoId = con.Id;
            event.subject = 'Call';
            event.StartDateTime = System.now();
            event.EndDateTime = System.now().addDays(10);
            event.OwnerId = con.OwnerId;
            insert event;
       }
    }  
    public static void addPass(List<Contact> Conlist) {
        for (Contact C : Conlist) {
            if(C.password__c == null) {
                C.password__c ='Password@123!';
            }    
        }
    }

    public static void RollUpSummary(List<Contact> Conlist) {
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, (SELECT Id, Amount__c FROM Contacts) FROM Account]);
        for (Contact C : Conlist) {
            if(c.AccountId != null) {  
                Account A = accountMap.get(C.AccountId);
                Decimal totalAmount = 0;
                for (Contact con : A.Contacts) {
                    System.debug(con.Amount__c);
                    if(con.Amount__c !=null) {
                        totalAmount = totalAmount + con.Amount__c;
                    }
                }
                A.Total_Amount_Contact__c = totalAmount;
            }
        }
        update accountMap.values();
    }

    public static void onAfterDelete(List<Contact> ConList){
        // subtract amount value from account
        for (Contact c : ConList) {
            if(c.Amount__c != null) {
                Account a = [SELECT Id, Total_Amount_Contact__c FROM Account WHERE Id = :c.AccountId];
                a.Total_Amount_Contact__c = a.Total_Amount_Contact__c - c.Amount__c;
                update a;
            }
        }
    }

    public static void TheSheepPeoblem(List<Contact> ConList , List<Contact> OldList){
        Id oldAccountId;
        Id newAccountId;
        for (Contact Cold : OldList) {
            if(Cold.AccountId != null ){
                oldAccountId = Cold.AccountId;
            }
        }
        for(Contact c : ConList){
            if(c.AccountId != null){
                newAccountId = c.AccountId;
            } 
        }

        List<Contact> Cont = [SELECT Id , Name FROM Contact WHERE AccountId = : oldAccountId];
        System.debug('Cont' + Cont);
        System.debug('OldAccId' + oldAccountId);
        System.debug('NewAccId' + newAccountId);
        if(oldAccountId != newAccountId) {
            for(Contact c : Cont) {
                c.AccountId = newAccountId;
                update c;
            }
        }
    }
    
    public static void TheGreatProblem(List<Contact> ConList){
        Decimal MaxAmmount ;
        Decimal RemAmount ;
        Set<Id> accountIds = new Set<Id>();
        List<Contact> contACTList = new List<Contact>();
        Integer i = 0;
        for (Contact c : ConList) {
            if(c.AccountId != null) {
                accountIds.add(c.AccountId);
                System.debug('accountIds' + accountIds);
            }
        }
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, MaxAmmount__c FROM Account WHERE Id IN :accountIds]);
        for (Contact c : ConList) {
            if(c.AccountId!=null){
                MaxAmmount = accountMap.get(c.AccountId).MaxAmmount__c;
                System.debug('MaxAmmount' + MaxAmmount);
                if(c.Amount_Great_Problem__c > MaxAmmount) { 
                    c.LastName = 'GreatProblem';
                    RemAmount = c.Amount_Great_Problem__c;
                    System.debug('RemAmount' + RemAmount);
                    RemAmount = c.Amount_Great_Problem__c - MaxAmmount;
                    
                    while (RemAmount > 0) {
                        Contact con = new Contact();
                        RemAmount = RemAmount - MaxAmmount;
                        con.LastName = 'GreatProblemContact' + i;
                        i++;
                        con.AccountId = c.AccountId;
                        if(RemAmount > MaxAmmount) {
                            con.Amount_Great_Problem__c = MaxAmmount;
                        }
                        else {
                            con.Amount_Great_Problem__c = RemAmount;
                        }
                        contACTList.add(con);
                    }
                    c.Amount_Great_Problem__c = MaxAmmount;
                }                   
            }
        }
        insert contACTList;
    }
}