trigger Task9 on Contact (after delete) {
    
    // delete account when contact is deleted
    List<Account> Acc = new List<Account>();
    for (Contact Con : Trigger.old ) {
        Acc = [SELECT Id FROM Account WHERE Id=:Con.AccountId];
        delete Acc;
    }
}
