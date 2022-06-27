class Fake
  def self.gcash_auth
    {
      attributes: {
        amount: 100_000,
        redirect: {
          success: 'https://webhook.site/2273af0c-9b82-4761-9356-f26bff6b79ed',
          failed: 'https://webhook.site/2273af0c-9b82-4761-9356-f26bff6b79ed'
        },
        billing: {
          address: {
            line1: 123,
            line2: 123,
            postal_code: 4024,
            city: 'binan',
            country: 'PH'
          },
          name: 'name',
          phone: '09795078452',
          email: 'test@gmail.com'
        },
        type: 'gcash',
        currency: 'PHP'
      }
    }
  end

  def self.payment_info(id:)
    {
      attributes: {
        amount: 100_000,
        source: {
          id:,
          type: 'source'
        },
        currency: 'PHP',
        statement_descriptor: 'qwe',
        description: 'qwe'
      }
    }
  end
end
