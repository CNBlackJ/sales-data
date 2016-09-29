require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WechatWeb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # 设置运行测试是不与db/schema.rb一致
    config.active_record.maintain_test_schema = false

    config.cache_store = :redis_store, "redis://localhost:6379/0/cache", {expires_in: 90.minutes}

    # config.browserify_rails.commandline_options = ["-t vueify --extension=\".vue\"",
    #                                                "-t coffeeify --extension=\".module.coffee\""]
  end
end
