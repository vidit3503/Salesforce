public with sharing class ImageUploadNFetch {
    @future(callout=true)
    public static void ImageUploadNFetch() {
        String client_id ='n6hIGrZfOLw24WT89yQUSyVhvSwPkghd96xo7uvGvpc' ;
        String url = 'https://api.unsplash.com/photos/random/?client_id=' + client_id;
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        // get response as image
        contentversion cv = new contentversion();
        cv.title = 'Random Image';
        cv.pathOnClient = 'RandomImage.jpg';
        cv.versiondata = res.getBody();
        insert cv;
        

    }
}
