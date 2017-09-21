public class ExportOpportunityLineItemSchedulesToCSV{

    public static string getRecords(){
        String[] records = new String[]{};
        String[] olisProperties = new String[]{
            'Id',
            'ScheduleDate',
            'Revenue',
            'Quantity'
        };
        String[] oliProperties = new String[]{
            'TotalPrice',
            'Id'
        };
        String[] oProperties = new String[]{
            'Id'
        };
        
        String[] selectors = new String[]{};
        for(String property : olisProperties){
            selectors.add('OpportunityLineItemSchedule.' + property);
        }
        for(String property : oliProperties){
            selectors.add('OpportunityLineItemSchedule.OpportunityLineItem.' + property);
        }
        for(String property : oProperties){
            selectors.add('OpportunityLineItemSchedule.OpportunityLineItem.Opportunity.' + property);
        }
        
        OpportunityLineItemSchedule[] schedules = Database.query(
            'SELECT ' + String.join(selectors, ',') + ' FROM OpportunityLineItemSchedule'
        );
        
        records.add(String.join(selectors, ','));
        for(OpportunityLineItemSchedule schedule : schedules){
            String[] record = new String[]{};
            for(String property : olisProperties){
                record.add(String.valueOf(schedule.get(property)));
            }
            for(String property : oliProperties){
                record.add(String.valueOf(schedule.OpportunityLineItem.get(property)));
            }
            for(String property : oProperties){
                record.add(String.valueOf(schedule.OpportunityLineItem.Opportunity.get(property)));
            }
            records.add(String.join(record, ','));
        }
        return String.join(records, '\n');
    }
    
}