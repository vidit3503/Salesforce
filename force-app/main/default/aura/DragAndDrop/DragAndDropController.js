({
    doInit : function(component, event, helper) {
        helper.doInit(component, event, helper);
    },
    showContacts1: function(component, event, helper) {
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
        // set v.spinner to true for 2 seconds
        component.set("v.spinner", true);
        setTimeout(function(){
            component.set("v.spinner", false);
        }, 1000);
                
        console.log('dropAccount1');
    },

    dropAccount2: function(component, event, helper) {
        helper.updateDraggable(component, event, helper , event.dataTransfer.getData("contactId"), component.find("searchKey2").get("v.value"));
        helper.searchcontacts2(component, event, helper);
        helper.searchcontacts1(component, event, helper);

        component.set("v.spinner", true);
        setTimeout(function(){
            component.set("v.spinner", false);
        }, 1000);
        console.log('dropAccount2');
    },

})
