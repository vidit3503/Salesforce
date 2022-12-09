public with sharing class AuraTask1 {

    @AuraEnabled
    public static List<Account> showAccountsForAccordion()
    {
        List<Account> accList = [select Id,Name,Rating,Phone,(select firstname,lastname,Name from contacts) FROM Account Order By name];
        return accList;
    }

    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name =  + searchKey + '%';
        return [SELECT id, name, phone,type FROM Account WHERE name LIKE :name];
    }
}