public with sharing class registrationpage{

    public Contact contact { get; set; }
    
    public registrationpage() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        contact = (id == null) ? new Contact() : 
        [SELECT  UserName__c,FirstName, LastName, Phone, Email_Address__c ,AccountId , Account.name
        FROM Contact WHERE UserName__c = :Id with SECURITY_ENFORCED];
    }

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

    public PageReference save() {
        contact.AccountId = selectedAccId;
        try {
            insert(Contact);
        } 
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
        PageReference redirectSuccess = new Pagereference('/apex/loginpage');
        return (redirectSuccess);

    }
    
    public PageReference cancel() {
        PageReference redirectCancel = new ApexPages.StandardController(Contact).view();
        return (redirectCancel);
    }
}
