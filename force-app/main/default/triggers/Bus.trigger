trigger Bus on Bus__c (before insert) {
    new BusTriggerHandler().run();
}