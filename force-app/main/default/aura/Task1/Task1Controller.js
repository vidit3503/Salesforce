({
    doInit : function(component, event, helper) {  
        var action = component.get('c.showAccountsForAccordion');
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State : '+state);
            if(component.isValid() && state === "SUCCESS"){
                component.set("v.accounts",response.getReturnValue());
                console.log("v.accounts", JSON.stringify(response.getReturnValue()));                
                var pageSize = component.get("v.pageSize");
                var paginationList = [];
                for(var i=0; i< pageSize; i++)
                {
                    paginationList.push(response.getReturnValue()[i]);
                }
                component.set('v.paginationList', paginationList);
                component.set('v.totalSize', component.get('v.accounts').length);
                component.set('v.start',0);
                component.set('v.end',pageSize-1);
            }
        });
        $A.enqueueAction(action);
    },
    searchKeyChange: function(component, event, helper) {
        var start = component.get('v.start');
        console.log(start);
        var end = component.get('v.end');
        console.log(end); 
        var pageSize = component.get('v.pageSize');
        console.log(pageSize);
        var searchKey = component.find("searchKey").get("v.value");
        console.log('searchKey:::::'+searchKey);        
            var action = component.get("c.getByName");
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

                    var pageSize = component.get("v.pageSize");
                    console.log('pageSize : '+pageSize);
                    var paginationList = [];
                    for(var i=0; i< pageSize; i++)
                    {
                        if(response.getReturnValue()[i] != null){
                            paginationList.push(response.getReturnValue()[i]);
                        }    
                    }
                    component.set('v.paginationList', paginationList);
                    console.log('v.paginationList',JSON.stringify(response.getReturnValue()));
                    component.set('v.totalSize', component.get('v.accounts').length);
                    component.set('v.start',0);
                    component.set('v.end',pageSize-1);
                }   
            });   
        $A.enqueueAction(action);
    },
    next : function(component, event, helper){
        var aList = component.get('v.accounts');
        var start = component.get('v.start');
        console.log(start);
        var end = component.get('v.end');
        console.log(end); 
        var pageSize = component.get('v.pageSize');
        console.log(pageSize);
        var paginationList = [];
        var counter = 0;
        
        for(var i=end+1; i<end+pageSize+1; i++){
            if(aList.length > i)  
            {
                paginationList.push(aList[i]);
                console.log(paginationList);
            }
            counter++ ;
        }
        console.log(counter);
        start = start + counter;
        end = end + counter;
        component.set('v.start',start);
        component.set('v.end',end);
        component.set('v.paginationList', paginationList);
    },
    previous : function(component, event, helper){
        var aList = component.get('v.accounts');
        var end = component.get('v.end');
        var start = component.get('v.start');
        var pageSize = component.get('v.pageSize');
        var paginationList = [];
        var counter = 0;
        for(var i= start-pageSize; i < start ; i++){
            if(i > -1){
                paginationList.push(aList[i]);
                console.log(paginationList);
                counter++;
            }
            else {
                start++;
            }
        }
        start = start - counter;
        end = end - counter;
        component.set('v.start',start);
        component.set('v.end',end);
        component.set('v.paginationList', paginationList);
    }
    // first : function(component, event, helper){
    //     var aList = component.get('v.accounts');
    //     var pageSize = component.get('v.pageSize');
    //     console.log(pageSize)
    //     var paginationList = [];
    //     for(var i=0; i< pageSize; i++)
    //     {
    //         paginationList.push(aList[i]);
    //         console.log(paginationList);
    //     }
    //     component.set('v.paginationList', paginationList);
    // },
    // last : function(component, event, helper){
    //     var aList = component.get('v.accounts');
    //     console.log(aList);
    //     var pageSize = component.get('v.pageSize');
    //     console.log(pageSize);
    //     var totalSize = component.get('v.totalSize');
    //     console.log(totalSize);
    //     var paginationList = [];
    //     for(var i=totalSize-pageSize+1; i < totalSize; i++)
    //     {
    //         console.log(aList);
    //         paginationList.push(aList[i]);
    //         console.log(paginationList);
    //     }
    //     component.set('v.paginationList', paginationList);
    // },
})