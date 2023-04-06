public class  QueuableApex  implements Queueable { 
    public void execute(QueueableContext context) {
        try {
            Account a = new Account(Name='Acme',Phone='(415) 555-1212');
            insert a;    
        } catch (Exception e) {
            HandleCustomException.LogException(e);
        }
    }
}