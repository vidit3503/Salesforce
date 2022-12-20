({
    updateDraggable: function(component, event, helper , contactId, accountId) {
        var action = component.get("c.updateContact");
        action.setParams({
            "contactId": contactId,
            "accountId": accountId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.contactWrapper", response.getReturnValue());
                console.log('contacts: ' + JSON.stringify(response.getReturnValue()));
            }
        }
        );$A.enqueueAction(action);
    },
    searchcontacts1: function(component, event, helper) {
        // call helper method
        var searchKey1 = component.find("searchKey1").get("v.value");
        var action = component.get("c.getContacts");
        action.setParams({
            "searchKey1": searchKey1
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.contactWrapper1", response.getReturnValue());
                console.log('contacts: ' + JSON.stringify(response.getReturnValue()));
            }
        }
        );$A.enqueueAction(action);
    },
    searchcontacts2: function(component, event, helper) {
        var searchKey2 = component.find("searchKey2").get("v.value");
        var action = component.get("c.getContacts");
        action.setParams({
            "searchKey2": searchKey2
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.contactWrapper2", response.getReturnValue());
                console.log('contacts: ' + JSON.stringify(response.getReturnValue()));
            }
        }
        );$A.enqueueAction(action);
    },

    doInit : function(component, event, helper) {
        var action = component.get("c.getContacts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.contactWrapper", response.getReturnValue());
                console.log('contacts: ' + JSON.stringify(response.getReturnValue()));
            }
        });$A.enqueueAction(action);
    }
})
