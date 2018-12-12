class WebhookController < ApplicationController
  def clearbit
    webhook = Clearbit::Webhook.new(env)

    # case webhook.type
    # when 'company'
      company = Company.find(webhook.id)
      company.data = webhook.body.merge({ from_webhook: webhook.class.to_s, type: webhook.type })
      company.domain = webhook.body[:domain]
      company.unknown = webhook.status == 404
      company.save
    # end

    head 200
  end
end
