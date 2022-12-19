public with sharing class DragAndDrop {

    @AuraEnabled
    public static ContactWrapper getContacts(String searchKey1, String searchKey2) {
        List<Contact> contacts = [SELECT Id, Name, Title, Phone, Email, AccountId ,Account.Name FROM Contact];
        List<Contact> contactsAccount1 = new List<Contact>();
        List<Contact> contactsAccount2 = new List<Contact>();
        if(contacts != null && contacts.size() > 0) {
            for(Contact c : contacts) {
                System.debug('contact: ' + c);
                if(c.Account.Name != null) {
                    if(c.Account.Name == searchKey1) {
                        contactsAccount1.add(c);
                        // get account id from searchkey1
                        c.AccountId = [SELECT Id FROM Account WHERE Name = :searchKey1].Id;
                        System.debug('account id: ' + c.AccountId);

                    } else if(c.Account.Name == searchKey2) {
                        contactsAccount2.add(c);
                        // get account id from searchkey2
                        c.AccountId = [SELECT Id FROM Account WHERE Name = :searchKey2].Id;
                        System.debug('account id: ' + c.AccountId);
                    }
                }
            }
            ContactWrapper cw = new ContactWrapper();
            cw.contactsAccount1 = contactsAccount1;
            cw.contactsAccount2 = contactsAccount2;
            return cw;
        }
        return null;
    }

    public class ContactWrapper {
        @AuraEnabled
        public List<Contact> contactsAccount1;
        @AuraEnabled
        public List<Contact> contactsAccount2;
    }

    // updatecontact
    @AuraEnabled
    public static void updateContact(String contactId, String accountId) {
        Contact c = [SELECT Id, Name, Title, Phone, Email, AccountId, Account.Name FROM Contact WHERE Id = :contactId];
        System.debug('contact: ' + c);
        System.debug('accountId: ' + accountId);
        c.AccountId = [SELECT Id FROM Account WHERE Name = :accountId].Id;
        update c;
        System.debug('contact account name after : ' + c.Account.Name);
    }  
}
