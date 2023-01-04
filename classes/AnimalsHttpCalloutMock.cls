@isTest 	
global class AnimalsHttpCalloutMock implements HttpCalloutMock {
    
    global HttpResponse respond(Httprequest request)
    {
        HttpResponse response=new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        response.setStatusCode(200);
        return response; 
    }
}