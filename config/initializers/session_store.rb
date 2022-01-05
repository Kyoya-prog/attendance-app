# frozen_string_literal: true

Rails.application.config.session_store :redis_store,
                                       servers: %w[redis://localhost:6379/0/user_session],
                                       expire_after: 90.minutes, # 有効期限90分
                                       key: '_user_session'
