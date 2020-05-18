package com.dao.impl;

import java.util.HashMap;
import java.util.Map;

import com.beans.ConnFile;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;

public class StripeService {
	public StripeService() {
        Stripe.apiKey = ConnFile.stripeApikey;
    }
	 public Charge chargeNewCard(String token, double amount)  {
		
	        Map<String, Object> chargeParams = new HashMap<String, Object>();
	        chargeParams.put("amount", (int)(amount * 100));
	        chargeParams.put("currency", "INR");
	        chargeParams.put("source", token);
	        Charge charge = null;
			try {
				charge = Charge.create(chargeParams);
			} catch (StripeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	      
	        return charge;
	    }
}
