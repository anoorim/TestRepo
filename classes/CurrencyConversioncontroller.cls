public with sharing class CurrencyConversioncontroller {

    @AuraEnabled
    public static Map<String,Object> retrieveCurrencyConversionrates(String strEndPointURL){
        try {
            
            Map<String,Object> mapJsonData = new Map<String,Object>();
            String strResponse =null;
            if(string.isNotBlank(strEndPointURL)){
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setEndPoint(strEndPointURL);
                req.setMethod('GET');
                req.setHeader('Authorization','OAuth '+UserInfo.getSessionId());
                req.setHeader('Authorization','Bearer '+UserInfo.getSessionId());
                HttpResponse res = h.send(req);
                if(res.getStatusCode() == 200){
                    strResponse = res.getBody();
                    System.debug('strResponse@@@@' +strResponse);
                }else{
                    throw new CalloutException(res.getBody());
                }
                if(string.isNotBlank(strResponse)){
                    mapJsonData = (Map<String,Object>)JSON.deserializeUntyped(strResponse);
                    System.debug('mapJsonData@@@@@' +mapJsonData);
                }
            }
            return mapJsonData;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

    }
}