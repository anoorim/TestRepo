global class soapServiceExample {

    webservice static List<contact> getContact(List<String> namelist , List<String> mailingcityList){
        
        List<Contact> conList = [SELECT FirstName , LastName,Phone FROM Contact where lastname=:namelist AND mailingcity=:mailingcityList];
        return conList;
    }
}