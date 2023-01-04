public class AnimalsCallouts {

	@future(callout = true)    
    public static void makeGetCallout()
    {
        Http http=new Http();
        Httprequest request=new Httprequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        Httpresponse response=http.send(request);
        if(response.getStatusCode()==200)
        {
            Map<String,Object> results=(Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals=(List<Object>) results.get('animals');
            for(Object animal:animals)
            {
                System.debug(animal);
            }
        }
        //return response;
    }
    
    public static HttpResponse makePostCallout()
    {
        Http http=new Http();
        Httprequest request=new Httprequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');                  
        Httpresponse response=http.send(request);
        if(response.getStatusCode() != 201)
        {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
         return response;
    }
   
}