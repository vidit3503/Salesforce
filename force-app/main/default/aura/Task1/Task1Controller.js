({
    // show all records when search text is empty
    doInit: function(component, event, helper) {
        helper.getAccountList(component);
    },
    searchRecords: function( component, event, helper ) {
        var searchKey = component.find("searchKey").get("v.value");
        console.log('searchKey:::::'+searchKey);
            var action = component.get("c.findByName");
            console.log('action : '+action);
            action.setParams({
                "searchKey": searchKey
            });
            action.setCallback(this, function(response) { 
                var state = response.getState();
                console.log('State : '+state);
                if(component.isValid() && state === "SUCCESS"){
                    component.set("v.accounts",response.getReturnValue());
                    console.log("v.accounts", JSON.stringify(response.getReturnValue()));
                }
            });   
        $A.enqueueAction(action);
    }
})
