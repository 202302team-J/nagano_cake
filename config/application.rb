require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaganoCake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.i18n.default_locale = :ja
    # Configuration for the application, engines, and railties goes here.
    
    #バリデーションをかける際にレイアウト崩れを防ぐための追記
    #自動で読み込まれるfield_with_errorsタグを読み込まないように設定
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # タイムゾーンを東京に
    config.time_zone = "Tokyo"
    # タイムスタンプを現地時間(サーバーの時間)に合わせる
    config.active_record.default_timezone = :local
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
