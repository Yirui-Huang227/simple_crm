    # Only allow a list of trusted parameters through.
    def customer_params
      params.expect(customer: [ :full_name, :phone_number, :email_address, :notes, :image ])
    end