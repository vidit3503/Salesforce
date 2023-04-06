({  
    doInit: function (component, event, helper) {
        if ($A.get("$SObjectType.CurrentUser.UserType") !== "System Administrator") {
            $A.util.addClass(component.getElement(), "hidden");
        }
    },


    handleImageURLChange: function (component, event, helper) {
        var imageURL = component.get("v.imageURL");
        if (imageURL != null && imageURL != "") {
            component.set("v.imageURL", imageURL);
        }
    },
    handleBackgroundColorChange: function (component, event, helper) {
        var backgroundColor = component.get("v.backgroundColor");
        if (backgroundColor != null && backgroundColor != "") {
            component.set("v.backgroundColor", backgroundColor);
            // change backgrqound color of the component
        }
    },
    handledescriptionChange: function (component, event, helper) {
        var description = component.get("v.description");
        if (description != null && description != "") {
            component.set("v.description", description);
        }
    },
    handleFontSizeChange: function (component, event, helper) {
        var fontSize = component.get("v.fontSize");
        if (fontSize != null && fontSize != "") {
            component.set("v.fontSize", fontSize );
        }
    },
    handleFontColorChange: function (component, event, helper) {
        var fontColor = component.get("v.fontColor");
        if (fontColor != null && fontColor != "") {
            component.set("v.fontColor", fontColor);
        }
    },
})
