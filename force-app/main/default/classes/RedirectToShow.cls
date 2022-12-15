public with sharing class RedirectToShow {
    
    public static String imageUrl;
    
    public RedirectToShow() {
        // get value from the URL
        imageUrl = ApexPages.currentPage().getParameters().get('imageUrl');
        System.debug('image url is ' + imageUrl);
    }
    // function for image url
    public String getImageUrl() {
        return imageUrl;
    }
}
