public class AuraWizardController {
    @AuraEnabled
    public static string save(Account accountData ,Contact contactData,Opportunity opportunityData,Event eventData){
        try{
            System.debug('accountData::::'+accountData);
            System.debug('contactData::::'+contactData);
            System.debug('opportunityData::::'+opportunityData);
            System.debug('eventData::::'+eventData);
            
            insert accountData;
            contactData.AccountId = accountData.id;
            insert contactData;
            opportunityData.AccountId = accountData.id;
            insert opportunityData;
            eventData.WhoId = contactData.id;
            insert eventData;
            System.debug(eventData);
        }
        catch(Exception ex){
            HandleCustomException.LogException(ex);
            return ex.getMessage();
        }
        return 'record successfully insert';  
    }
}