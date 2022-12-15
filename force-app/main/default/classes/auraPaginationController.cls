public class auraPaginationController {
    @AuraEnabled
      public static List <Account> getAccountData(){
        List<Account> accountList = new  List<Account>(); 
        accountList=[SELECT Id, Name,Owner.Name,(select firstname,lastname,Name from contacts) FROM Account ORDER BY Name ];
          return accountList;
      }

    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name =  '%'+ searchKey + '%';
            return [SELECT id, name, phone,(select firstname,lastname,Name from contacts) FROM Account WHERE name LIKE :name ORDER BY Name];
    }
  }

  