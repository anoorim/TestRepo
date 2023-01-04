public with sharing class HttpRequestCtrl {
    
    public static Map<String,Object> getCalloutResponseContents(String url){

        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndPoint(url);
        req.setMethod('GET');
        HttpResponse resp = h.send(req);
        System.debug('Response@@@' +resp.getBody());
        Map<String,Object> resultMap = (Map<String,Object>)JSON.deserializeUntyped(resp.getBody());
        System.debug('ResultMap@@@@' +resultMap);
        return resultMap;
    }
}