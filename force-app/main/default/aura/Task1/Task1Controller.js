({
    // show all records when search text is empty
    doInit: function(component, event, helper) {
        helper.getAccountList(component);
    },
    
    searchRecords: function(component, event) {
        var searchKey = event.getParam("v.searchKey");
        var action = component.get("c.findByName");
        action.setParams({
          "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.contacts", a.getReturnValue());
        });$A.enqueueAction(action);
    },

    // clear search key
    clearSearchKey : function(component, event, helper) {
        helper.getAccountList(component);
    }
})