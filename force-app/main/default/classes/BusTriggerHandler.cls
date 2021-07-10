public with sharing class BusTriggerHandler extends TriggerHandler {

    public static final String CURRENT_STATUS_READY_FOR_USE = 'Ready for Use';

    private List<Bus__c> newBuses;

    public BusTriggerHandler() {
        this.newBuses = (List<Bus__c>) Trigger.new;
    }

    public override void beforeInsert() {
        for(Bus__c b : newBuses){
            if(b.Current_Status__c == CURRENT_STATUS_READY_FOR_USE){
                if(b.Maximum_Capacity__c == '24'){
                    b.Resale_Value__c = 120000;
                }else if(b.Maximum_Capacity__c == '36'){
                    b.Resale_Value__c = 160000;
                }
                if(b.Resale_Value__c != null && b.Resale_Value__c > 0){
                    if(b.Odometer_Reading__c >= 100001){
                        b.Resale_Value__c -= 0.10 * (b.Odometer_Reading__c - 100000);
                    }
                    if(b.Air_Conditioned__c){
                        b.Resale_Value__c = b.Resale_Value__c * 1.03;
                    }
                    if(b.Year__c != null && Integer.valueOf(b.Year__c) <= 1972){
                        b.Resale_Value__c = b.Resale_Value__c * 1.34;
                    }
                }
            }
        }
    }
}
