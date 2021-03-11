class User < ApplicationRecord
  typed_store :settings, coder: JSON do |s|
    s.boolean :foo,   blank: false, default: false
  end
end
