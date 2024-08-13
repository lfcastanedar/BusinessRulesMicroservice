# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_03_29_034454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "complaint_participants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "neighborhood"
    t.string "address"
    t.string "telephone"
    t.string "mobile"
    t.string "email"
    t.string "age"
    t.string "occupation"
    t.boolean "displaced"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "document_id"
    t.uuid "document_type_id"
    t.uuid "person_type_id"
    t.uuid "relationship_type_id"
    t.uuid "health_promoting_entity_id"
    t.string "dni"
    t.index ["document_id"], name: "index_complaint_participants_on_document_id"
    t.index ["document_type_id"], name: "index_complaint_participants_on_document_type_id"
    t.index ["health_promoting_entity_id"], name: "index_complaint_participants_on_health_promoting_entity_id"
    t.index ["person_type_id"], name: "index_complaint_participants_on_person_type_id"
    t.index ["relationship_type_id"], name: "index_complaint_participants_on_relationship_type_id"
  end

  create_table "control_pages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "hash_code"
    t.string "hash_algorithm"
    t.string "format"
    t.string "origen"
    t.string "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "document_id"
    t.uuid "page_control_type_id"
    t.index ["document_id"], name: "index_control_pages_on_document_id"
    t.index ["page_control_type_id"], name: "index_control_pages_on_page_control_type_id"
  end

  create_table "document_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
  end

  create_table "documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "step_id"
    t.uuid "model_page_id"
    t.string "document_number"
    t.uuid "user_id"
    t.uuid "family_commissary_id"
    t.index ["family_commissary_id"], name: "index_documents_on_family_commissary_id"
    t.index ["model_page_id"], name: "index_documents_on_model_page_id"
    t.index ["step_id"], name: "index_documents_on_step_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "family_commissaries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "health_promoting_entities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "model_pages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
  end

  create_table "page_control_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
  end

  create_table "person_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
  end

  create_table "relationship_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "role_id"
    t.uuid "permission_id"
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.string "url"
    t.integer "orden"
  end

  create_table "sidebars", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "icon"
    t.string "path"
    t.uuid "sidebar_id"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "permission_id"
    t.index ["permission_id"], name: "index_sidebars_on_permission_id"
  end

  create_table "smart_contracts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "version"
    t.boolean "active"
    t.string "type"
    t.text "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "steps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "jti"
    t.uuid "role_id"
    t.uuid "family_commissary_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["family_commissary_id"], name: "index_users_on_family_commissary_id"
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "work_flow_histories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "address"
    t.uuid "previos_step"
    t.uuid "next_step"
    t.text "comment"
    t.string "created_by"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_flow_steps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "previos_step"
    t.uuid "next_step"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "model_page_id"
    t.index ["model_page_id"], name: "index_work_flow_steps_on_model_page_id"
  end

  add_foreign_key "complaint_participants", "document_types"
  add_foreign_key "complaint_participants", "documents"
  add_foreign_key "complaint_participants", "health_promoting_entities"
  add_foreign_key "complaint_participants", "person_types"
  add_foreign_key "complaint_participants", "relationship_types"
  add_foreign_key "control_pages", "documents"
  add_foreign_key "control_pages", "page_control_types"
  add_foreign_key "documents", "family_commissaries"
  add_foreign_key "documents", "model_pages"
  add_foreign_key "documents", "steps"
  add_foreign_key "documents", "users"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "sidebars", "permissions"
  add_foreign_key "users", "family_commissaries"
  add_foreign_key "users", "roles"
  add_foreign_key "work_flow_steps", "model_pages"
end
