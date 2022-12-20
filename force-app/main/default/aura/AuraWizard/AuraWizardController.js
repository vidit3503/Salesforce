({
    nextTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showOpportunity = component.get("v.showOpportunity");
        var showEvent = component.get("v.showEvent");
        var showData = component.get("v.showData");
        
        if(showAccount == true){
            var accountName = component.find("Name").get("v.value");
            console.log('accountName:::'+accountName);
            if(accountName =='' || accountName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showContact",false);
                component.set("v.showOpportunity", false);
                component.set("v.showEvent", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", true);
                component.set("v.showOpportunity", false); 
                component.set("v.showError", false);
                component.set("v.showEvent", false);
                component.set("v.showData", false);
                helper.progressUpdate(component, event, helper);
            }
        }    
        if(showContact == true){
            var lastName = component.find("LastName").get("v.value");
            console.log('lastName:::'+lastName);
            if(lastName =='' || lastName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showOpportunity", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                component.set("v.showEvent", false);
                
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showOpportunity", true);
                component.set("v.showEvent", false);
                component.set("v.showError", false);
                component.set("v.showData", false);
                helper.progressUpdate(component, event, helper);
            }
        }   
        
        if(showOpportunity == true){
            var OpportunityName = component.find("OpportunityName").get("v.value");
            console.log('OpportunityName:::'+OpportunityName);
            var StageName = component.find("StageName").get("v.value");
            console.log('StageName:::'+StageName);
            var closeDate = component.find("closeDate").get("v.value");
            console.log('closeDate:::'+closeDate);
            if((OpportunityName =='' || OpportunityName == null) || (StageName =='' || StageName == null) || (closeDate =='' || closeDate == null)){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                component.set("v.showEvent", false);
                
            }
            else
            { 
                component.set("v.showOpportunity", false);
                component.set("v.showContact", false);
                component.set("v.showAccount", false);
                component.set("v.showEvent", true);
                component.set("v.showError", false);
                component.set("v.showData", false);
                helper.progressUpdate(component, event, helper);
            }
        }    
        if(showEvent == true){

            var Subject = component.find("Subject").get("v.value");
            console.log('Subject:::'+Subject);
            var StartDateTime = component.find("StartDateTime").get("v.value");
            console.log('StartDateTime:::'+StartDateTime);
            var EndDateTime = component.find("EndDateTime").get("v.value");
            console.log('EndDateTime:::'+EndDateTime);
            
            // difference between enddate and startdate must be greater than 0 and less than 14
            if(EndDateTime !='' && EndDateTime != null && StartDateTime !='' && StartDateTime != null){
                var date1 = new Date(StartDateTime);
                var date2 = new Date(EndDateTime);
                var timeDiff = Math.abs(date2.getTime() - date1.getTime());
                var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                console.log('diffDays:::'+diffDays);
                if(diffDays > 14 || diffDays < 0){
                    component.set("v.setMessage2",'error');
                }
            }
            
            if((Subject =='' || Subject == null) || (StartDateTime =='' || StartDateTime == null) || (EndDateTime =='' || EndDateTime == null)){
                component.set("v.setMessage2",'error');  
            }
            if(component.get("v.setMessage2")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showOpportunity", false);
                component.set("v.showError", false);
                component.set("v.showError2", true);
                component.set("v.showData", false);
                component.set("v.setMessage2",'');
            }
            else
            { 
                component.set("v.showOpportunity", false);
                component.set("v.showContact", false);
                component.set("v.showAccount", false);
                component.set("v.showEvent", false);
                component.set("v.showError2", false);
                component.set("v.showError", false);
                component.set("v.showData", true);
                helper.progressUpdate(component, event, helper);
            }
        }
    },
    prevTab : function(component, event, helper) {
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showOpportunity = component.get("v.showOpportunity");
        var showEvent = component.get("v.showEvent");
        var showData = component.get("v.showData");
          
        if(showContact == true){
            component.set("v.showAccount", true);
            component.set("v.showContact", false);
            component.set("v.showOpportunity", false);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            helper.progressUpdate(component, event, helper);
        }    
        if(showOpportunity == true){
            component.set("v.showAccount", false);
            component.set("v.showContact", true);
            component.set("v.showOpportunity", false);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            helper.progressUpdate(component, event, helper);
        } 

        if(showEvent == true){
            component.set("v.showAccount", false);
            component.set("v.showContact", false);
            component.set("v.showOpportunity", true);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            helper.progressUpdate(component, event, helper);
        }


        if(showData == true){
            component.set("v.showAccount", false);
            component.set("v.showContact", false);
            component.set("v.showOpportunity", false);
            component.set("v.showEvent", true);
            component.set("v.showError", false);
            component.set("v.showData", false);
            helper.progressUpdate(component, event, helper);
        }  
    },

    onSelectChange : function(component, event, helper) {
        var selected = component.find("StageName").get("v.value");
        component.set("v.opportunityData.StageName",selected);
        console.log('opp::::'+JSON.stringify(selected));
    },

    onSelectChange2 : function(component, event, helper) {
        var selected = component.find("Subject").get("v.value");
        component.set("v.eventData.Subject",selected);
        console.log('opp::::'+JSON.stringify(selected));
    },

    saveRecord : function(component, event, helper) {
        helper.saveData(component, event, helper);               
    },

    // doInit : function(component, event, helper) {
    //     helper.progressUpdate(component, event, helper);
    // }
})