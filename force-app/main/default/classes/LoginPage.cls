public with sharing class LoginPage {
    
    public List<Contact> authlist = new List<Contact>();
    public String recname{get;set;}
    public String recpass{get;set;}
    public List<Contact> conlist{get;set;}
    public string recid{get;set;}
    
    public LoginPage(){
        conlist = [select id, name, email, password__c from Contact];
        usernamecheck();
    }
    
    public Pagereference usernamecheck(){  
        List<Contact> authlist = [SELECT id, UserName__c, Password__c , AccountID FROM Contact WHERE UserName__c = :recname OR Email_Address__c = :recname];
        
        if(authlist.size() > 0){
            if(authlist[0].password__c != recpass){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Password is not correct'));
                return null;  
            }
            else {       
                recname = '';
                recpass = '';
                PageReference pageRef = new PageReference('/apex/Dashboard' ); //+ '?Aid=' + authlist[0].Accountid
                // put parameters 
                pageRef.getParameters().put('Aid',authlist[0].AccountId);
                pageRef.setRedirect(true);
                return pageRef;
            }
        }
        else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Username is not present r "' + recname + '"'));
            recpass = '';
            recname = '';
            return null;
        }
    } 
}
