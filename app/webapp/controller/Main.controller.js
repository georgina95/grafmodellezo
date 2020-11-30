sap.ui.define([
	"grafmodellezo/app/controller/BaseController"
], function (BaseController) {
	"use strict";

	return BaseController.extend("grafmodellezo.app.controller.Main", {

		onInit: function () {
			var oModel = new sap.ui.model.json.JSONModel({
                Tweets: [
                    {
                        text: "First"
                    },
                    {
                        text: "Second"
                    },
                    {
                        text: "Third"
                    }
                ]
            });

            this.getView().setModel(oModel, "Twitter");
        },
        
        onPress: function(oEvent) {
            
        }
	});

});