public with sharing class Login1 {

    public Integer index = 0;
    public Integer index1 = 0;
    public Integer blocksize = 5 ;
    public String recievedaccountId = ApexPages.currentPage().getParameters().get('Aid');
     
    public List<Contact> conlist{get;set;}
    public List<Opportunity> Opplist{get;set;}  

    public Login1(){
        showDetails();
    }

    public String getrecordidfetch(){
        // convert accound id to name
        Account acc = [select name from Account where id = :recievedaccountId];
        String accname = acc.name;

        return accname;
    }
    
    
    public void showDetails(){
        System.debug('accountId'+recievedaccountId);
        if(recievedaccountId == null){
            System.debug('AccountId not present');
        }
        else{
            conlist = [select id, name,FirstName, email,LastName, AccountId , AssistantName from Contact where AccountId =:recievedaccountId];
            System.debug('conlist'+conlist);
            Opplist = [select id, name, amount,StageName , CloseDate from Opportunity where AccountId =:recievedaccountId];
            System.debug('Opplist'+Opplist);
        }
    }

    public void next() {
        index = index + blocksize;
        showDetails();
    }

    public void previous() {
        index = index - blocksize;
        showDetails();
    }
    
    public void next2() {
        index1 = index1 + blocksize;
        showDetails();
    }

    public void previous2() {
        index1 = index1 - blocksize;
        showDetails();
    }
 
    public Boolean getnxt(){
        if (index + blocksize >= conlist.size()){
            return true;
        }
        else{
            return false;
        }
    }

    public Boolean getPrevious(){
        if (index<=0) {
            return true;
        }
        return false;
    }
    
    public Boolean getnxtblock2(){
        if (index1 + blocksize >= opplist.size()){
            return true;
        }
        else{
            return false;
        }
    }

    public Boolean getPreviousblock2(){
        if (index1<=0) {
            return true;
        }
        return false;
    }

    public Pagereference loginPage(){
        PageReference redirectLogin = new Pagereference('/apex/loginpage');
        return redirectLogin;
    }

    public Pagereference register(){
        PageReference redirectRegister = new Pagereference('/apex/registrationpage');
        return redirectRegister;
    }
}
