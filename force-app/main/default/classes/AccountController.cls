public with sharing class AccountController{
    @AuraEnabled
    public static List<Account> getAccount()
    {
        return [SELECT id, Name ,phone, (SELECT Id , Name , Email , Phone FROM Contacts) FROM Account ORDER BY name];
    }

    @AuraEnabled
    public static List<Account> getByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT id, Name ,phone, (SELECT Id , Name , Email , Phone FROM Contacts) FROM Account WHERE name LIKE :name ORDER BY name];
    }
}