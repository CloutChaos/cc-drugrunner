QBCore Script to run Steroids for Brucie

Add to server.cfg ensure cc-drugrunner

```

Add to qb-core/shared/items.lua

###
    --cc-drugrunner
	["bullshark"]                       = {["name"] = "bullshark", 				           ["label"] = "Bullshark Testosterone", 	["weight"] = 1000, 		   ["type"] = "item", 		  ["image"] = "bullshark.png", 		         ["unique"] = false, 	     ["useable"] = true, 	  ["shouldClose"] = true,      ["combinable"] = nil,   ["description"] = "I should probably not mess around with this."},
	["drug_payment"]                    = {["name"] = "drug_payment", 				       ["label"] = "Payment", 			        ["weight"] = 0, 		   ["type"] = "item", 		  ["image"] = "payment.png", 		         ["unique"] = false, 	     ["useable"] = true, 	  ["shouldClose"] = true,      ["combinable"] = nil,   ["description"] = "I should return this for my cut."},


###

Add to qb-target/init.lua:

Config.Peds:
###

	{ --deliveryped
	model = 'ig_brucie2',
	coords = vector4(434.9070, -1906.6792, 24.923, 208.2749),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
	},

###

Config.TagetModels:
###

	["deliveryped"] = {
        models = {
            "ig_brucie2",
        },
        options = {
            {
                type = "client",
                event = "cc-drugrunner:client:OrderDelivery",
                icon = "fas fa-capsules", 
                label = "Request Delivery",
            },
            {
                type = "client",
                event = "cc-drugrunner:client:ReceivePayment",
                icon = "fas fa-dollar", 
                label = "Receive Payment",
                item = "drug_payment",
            }
        },
        distance = 2.5,
    },

###

# Dependicies

- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
- gksphone - https://fivem.gkshop.org/package/4862478
- dpemotes - https://github.com/qbcore-framework/dpemotes
