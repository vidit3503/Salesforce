public with sharing class FutureMethods {

    @future(callout=true)
    public static void uploadFilesInOpportunity() {
        List<Opportunity> oppList = [SELECT Id, Name FROM Opportunity];
        List<ContentVersion> contentVersionList = new List<ContentVersion>();
        String client_id ='n6hIGrZfOLw24WT89yQUSyVhvSwPkghd96xo7uvGvpc' ;
        String url = 'https://api.unsplash.com/photos/random/?client_id=' + client_id;
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);
        ContentVersion contentVersion = new ContentVersion();
        contentVersion.Title = 'Image from unsplash';
        contentVersion.PathOnClient = 'image';
        Blob body = Blob.valueOf(response.getBody());
        contentVersion.VersionData = body;
        contentVersionList.add(contentVersion);
        insert contentVersionList;
    }
}



/*

public with sharing class UploadFilesInOpportunity {

    @future(callout=true)
    public static void uploadFilesInOpportunity() {
        List<Opportunity> oppList = [SELECT Id, Name FROM Opportunity];
        List<ContentVersion> contentVersionList = new List<ContentVersion>();
        String client_id ='n6hIGrZfOLw24WT89yQUSyVhvSwPkghd96xo7uvGvpc' ;
        String url = 'https://api.unsplash.com/photos/random/?client_id=' + client_id;
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);
        ContentVersion contentVersion = new ContentVersion();
        contentVersion.Title = 'Image from unsplash';
        Blob body = Blob.valueOf(response.getBody());
        // base64 encode the body
        String encodedBody = EncodingUtil.base64Encode(body);
        contentVersion.VersionData = EncodingUtil.base64Decode(encodedBody);
        // contentVersion.VersionData = EncodingUtil.base64Decode(body)
        contentVersion.PathOnClient = 'image';
        
        // contentVersion.VersionData = encodedBody;
        contentVersionList.add(contentVersion);
        insert contentVersionList;
    }
}
*/