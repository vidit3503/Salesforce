({
    saveData : function(component, event, helper) {
        var action = component.get("c.save");
        action.setParams({
            accountData : component.get("v.accountData"),
            contactData : component.get("v.contactData"),
            opportunityData : component.get("v.opportunityData"),
            eventData : component.get("v.eventData")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
                var message = response.getReturnValue();
                console.log("message>>>>>>>>" +JSON.stringify(message));
                component.set("v.message", message);
            if(message == 'record successfully insert'){
                document.getElementById("showErrorrTractConfig").style.display = "none";
                document.getElementById("showMessageTractConfig").style.display = "block";
                // set message as success
                message = 'Success! Your record has been saved.'
                component.set("v.progress", 100);
                component.set("v.message", message);
                // RESET FORM
                component.set("v.accountData",{'sobjectType': 'Account','Name': '','Phone': '','Website': '','BillingStreet': '','BillingCity': '','BillingState': '','BillingPostalCode': '','BillingCountry': ''});
                component.set("v.contactData",{'sobjectType': 'Contact','FirstName': '','LastName': '','Phone': '','Email': ''});
                component.set("v.opportunityData",{'sobjectType': 'Opportunity','Name': '','StageName': '','CloseDate': '','Amount': '','Probability': '','NextStep': ''});
                component.set("v.eventData",{'sobjectType': 'Event','Subject': '','StartDateTime': '','EndDateTime': '','Location': ''});
                // REDIRECT TO THANK YOU WIZARD PAGE
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showOpportunity", false);
                component.set("v.showEvent", false);
                component.set("v.showError", false);
                component.set("v.showData", false);
                component.set("v.showThankYou", true);
                // call progressUpdate function
            }else{
                document.getElementById("showMessageTractConfig").style.display = "none";
                document.getElementById("showErrorrTractConfig").style.display = "block";
            }    
        });  
        $A.enqueueAction(action);
    },

    progressUpdate : function(component, event, helper) {
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showOpportunity = component.get("v.showOpportunity");
        var showEvent = component.get("v.showEvent");
        var showData = component.get("v.showData");
        var showThankyou = component.get("v.showThankyou");
        if(showAccount == true){
            component.set("v.progress", 16);
        }
        if(showContact == true){
            component.set("v.progress", 32);
        }
        if(showOpportunity == true){
            component.set("v.progress", 48);
        }
        if(showEvent == true){
            component.set("v.progress", 64);
        }
        if(showData == true){
            component.set("v.progress", 80);
        }
        if(showThankyou == true){
            component.set("v.progress", 100);
        }
    },
})