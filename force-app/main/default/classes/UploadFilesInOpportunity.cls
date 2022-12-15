public with sharing class UploadFilesInOpportunity {

    public static String imageUrl;

    @future(callout=true)
    public static void UploadFilesInOpportunity() {
        String url = 'https://api.unsplash.com/photos/random/?query=minimal&client_id=n6hIGrZfOLw24WT89yQUSyVhvSwPkghd96xo7uvGvpc' ;
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        String response = res.getBody();
        System.debug(response);
        imageUrl = response.substring(response.indexOf('https://'),response.indexOf('","full"'));
        System.debug(imageUrl);
        HttpRequest req2 = new HttpRequest();
        req2.setEndpoint(imageUrl);
        req2.setMethod('GET');
        http request2 = new Http();
        HttpResponse res2 = request2.send(req2);
        System.debug(res2);
        Blob imageresponse = res2.getBodyAsBlob();
        contentversion cv = new contentversion();
        cv.title = 'Random Image';
        cv.pathOnClient = 'RandomImage.jpg';
        cv.versiondata = imageresponse;
        insert cv;
        String opportunityId = ApexPages.currentPage().getParameters().get('id');
        contentdocumentlink cdl = new contentdocumentlink();
        cdl.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cv.Id].ContentDocumentId;
        cdl.linkedentityid =  opportunityId;
        cdl.visibility = 'AllUsers';
        cdl.sharetype = 'V';
        insert cdl;
    }
    // get image
    public static String getImageUrl() {
        return imageUrl;
    }
}