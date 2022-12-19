public with sharing class ExceptionShowing extends HandleCustomException {
    public ExceptionShowing() {
        try {
            account acc;   
            acc.Name = 'Test Account';
            insert acc;                
        } catch (Exception e ) {
            HandleCustomException.LogException(e);
        }
    }
}
