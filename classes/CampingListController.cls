public class CampingListController {

    @AuraEnabled
    public static List<Camping_Item__c> getItems(){
        
        return [select id,name from Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c items){
        upsert items;
        return items;
    }
    
}