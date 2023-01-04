public class ContactTemplateController {

    public List<Contact> contacts{get;set;}
    public List<ID> sampleContacts{get;set;}
    public List<ID> sample2Contacts{get;set;}
    public static final Id Sample_Rec_Type = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Sample').getRecordTypeId();
    public static final Id Sample2_Rec_Type = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Sample2').getRecordTypeId();
    
    public ContactTemplateController(ApexPages.StandardSetController stdSetController){
        // Returns all selected records
        contacts = (List<Contact>) stdSetController.getSelected();
        sampleContacts =  new List<ID>();
        sample2Contacts =  new List<ID>();
        for(Contact con : contacts) {
            if(con.RecordTypeId == Sample_Rec_Type) {
                sampleContacts.add(con.Id);
            }else if (con.RecordTypeId == Sample2_Rec_Type) {
                sample2Contacts.add(con.Id);
            }
        }
    }
    
    public List<Contact> getconRec() {
        return [SELECT Id,Name From Contact Where Id = :sampleContacts];
    }
    
    public List<Contact> getconRecSample2() {
        return [SELECT Id,Name From Contact Where Id = :sample2Contacts];
    }
}