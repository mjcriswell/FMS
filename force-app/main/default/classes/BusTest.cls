@IsTest
private class BusTest {

    @IsTest
    static void testBusPricingScenario_1() {
        Bus__c b = new Bus__c();
        b.Name = 'Test Bus';
        b.Current_Status__c = BusTriggerHandler.CURRENT_STATUS_READY_FOR_USE;
        b.Maximum_Capacity__c = '24';

        Test.startTest();

        insert b;

        Test.stopTest();

        b = [SELECT Resale_Value__c FROM Bus__c WHERE Name = 'Test Bus' LIMIT 1];
        System.assertEquals(120000, b.Resale_Value__c);
    }

    @IsTest
    static void testBusPricingScenario_2() {
        Bus__c b = new Bus__c();
        b.Name = 'Test Bus';
        b.Current_Status__c = BusTriggerHandler.CURRENT_STATUS_READY_FOR_USE;
        b.Maximum_Capacity__c = '36';

        Test.startTest();

        insert b;

        Test.stopTest();

        b = [SELECT Resale_Value__c FROM Bus__c WHERE Name = 'Test Bus' LIMIT 1];
        System.assertEquals(160000, b.Resale_Value__c);
    }

    @IsTest
    static void testBusPricingScenario_3() {
        Bus__c b = new Bus__c();
        b.Name = 'Test Bus';
        b.Current_Status__c = BusTriggerHandler.CURRENT_STATUS_READY_FOR_USE;
        b.Maximum_Capacity__c = '36';
        b.Odometer_Reading__c = 100001;

        Test.startTest();

        insert b;

        Test.stopTest();

        b = [SELECT Resale_Value__c FROM Bus__c WHERE Name = 'Test Bus' LIMIT 1];
        System.assertEquals(159999.9, b.Resale_Value__c);
    }

    @IsTest
    static void testBusPricingScenario_4() {
        Bus__c b = new Bus__c();
        b.Name = 'Test Bus';
        b.Current_Status__c = BusTriggerHandler.CURRENT_STATUS_READY_FOR_USE;
        b.Maximum_Capacity__c = '36';
        b.Air_Conditioned__c = true;

        Test.startTest();

        insert b;

        Test.stopTest();

        b = [SELECT Resale_Value__c FROM Bus__c WHERE Name = 'Test Bus' LIMIT 1];
        System.assertEquals(164800, b.Resale_Value__c);
    }

    @IsTest
    static void testBusPricingScenario_5() {
        Bus__c b = new Bus__c();
        b.Name = 'Test Bus';
        b.Current_Status__c = BusTriggerHandler.CURRENT_STATUS_READY_FOR_USE;
        b.Maximum_Capacity__c = '36';
        b.Year__c = '1972';

        Test.startTest();

        insert b;

        Test.stopTest();

        b = [SELECT Resale_Value__c FROM Bus__c WHERE Name = 'Test Bus' LIMIT 1];
        System.assertEquals(214400, b.Resale_Value__c);
    }
}
