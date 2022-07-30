class StoreAdminSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :role, :created_at
end
