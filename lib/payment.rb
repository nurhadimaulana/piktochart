require 'paypal-sdk-merchant'

module Payment

  class Discount

    # calculate discount sample command
    # Payment::Discount.calculate(discount: 0.5, price: 100000)

    def self.calculate(params)
      if params[:discount] and params[:price]
        if params[:discount].is_a? Numeric and params[:price].is_a? Numeric
          discount = (params[:price].to_i / 100) * params[:discount].to_f
          price = params[:price].to_f - discount.to_f
          
          return price.to_f
        else
          return "string is not allowed"
        end
      else
        return "please check your params"
      end
    end
  end

  class Paypal

    # one pay off sample command
    # Payment::Paypal.one_pay_off(returnUrl:"https://paypal-sdk-samples.herokuapp.com/merchant/do_express_checkout_payment", cancelUrl:"https://paypal-sdk-samples.herokuapp.com/merchant/set_express_checkout", orderTotal:{currency: "USD", value:120}, itemTotal:{currency:"USD", value:100}, shippingTotal:{currency:"USD", value:10},taxTotal:{currency:"USD", value:10}, notifyUrl:"https://paypal-sdk-samples.herokuapp.com/merchant/ipn_notify", shipToAddress:{name:"John Doe", street:"1 Main St", cityName:"San Jose", stateOrProvince:"CA", country:"US", postalCode:95131}, shippingMethod:"UPSGround", paymentDetailsItem:{name:"Item Name", quantity:1, amount:{currency:"USD", value:100}, itemCategory:"Physical"}, paymentAction:"Sale")
  
    def self.one_pay_off(params)
      if params[:returnUrl] and
        params[:cancelUrl] and
        params[:orderTotal][:currency] and
        params[:orderTotal][:value] and
        params[:itemTotal][:currency] and
        params[:itemTotal][:value] and 
        params[:shippingTotal][:currency] and
        params[:shippingTotal][:value] and 
        params[:taxTotal][:currency] and
        params[:taxTotal][:value] and 
        params[:notifyUrl] and
        params[:shipToAddress][:name] and
        params[:shipToAddress][:street] and
        params[:shipToAddress][:cityName] and
        params[:shipToAddress][:stateOrProvince] and
        params[:shipToAddress][:country] and
        params[:shipToAddress][:postalCode] and
        params[:shippingMethod] and
        params[:paymentDetailsItem][:name] and
        params[:paymentDetailsItem][:quantity] and
        params[:paymentDetailsItem][:amount][:currency] and
        params[:paymentDetailsItem][:amount][:value] and
        params[:paymentDetailsItem][:itemCategory] and
        params[:paymentAction]

        @api = PayPal::SDK::Merchant::API.new

        # Build request object
        @set_express_checkout = @api.build_set_express_checkout({
          :SetExpressCheckoutRequestDetails => {
            :ReturnURL => params[:returnUrl].to_s,
            :CancelURL => params[:cancelUrl].to_s,
            :PaymentDetails => [{
              :OrderTotal => {
                :currencyID => params[:orderTotal][:currency].to_s,
                :value => params[:orderTotal][:value].to_f },
              :ItemTotal => {
                :currencyID => params[:itemTotal][:currency].to_s,
                :value => params[:itemTotal][:value].to_f },
              :ShippingTotal => {
                :currencyID => params[:shippingTotal][:currency].to_s,
                :value => params[:shippingTotal][:value].to_f },
              :TaxTotal => {
                :currencyID => params[:taxTotal][:currency].to_s,
                :value => params[:taxTotal][:value].to_f },
              :NotifyURL => params[:notifyUrl].to_s,
              :ShipToAddress => {
                :Name => params[:shipToAddress][:name].to_s,
                :Street1 => params[:shipToAddress][:street].to_s,
                :CityName => params[:shipToAddress][:cityName].to_s,
                :StateOrProvince => params[:shipToAddress][:stateOrProvince].to_s,
                :Country => params[:shipToAddress][:country].to_s,
                :PostalCode => params[:shipToAddress][:postalCode].to_i },
              :ShippingMethod => params[:shippingMethod].to_s,
              :PaymentDetailsItem => [{
                :Name => params[:paymentDetailsItem][:name].to_s,
                :Quantity => params[:paymentDetailsItem][:quantity].to_f,
                :Amount => {
                  :currencyID => params[:paymentDetailsItem][:amount][:currency].to_s,
                  :value => params[:paymentDetailsItem][:amount][:value].to_f },
                :ItemCategory => params[:paymentDetailsItem][:itemCategory].to_s }],
              :PaymentAction => params[:paymentAction].to_s }] } }
        )

        # Make API call & get response
        @response = @api.set_express_checkout(@set_express_checkout)

        # Access Response
        if @response.success?
          return @response
          # there are :
            # @response.Timestamp
            # @response.Ack
            # @response.CorrelationID
            # @response.Version
            # @response.Build
            # @response.Token
        else
          return @response.Errors
        end

      else
        return "please check your params"
      end
    end

    # recurring sample command
    # Payment::Paypal.recurring(creditCard:{type: "Visa", number: "4904202183894535", expMonth: 12, expYear: 2022, ccv2: "962"}, recurringPaymentsProfileDetails:{subcriberShippingAddress:{name: "John Doe", street: "1 Main St", cityName: "San Jose", stateOrProvince: "CA", country: "US", postalCode: "95131"}, billingStartDate: "2022-10-12T00:00:00+00:00"}, scheduleDetails:{description: "Welcome to the world of shopping where you get everything", trialPeriod:{billingPeriod:"Day", billingFrequency: 10, totalBillingCycles: 8}, paymentPeriod:{billingPeriod: "Day", billingFrequency: 10, totalBillingCycles: 8, amount:{currencyId: "USD", value: "5"}}, maxFailedPayments: 3, activationDetails:{failedInitialAmountAction: "ContinueOnFailure"}, autoBillOutstandingAmount: "NoAutoBill" })

    def self.recurring(params)
      if params[:creditCard][:type] and
        params[:creditCard][:number] and
        params[:creditCard][:expMonth] and
        params[:creditCard][:expYear] and
        params[:creditCard][:ccv2] and
        params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:name] and
        params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:street] and
        params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:cityName] and
        params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:stateOrProvince] and
        params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:country] and
        params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:postalCode] and
        params[:recurringPaymentsProfileDetails][:billingStartDate] and
        params[:scheduleDetails][:description] and
        params[:scheduleDetails][:trialPeriod][:billingPeriod] and
        params[:scheduleDetails][:trialPeriod][:billingFrequency] and
        params[:scheduleDetails][:trialPeriod][:totalBillingCycles] and
        params[:scheduleDetails][:paymentPeriod][:billingPeriod] and
        params[:scheduleDetails][:paymentPeriod][:billingFrequency] and
        params[:scheduleDetails][:paymentPeriod][:totalBillingCycles] and
        params[:scheduleDetails][:paymentPeriod][:amount][:currencyId] and
        params[:scheduleDetails][:paymentPeriod][:amount][:value] and
        params[:scheduleDetails][:maxFailedPayments] and
        params[:scheduleDetails][:activationDetails][:failedInitialAmountAction] and
        params[:scheduleDetails][:autoBillOutstandingAmount]

        @api = PayPal::SDK::Merchant::API.new

        # Build request object
        @create_recurring_payments_profile = @api.build_create_recurring_payments_profile({
          :CreateRecurringPaymentsProfileRequestDetails => {
            :CreditCard => {
              :CreditCardType => params[:creditCard][:type].to_s,
              :CreditCardNumber => params[:creditCard][:number].to_s,
              :ExpMonth => params[:creditCard][:expMonth].to_i,
              :ExpYear => params[:creditCard][:expYear].to_i,
              :CVV2 => params[:creditCard][:ccv2].to_s },
            :RecurringPaymentsProfileDetails => {
              :SubscriberShippingAddress => {
                :Name => params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:name].to_s,
                :Street1 => params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:street].to_s,
                :CityName => params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:cityName].to_s,
                :StateOrProvince => params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:stateOrProvince].to_s,
                :Country => params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:country].to_s,
                :PostalCode => params[:recurringPaymentsProfileDetails][:subcriberShippingAddress][:postalCode].to_s },
              :BillingStartDate => params[:recurringPaymentsProfileDetails][:billingStartDate].to_s },
            :ScheduleDetails => {
              :Description => params[:scheduleDetails][:description].to_s,
              :TrialPeriod => {
                :BillingPeriod => params[:scheduleDetails][:trialPeriod][:billingPeriod].to_s,
                :BillingFrequency => params[:scheduleDetails][:trialPeriod][:billingFrequency].to_i,
                :TotalBillingCycles => params[:scheduleDetails][:trialPeriod][:totalBillingCycles].to_i },
              :PaymentPeriod => {
                :BillingPeriod => params[:scheduleDetails][:paymentPeriod][:billingPeriod].to_s,
                :BillingFrequency => params[:scheduleDetails][:paymentPeriod][:billingFrequency].to_i,
                :TotalBillingCycles => params[:scheduleDetails][:paymentPeriod][:totalBillingCycles].to_i,
                :Amount => {
                  :currencyID => params[:scheduleDetails][:paymentPeriod][:amount][:currencyId].to_s,
                  :value => params[:scheduleDetails][:paymentPeriod][:amount][:value].to_s } },
              :MaxFailedPayments => params[:scheduleDetails][:maxFailedPayments].to_i,
              :ActivationDetails => {
                :FailedInitialAmountAction => params[:scheduleDetails][:activationDetails][:failedInitialAmountAction].to_s },
              :AutoBillOutstandingAmount => params[:scheduleDetails][:autoBillOutstandingAmount].to_s } } })

        # Make API call & get response
        @response = @api.create_recurring_payments_profile(@create_recurring_payments_profile)

        # Access Response
        if @response.success?
          return @response
          # there are :
            # @response.Timestamp
            # @response.Ack
            # @response.CorrelationID
            # @response.Version
            # @response.Build
            # @response.CreateRecurringPaymentsProfileResponseDetails.ProfileID
            # @response.CreateRecurringPaymentsProfileResponseDetails.ProfileStatus
        else
          return @response.Errors
        end
      else
        return 'please check your params'
      end
    end
  end
end