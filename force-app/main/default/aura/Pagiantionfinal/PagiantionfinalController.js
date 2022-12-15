({
    doInit : function(component, event, helper) {
        var action = component.get("c.getAccounts");
        action.setParams({
            "pageNumber": 1
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set("v.account", result.accounts);
                component.set("v.total", result.total);
                component.set("v.pages", Math.ceil(result.total / component.get("v.pageSize")));
            }
        });
        $A.enqueueAction(action);
    },

    // handel search
    searchKeyChange: function(component, event, helper) {
        var searchKey = component.find("searchId").get("v.value");
        console.log('searchKey', searchKey);
        var action = component.get("c.searchAccounts");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set("v.account", result.accounts);
                var PaginationList = [];
                component.set('v.PaginationList', PaginationList);
                component.set("v.total", result.total);
                component.set("v.pages", Math.ceil(result.total / component.get("v.pageSize")));
                for(var i=0; i< result.accounts.length; i++){
                    PaginationList.push(result.accounts[i]);
                }
            }
        }
        );
        $A.enqueueAction(action);
    },
    // handel pagination
    first : function(component, event, helper) {
        var accList = component.get("v.account");
        var PaginationList = [];
        for(var i=0; i< 10; i++){
            if(accList.length>i)
                PaginationList.push(accList[i]);
        }
        component.set('v.PaginationList', PaginationList);
    },
    last : function(component, event, helper) {
        var accList = component.get("v.account");
        var PaginationList = [];
        var total = component.get("v.total");
        for(var i=index; i< total; i++){
            if(accList.length> i)
                PaginationList.push(accList[i]);
        }
        component.set('v.PaginationList', PaginationList);
    },
    next : function(component, event, helper) {
        var accList = component.get("v.account");
        var PaginationList = [];
        var index = component.get("v.index");
        // var end = component.get("v.end");
        // var start = component.get("v.start");
        var counter = 0;

        for(var i=index; i< index+10; i++){
            if(accList.length> i){
                PaginationList.push(accList[i]);
                counter ++ ;
            }
        }
        // start = start + counter;
        // end = end + counter;

        // component.set('v.start', start);
        // component.set('v.end', end);


        component.set('v.PaginationList', PaginationList);
        component.set("v.index", index+10);
    },
    previous: function(component, event, helper) {
        var accList = component.get("v.account");
        var PaginationList = [];
        var index = component.get("v.index");
        // var pageSize = component.get("v.pageSize");
        for(var i=index-10; i< index; i++){
            if(accList.length> i)
                PaginationList.push(accList[i]);
        }
        component.set('v.PaginationList', PaginationList);
        component.set("v.index", index-10);
    }
})

