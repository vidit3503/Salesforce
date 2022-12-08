trigger Task5 on Account (before insert) {
    for (Account acc : Trigger.new) {
        acc.Ownership = 'Public';
    }
}