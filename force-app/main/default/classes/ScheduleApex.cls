global class ScheduleApex implements Schedulable {
   global void execute(SchedulableContext SC) {
      try {
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         mail.setToAddresses(new String[] {'shahvidit2@gmail.com'});
         mail.setSubject('Test Email');
         mail.setPlainTextBody('This is a test email');
         Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
      } catch (Exception e) {
         HandleCustomException.LogException(e);
         System.debug(e);
      }
   }
}