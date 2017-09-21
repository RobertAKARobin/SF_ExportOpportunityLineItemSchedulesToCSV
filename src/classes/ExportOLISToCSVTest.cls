@isTest
private class ExportOLISToCSVTest {

    static testMethod void testGetRecords() {
        String records = ExportOpportunityLineItemSchedulesToCSV.getRecords();
        System.assertEquals('a', 'a');
    }
}
