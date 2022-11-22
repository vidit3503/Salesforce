trigger Task2 on Lead (before insert) {
    
    for (Lead lead : Trigger.New) {
        lead.Rating = 'Hot';    
    }
}