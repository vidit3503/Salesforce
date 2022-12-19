({
    doInit : function(component, event, helper) {
        // show all contacts    
        var action = component.get("c.getContacts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.contactWrapper", response.getReturnValue());
                console.log('contacts: ' + JSON.stringify(response.getReturnValue()));
            }
        });$A.enqueueAction(action);
    },
    showContacts1: function(component, event, helper) {
        // call helper method
        helper.searchcontacts1(component, event, helper);
    },
    showContacts2: function(component, event, helper) {
        helper.searchcontacts2(component, event, helper);
    },

    // drag start
    dragStart: function(component, event, helper) {
        event.dataTransfer.setData("contactId", event.target.id);
        console.log('contactId: ' + event.target.id);
    },

    // drag over
    dragOver: function(component, event, helper) {
        console.log('dragOver');
        event.preventDefault();
    },

    dropAccount1: function(component, event, helper) {
        helper.updateDraggable(component, event, helper , event.dataTransfer.getData("contactId"), component.find("searchKey1").get("v.value"));
        helper.searchcontacts1(component, event, helper);
        helper.searchcontacts2(component, event, helper);
        console.log('dropAccount1');
    },

    dropAccount2: function(component, event, helper) {
        helper.updateDraggable(component, event, helper , event.dataTransfer.getData("contactId"), component.find("searchKey2").get("v.value"));
        helper.searchcontacts2(component, event, helper);
        helper.searchcontacts1(component, event, helper);
        console.log('dropAccount2');
    }
})
