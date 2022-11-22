trigger Task6 on Account (before insert, after update ) {

    // send mail to contacts when account is updated
    if (Trigger.isUpdate) {
        List<Contact> contacts = [SELECT Id, Email, FirstName, LastName, AccountId, Account.Name FROM Contact WHERE AccountId IN :Trigger.newMap.keySet()];
        EmailTemplate et = [SELECT id FROM EmailTemplate WHERE developername='Accountnamechange'];
        for (Contact contact : contacts) {
            if (contact.Email != null) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(contact.Id);
                mail.setTemplateId(et.Id);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
        }
    } 
}