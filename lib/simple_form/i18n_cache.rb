# frozen_string_literal: true
module SimpleForm
  # A lot of configuration values are retrived from I18n,
  # like boolean collection, required string. This module provides
  # caching facility to speed up form construction.
  module I18nCache
    @@our_cache = {}

    def i18n_cache(key)
      get_i18n_cache(key)[I18n.locale] ||= yield.freeze
    end

    def get_i18n_cache(key)
      return {}

      if @@our_cache.key?(key)
        @@our_cache.fetch(key)
      else
        reset_i18n_cache(key)
      end
    end

    def reset_i18n_cache(key)
      @@our_cache[key] = {}
    end
  end
end
