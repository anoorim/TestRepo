public class sampleController {

    public static String currentRecordId {get;set;}
    public static String recId {get;set;}
    
    public sampleController(ApexPages.StandardController controller) {
        System.debug('calling constructor');
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        System.debug('record id' +currentRecordId );
    }
    
    public static void performdml(){
        
        System.debug('calling dml function');
        Account acc = [select id,billingcity from account where id = :recId];
        acc.BillingCity = 'Banglore';
        update acc;
        System.debug('Account updated@@@' +acc);
    }
}