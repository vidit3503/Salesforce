public with sharing class ExceptionDisplay {
    public static void Exception(){
        try{
          Account acc = new Account();
          insert acc;
        }
        catch(Exception e){
            HandleCustomException.LogException(e);
            System.debug(e);
        }
    }
}
