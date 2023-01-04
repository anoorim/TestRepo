public class CreateOpptyLineItem {
    
    public Deal_Size_Matrix__c dealSizeData{get;set;}
    public Boolean showblock{get;set;}
    private Opportunity currentRecord;
    private List<String> oppCategorySet;
    private Set<Id> productIdSet;
    
    public CreateOpptyLineItem(Apexpages.StandardController sc){
        
        dealSizeData = new Deal_Size_Matrix__c();
        this.currentRecord = (Opportunity)sc.getRecord();
        showblock=true;
        currentRecord = [SELECT Id,Name,StageName,Product_Categories__c,
                         (Select Id,PricebookEntry.Product2Id,PricebookEntry.Product2.Name From OpportunityLineItems) 
                         FROM Opportunity WHERE Id=:currentRecord.Id];
        if(String.isEmpty(currentRecord.Product_Categories__c)){
            showblock =false;
            apexpages.addMessage(new ApexPages.message(Apexpages.Severity.ERROR,Label.CategoryeError));
        }
      
        if(String.isEmpty(String.valueOf(Opportunity_Stage__mdt.getInstance(currentRecord.StageName)))){
            showblock =false;
            apexpages.addMessage(new ApexPages.message(Apexpages.Severity.ERROR,Label.Stage_Error));
        }
        if(currentRecord.OpportunityLineItems.size()>0){
            for(OpportunityLineItem opplineItem : currentRecord.OpportunityLineItems){
                if(!(opplineItem.PricebookEntry.Product2.Name.contains('Forcast'))){
                    showblock =false;
                    apexpages.addMessage(new ApexPages.message(Apexpages.Severity.ERROR,Label.DealSizeError));
                }
            }
        }
    }
    
    public void onOkClick(){
        
        List<OpportunityLineItem> existingOppLineItems;
        oppCategorySet = new List<String>();
        oppCategorySet.addAll(currentRecord.Product_Categories__c.split(';'));
        
        List<Deal_Size_Matrix__c> dealSizeRulesList = [SELECT Id,Deal_Size__c,Category__c,Product__c,Services__c,Training__c,Product_Quantity__c,Training_Quantity__c,Service_Quantity__c,
                                                       Product_Price__c,Product_Formula__c,Training_Price__c,Training_Formula__c,Service_Price__c,Service_Formula__c
                                                       FROM Deal_Size_Matrix__c WHERE 
                                                       Deal_Size__c=:dealSizeData.Deal_Size__c AND Category__c=:oppCategorySet AND Active__c=true];
        if(dealSizeRulesList.size()>0){
            if(currentRecord.OpportunityLineItems.size()>0){
                existingOppLineItems = new List<OpportunityLineItem>();
                for(OpportunityLineItem opplineItem : currentRecord.OpportunityLineItems){
                    existingOppLineItems.add(opplineItem);
                }
                Delete existingOppLineItems;
            }
            productIdSet = new Set<Id>();
            for(Deal_Size_Matrix__c  dealsize:dealSizeRulesList){
                if(!(String.isEmpty(dealsize.Product__c) )&& !(String.isEmpty(String.valueOf(dealsize.Product_Quantity__c)))){
                    productIdSet.add(dealsize.Product__c);
                    createOpportunityLineItem(currentRecord.id,dealsize.Product_Quantity__c,dealsize.Product__c,dealsize.Product_Price__c,dealsize.Product_Formula__c);
                }
                
               if( !(String.isEmpty(dealsize.Training__c)) &&  !(String.isEmpty(String.valueOf(dealsize.Training_Quantity__c)))){
                    productIdSet.add(dealsize.Training__c);
                    createOpportunityLineItem(currentRecord.id,dealsize.Training_Quantity__c,dealsize.Training__c,dealsize.Training_Price__c,dealsize.Training_Formula__c);
                }
                
               if(!(String.isEmpty(dealsize.Services__c)) &&  !(String.isEmpty(String.valueOf(dealsize.Service_Quantity__c)))){
                    productIdSet.add(dealsize.Services__c);
                    createOpportunityLineItem(currentRecord.id,dealsize.Service_Quantity__c,dealsize.Services__c,dealsize.Service_Price__c,dealsize.Service_Formula__c);
                } 
            }
        }
    }
    
    public void createOpportunityLineItem(Id oppId,Decimal quantity,Id productId,Decimal price,Decimal lineacv){
        
        Map<Id,Id> pbeMap = new Map<Id,Id>();     
        List<PricebookEntry> pbeList = [SELECT Id,Product2Id from PricebookEntry where Product2Id=:productIdSet];
        for(PricebookEntry pbe:pbeList){
            pbeMap.put(pbe.Product2Id, pbe.Id);
        }
        System.debug('productid@@@' +productId);
        System.debug('pbemap@@' +pbeMap);
        system.debug('pbe@@' +pbeMap.get(productId));
        OpportunityLineItem oppLineItem = new  OpportunityLineItem();
        oppLineItem.OpportunityId = oppId;
        oppLineItem.Quantity=quantity;
        oppLineItem.Product2Id=productId;
        oppLineItem.PricebookEntryId=pbeMap.get(productId);
        oppLineItem.UnitPrice=price;
        oppLineItem.Line_ACV_Amount__c=lineacv;
        Database.insert(oppLineItem);
    }
}