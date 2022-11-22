public class AccountContactOppRelationController {
    public Id selectedAccId{get;set;}  
    public List<SelectOption> AccountList
    {
        get
        {
            List<Account> accTemp = new List<Account>();
            accTemp = [Select Id,Name from Account];
            
            AccountList = new List<SelectOption>();
            
            for(Account acc : accTemp)
            {
                AccountList.add(new SelectOption(acc.Id, acc.Name));
            }
            return AccountList;
        }
        set;
    }
}